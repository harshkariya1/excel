const express = require('express');
const multer = require('multer');
const bodyParser = require('body-parser');
const uploadController = require('./controllers/uploadController');
// const emailController = require('../controllers/emailController');
const exportController = require('./controllers/exportController')

const app = express();
const PORT = process.env.PORT || 3000;

// Multer setup
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, './uploads/');
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  }
});
const upload = multer({ storage: storage });

// Express routes
app.post('/upload', upload.single('file'), uploadController.handleUpload);

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.post('/export', exportController.exportData);
// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
