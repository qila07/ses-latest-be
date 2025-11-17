'use strict'

const LostFound = use('App/Models/LostFound')
const LostFoundNotif = use('App/Models/LostFoundNotif')
const LaporanPengembalian = use('App/Models/LostfoundLaporanPengembalian')
const Env = use('Env')
const webpush = require('web-push')
const Helpers = use('Helpers')
const fs = require('fs')

class LostFoundController {
  // List Lost & Found (default: Sembunyikan status Selesai)
  async getLostFound({ request, response }) {
    try {
      const category = request.input('category', null)
      const includeArchived = request.input('archived', '0') === '1'

      const query = LostFound.query()
      .select([
        'id', 'judul', 'status', 'kategori', 'lokasi', 'waktu',
        'kontak', 'deskripsi', 'ciri_ciri_unik', 'informasi_tambahan', 'gambar',
        'metode_pengembalian', 'bukti_penyerahan', 
        'created_by', 'created_at', 'updated_at'
      ])
      .with('user')

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
      return response.status(500).json({ success: false, error: 'Server error', detail: error.message })
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
        waktu, kontak, deskripsi, created_by,
        metode_pengembalian, bukti_penyerahan,
        ciri_ciri_unik, informasi_tambahan
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

      const buktiFile = request.file('bukti_penyerahan', {
        types: ['image'],
        size: '2mb',
        extnames: ['jpg', 'jpeg', 'png']
      })

      let buktiPath = null
      if (buktiFile) {
        const buktiName = `${new Date().getTime()}-bukti-${buktiFile.clientName}`
        await buktiFile.move(Helpers.publicPath('img'), { name: buktiName, overwrite: true })
        if (!buktiFile.moved()) {
          return response.status(500).json({
            success: false,
            message: 'Gagal menyimpan bukti penyerahan',
            error: buktiFile.error()
          })
        }
        buktiPath = `/img/${buktiName}`
      }

      const post = new LostFound()
      post.judul = judul
      post.status = status
      post.kategori = kategori
      post.lokasi = lokasi
      post.waktu = waktu
      post.metode_pengembalian = metode_pengembalian
      post.bukti_penyerahan = buktiPath
      post.kontak = kontak
      post.deskripsi = deskripsi
      post.ciri_ciri_unik = ciri_ciri_unik
      post.informasi_tambahan = informasi_tambahan
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

// SES-BE-KEL1-main/app/Controllers/Http/LostFoundController.js
// Di method postLaporanPengembalian, tambahkan lebih banyak logging:

async postLaporanPengembalian({ request, response }) {
  const Database = use('Database');
  let trx;

  try {
    console.log('🚀 === START POST LAPORAN PENGEMBALIAN ===');

    trx = await Database.beginTransaction();
    const data = request.all();
    console.log('📥 Data dari request.all():', data);

    // Validasi sederhana
    if (!data.lost_and_found_id) {
      return response.status(400).json({ success: false, message: 'ID barang tidak ditemukan' });
    }
    if (!data.jenis_form) {
      return response.status(400).json({ success: false, message: 'Jenis form tidak ditemukan' });
    }

    // ✅ Simpan ke database
    const laporan = await LaporanPengembalian.create({
      lost_and_found_id: data.lost_and_found_id,
      jenis_form: data.jenis_form,
      nama_lengkap: data.nama_lengkap,
      kelas: data.kelas,
      kontak_whatsapp: data.kontak_whatsapp,
      lokasi_terakhir: data.lokasi_terakhir,
      alasan_klaim: data.alasan_klaim,
      status: 'Menunggu Verifikasi' // bisa default
    }, trx);

    await trx.commit();

    console.log('✅ Laporan berhasil disimpan:', laporan.id);

    return response.status(201).json({
      success: true,
      message: 'Laporan pengembalian berhasil disimpan',
      data: laporan
    });
  } catch (error) {
    if (trx) await trx.rollback();
    console.error('❌ ERROR postLaporanPengembalian:', error);

    return response.status(500).json({
      success: false,
      message: 'Terjadi kesalahan saat mengirim laporan',
      detail: error.message
    });
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
        waktu, kontak, deskripsi, 
        metode_pengembalian,
        ciri_ciri_unik, informasi_tambahan,
        hapusBukti, hapusGambar
      } = request.all()

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

      const buktiFile = request.file('bukti_penyerahan', {
        types: ['image'],
        size: '2mb',
        extnames: ['jpg', 'jpeg', 'png']
      })

      let buktiBaruPath = null
      if (buktiFile) {
        const buktiName = `${new Date().getTime()}-bukti-${buktiFile.clientName}`
        await buktiFile.move(Helpers.publicPath('img'), { name: buktiName, overwrite: true })
        if (!buktiFile.moved()) {
          return response.status(500).json({
            success: false,
            message: 'Gagal menyimpan bukti penyerahan',
            error: buktiFile.error()
          })
        }
        buktiBaruPath = `/img/${buktiName}`
      }

      // Jika user minta hapus bukti penyerahan
      if (String(hapusBukti).toLowerCase() === 'true') {
        if (item.bukti_penyerahan) {
          try {
            const relativeOld = item.bukti_penyerahan.replace(/^\/+/, '')
            const absOld = Helpers.publicPath(relativeOld)
            if (fs.existsSync(absOld)) fs.unlinkSync(absOld)
          } catch (_) {}
        }
        item.bukti_penyerahan = null
      }
      // Jika upload baru
      else if (buktiBaruPath) {
        if (item.bukti_penyerahan) {
          try {
            const relativeOld = item.bukti_penyerahan.replace(/^\/+/, '')
            const absOld = Helpers.publicPath(relativeOld)
            if (fs.existsSync(absOld)) fs.unlinkSync(absOld)
          } catch (_) {}
        }
        item.bukti_penyerahan = buktiBaruPath
      }

      // Update field dasar
      item.judul = judul
      item.status = status
      item.kategori = kategori
      item.lokasi = lokasi
      item.waktu = waktu
      item.metode_pengembalian = metode_pengembalian
      item.kontak = kontak
      item.deskripsi = deskripsi
      item.ciri_ciri_unik = ciri_ciri_unik
      item.informasi_tambahan = informasi_tambahan

      // Logika gambar
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

  // Hapus semua postingan berstatus Selesai
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
    try {
      const item = await LostFound.query()
        .where('id', params.id)
        .select([
          'id', 'judul', 'status', 'kategori', 'lokasi', 'waktu',
          'kontak', 'deskripsi', 'ciri_ciri_unik', 'informasi_tambahan', 'gambar',
          'metode_pengembalian', 'bukti_penyerahan',
          'created_by', 'created_at', 'updated_at'
        ])
        .with('user')
        .first()

      if (!item) {
        return response.status(404).json({ success: false, message: 'Data tidak ditemukan' })
      }

      return response.json({ success: true, data: item })
    } catch (error) {
      console.error('Error getLostFoundById:', error)
      return response.status(500).json({ success: false, message: 'Server error' })
    }
  }

  // Get laporan pengembalian berdasarkan ID Lost & Found
async getLaporanByLostFoundId({ params, response }) {
  try {
    const laporan = await LaporanPengembalian.query()
      .where('lost_and_found_id', params.lostFoundId)
      .first();

    if (!laporan) {
      return response.json({
        success: true,
        data: null
      });
    }

    return response.json({
      success: true,
      data: laporan
    });
  } catch (error) {
    console.error('Error getLaporanByLostFoundId:', error);
    return response.status(500).json({
      success: false,
      message: 'Gagal mengambil data laporan'
    });
  }
}

  // Get semua laporan pengembalian (untuk admin)
  async getLaporanPengembalian({ response }) {
    try {
      const laporan = await LaporanPengembalian.query()
        .with('lostfound')
        .orderBy('created_at', 'desc')
        .fetch();

      return response.json({
        success: true,
        data: laporan
      });
    } catch (error) {
      console.error('Error getLaporanPengembalian:', error);
      return response.status(500).json({
        success: false,
        message: 'Gagal mengambil data laporan'
      });
    }
  }

  // Update status laporan pengembalian (untuk admin)
  async updateStatusLaporan({ params, request, response }) {
    const Database = use('Database');
    let trx;

    try {
      trx = await Database.beginTransaction();

      const { status } = request.all();
      const laporanId = params.id;

      const laporan = await LaporanPengembalian.find(laporanId);
      if (!laporan) {
        return response.status(404).json({
          success: false,
          message: 'Laporan tidak ditemukan'
        });
      }

      laporan.status = status;
      await laporan.save(trx);

      // Jika status disetujui, update juga status di lost_found
      if (status === 'Disetujui') {
        const lostFound = await LostFound.find(laporan.lost_and_found_id);
        if (lostFound) {
          lostFound.status = 'Selesai';
          await lostFound.save(trx);
        }
      }

      await trx.commit();

      return response.json({
        success: true,
        message: 'Status berhasil diperbarui',
        data: laporan
      });

    } catch (error) {
      if (trx) await trx.rollback();
      
      console.error('Error updateStatusLaporan:', error);
      return response.status(500).json({
        success: false,
        message: 'Gagal memperbarui status'
      });
    }
  }
}

module.exports = LostFoundController