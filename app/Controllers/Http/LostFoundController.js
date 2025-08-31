'use strict'

const LostFound = use('App/Models/LostFound')
const LostFoundNotif = use('App/Models/LostFoundNotif')
const Env = use('Env')
const webpush = require('web-push')
const Helpers = use('Helpers')
const fs = require('fs')

class LostFoundController {
  // List Lost & Found (default: Sembunyikan status Selesai)
  async getLostFound({ request, response }) {
    try {
      const category = request.input('category', null)
      const includeArchived = request.input('archived', '0') === '1' // ?archived=1 untuk tampilkan juga Selesai

      const query = LostFound.query()
      if (category && category !== 'Semua') {
        query.where('kategori', category)
      }
      if (!includeArchived) {
        query.where('status', '!=', 'Selesai')
      }

      const items = await query.orderBy('created_at', 'desc').fetch()
      return response.json({ success: true, data: items.toJSON() })
    } catch (error) {
      console.error('Error in getLostFound:', error)
      return response
        .status(500)
        .json({ success: false, error: 'Server error', detail: error.message })
    }
  }

  // Kategori (distinct dari DB)
  async getAllKategori({ response }) {
    try {
      const Database = use('Database')
      const kategoriList = await Database.from('lost_found').distinct('kategori').pluck('kategori')
      return response.json({ success: true, data: kategoriList })
    } catch (error) {
      return response.status(500).json({ success: false, error: 'Server error' })
    }
  }

  // Create
  async postLostFound({ request, response }) {
    try {
      const {
        judul, status, kategori, lokasi,
        waktu, kontak, deskripsi, created_by
      } = request.all()

      const image = request.file('gambar', {
        types: ['image'],
        size: '2mb',
        extnames: ['jpg', 'jpeg', 'png']
      })

      let gambarPath = null
      if (image) {
        const fileName = `${new Date().getTime()}-${image.clientName}`
        await image.move(Helpers.publicPath('img'), { name: fileName, overwrite: true })
        if (!image.moved()) {
          return response.status(500).json({
            success: false,
            message: 'Gagal menyimpan gambar',
            error: image.error()
          })
        }
        gambarPath = `/img/${fileName}`
      }

      const post = new LostFound()
      post.judul = judul
      post.status = status
      post.kategori = kategori
      post.lokasi = lokasi
      post.waktu = waktu
      post.kontak = kontak
      post.deskripsi = deskripsi
      post.gambar = gambarPath
      post.created_by = created_by

      await post.save()

      await this.sendLostFoundNotif({
        title: 'Lost & Found Baru!',
        body: post.judul,
        url: '/smartschool/lost-found'
      })

      return response.status(201).json({
        success: true,
        message: 'Berhasil membuat postingan',
        data: post.toJSON()
      })
    } catch (error) {
      console.error('postLostFound error:', error)
      return response.status(500).json({ success: false, error: 'Server error' })
    }
  }

