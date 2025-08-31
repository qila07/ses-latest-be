// // app/Controllers/Http/UploadController.js
// import { v4 as uuidv4 } from 'uuid'
// import Drive from '@ioc:Adonis/Core/Drive'

// export default class UploadController {
//   async store({ request, response }) {
//     const image = request.file('image', {
//       extnames: ['jpg', 'png', 'jpeg'],
//       size: '2mb',
//     })

//     if (!image) {
//       return response.status(400).send({ message: 'No image uploaded' })
//     }

//     const filename = `${uuidv4()}.${image.extname}`
//     await image.move('./public/img', { name: filename })

//     return response.status(200).send({
//       message: 'Upload success',
//       imageUrl: `/img/${filename}`,
//     })
//   }
// }

const path = require("path");
const multer = require("multer");

// Tentukan storage
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, path.join(__dirname, "../public/img"));
  },
  filename: (req, file, cb) => {
    const uniqueName = Date.now() + "-" + file.originalname.replace(/\s/g, "_");
    cb(null, uniqueName);
  },
});

const upload = multer({ storage }).single("gambar");

const uploadImage = (req, res) => {
  upload(req, res, (err) => {
    if (err) {
      console.error("Upload Error:", err);
      return res.status(500).json({ error: "Upload failed" });
    }

    if (!req.file) {
      return res.status(400).json({ error: "No file uploaded" });
    }

    const imageUrl = `/img/${req.file.filename}`;
    res.status(200).json({ imageUrl });
  });
};

module.exports = { uploadImage };
