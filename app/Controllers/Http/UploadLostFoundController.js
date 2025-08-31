// const Application = use('Adonis/Src/Application')

// class UploadController {
//   async store({ request, response }) {
//     const image = request.file('image', {
//       size: '2mb',
//       extnames: ['jpg', 'png', 'jpeg'],
//     })

//     if (!image) {
//       return response.badRequest({ message: 'No file uploaded' })
//     }

//     const fileName = `${new Date().getTime()}.${image.extname}`

//     await image.move(Application.publicPath('img'), {
//       name: fileName,
//       overwrite: true,
//     })

//     return {
//       message: 'Upload success',
//       filePath: `/img/${fileName}`,
//     }
//   }
// }

// module.exports = UploadController

// app/Controllers/Http/UploadController.js
'use strict'

const Helpers = use('Helpers')

class UploadController {
  async store({ request, response }) {
    const image = request.file('gambar', {
      types: ['image'],
      size: '2mb',
      extnames: ['jpg', 'png', 'jpeg']
    })

    if (!image) {
      return response.status(400).json({
        success: false,
        message: 'File gambar harus diupload'
      })
    }

    const fileName = `${new Date().getTime()}-${image.clientName}`

    try {
      await image.move(Helpers.publicPath('img'), {
        name: fileName,
        overwrite: true
      })

      if (!image.moved()) {
        return response.status(500).json({
          success: false,
          message: 'Gagal menyimpan gambar',
          error: image.error()
        })
      }

      return response.json({
        success: true,
        data: {
          path: `/img/${fileName}`
        }
      })

    } catch (error) {
      return response.status(500).json({
        success: false,
        message: 'Terjadi kesalahan saat upload',
        error: error.message
      })
    }
  }
}

module.exports = UploadController