  // Update
  async putLostFound({ params, request, response }) {
    try {
      const item = await LostFound.find(params.id)
      if (!item) {
        return response.status(404).json({ success: false, error: 'Item tidak ditemukan' })
      }

      const {
        judul, status, kategori, lokasi,
        waktu, kontak, deskripsi, hapusGambar // optional: kirim true untuk menghapus gambar manual
      } = request.all()

      // Handle upload gambar baru (opsional)
      const image = request.file('gambar', {
        types: ['image'],
        size: '2mb',
        extnames: ['jpg', 'jpeg', 'png']
      })

      let gambarBaruPath = null
      if (image) {
        const fileName = `${new Date().getTime()}-${image.clientName}`
        await image.move(Helpers.publicPath('img'), { name: fileName, overwrite: true })
        if (!image.moved()) {
          return response.status(500).json({
            success: false,
            message: 'Gagal menyimpan gambar',
            error: image.error()
          })
        }
        gambarBaruPath = `/img/${fileName}`
      }

      // Update field dasar
      item.judul = judul
      item.status = status
      item.kategori = kategori
      item.lokasi = lokasi
      item.waktu = waktu
      item.kontak = kontak
      item.deskripsi = deskripsi

      // === Logika gambar ===
      // 1) Jika user minta hapus (hapusGambar=true) → hapus file & set null
      if (String(hapusGambar).toLowerCase() === 'true') {
        if (item.gambar) {
          try {
            const relativeOld = item.gambar.replace(/^\/+/, '')
            const absOld = Helpers.publicPath(relativeOld)
            if (fs.existsSync(absOld)) fs.unlinkSync(absOld)
          } catch (_) {}
        }
        item.gambar = null
      }
      // 2) Jika upload baru → hapus file lama lalu set path baru
      else if (gambarBaruPath) {
        if (item.gambar) {
          try {
            const relativeOld = item.gambar.replace(/^\/+/, '')
            const absOld = Helpers.publicPath(relativeOld)
            if (fs.existsSync(absOld)) fs.unlinkSync(absOld)
          } catch (_) {}
        }
        item.gambar = gambarBaruPath
      }
      // 3) Jika tidak ada upload baru & tidak minta hapus → biarkan gambar lama apa adanya
      //    (termasuk saat status diubah menjadi "Selesai")

      await item.save()

      return response.json({
        success: true,
        message: 'Item berhasil diperbarui',
        data: item.toJSON()
      })
    } catch (error) {
      console.error('putLostFound error:', error)
      return response.status(500).json({ success: false, error: 'Server error', detail: error.message })
    }
  }

  // Delete
  async deleteLostFound({ params, response }) {
    try {
      const item = await LostFound.find(params.id)
      if (!item) {
        return response.status(404).json({ success: false, error: 'Item tidak ditemukan' })
      }

      try {
        if (item.gambar) {
          const relativePath = item.gambar.replace(/^\/+/, '')
          const absolutePath = Helpers.publicPath(relativePath)
          if (fs.existsSync(absolutePath)) fs.unlinkSync(absolutePath)
        }
      } catch (_) {}

      await item.delete()
      return response.json({ success: true, message: 'Item berhasil dihapus' })
    } catch (error) {
      console.error('deleteLostFound error:', error)
      return response.status(500).json({ success: false, error: 'Server error' })
    }
  }

  // Hapus semua postingan berstatus Selesai beserta file gambarnya (opsional admin tool)
  async purgeArchived({ response }) {
    try {
      const archived = await LostFound.query().where('status', 'Selesai').fetch()
      const rows = archived.rows || []
      let deleted = 0

      for (const item of rows) {
        try {
          if (item.gambar) {
            const relativePath = item.gambar.replace(/^\/+/, '')
            const absolutePath = Helpers.publicPath(relativePath)
            if (fs.existsSync(absolutePath)) fs.unlinkSync(absolutePath)
          }
        } catch (_) {}
        await item.delete()
        deleted += 1
      }

      return response.json({ success: true, message: 'Arsip dihapus', deleted })
    } catch (error) {
      console.error('purgeArchived error:', error)
      return response.status(500).json({ success: false, error: 'Server error' })
    }
  }

  // Simpan subscription push
  async saveSubscription({ request, response }) {
    try {
      const subscription = request.input('subscription')
      await LostFoundNotif.create({ subscription: JSON.stringify(subscription) })
      return response.json({ success: true })
    } catch (error) {
      return response.status(500).json({ success: false, error: 'Gagal menyimpan subscription' })
    }
  }

  // Kirim push ke semua subscriber
  async sendLostFoundNotif(payloadObj) {
    webpush.setVapidDetails(
      'mailto:youremail@example.com',
      Env.get('VAPID_PUBLIC_KEY'),
      Env.get('VAPID_PRIVATE_KEY')
    )

    const subscriptions = await LostFoundNotif.all()
    const payload = JSON.stringify(payloadObj)

    for (let sub of subscriptions.rows) {
      try {
        await webpush.sendNotification(JSON.parse(sub.subscription), payload)
      } catch (err) {
        // optional: handle invalid subs
      }
    }
  }

  // Detail by ID
  async getLostFoundById({ params, response }) {
    const item = await LostFound.query().where('id', params.id).with('user').first()

    if (!item) {
      return response.status(404).json({ success: false, message: 'Data tidak ditemukan' })
    }

    return response.ok({ success: true, data: item.toJSON() })
  }
}

module.exports = LostFoundController
