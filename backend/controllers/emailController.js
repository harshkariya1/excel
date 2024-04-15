const nodemailer = require('nodemailer');

function sendEmail(rowsInserted, fileName,recipientEmail) {
  const transporter = nodemailer.createTransport({
    service: "gmail",
    host: "smtp.gmail.com",
    port: 465,
    secure: true,
    auth: {
        user: "hkariya.netclues@gmail.com",
        pass: "nmsm oasu wilg jfab"
    }
  });

  const mailOptions = {
    from: 'hkariya.netclues@gmail.com',
    to: recipientEmail,
    subject: 'Excel Data Inserted Successfully',
    text: `${rowsInserted} rows inserted from file ${fileName} at ${new Date()}`
  };

  transporter.sendMail(mailOptions, (err, info) => {
    if (err) {
      console.error('Error sending email:', err);
    } else {
      console.log('Email sent:', info.response);
    }
  });
}

module.exports = {
  sendUploadEmail(rowsInserted, fileName,recipientEmail) {
    sendEmail(rowsInserted, fileName,recipientEmail);
  }
};
