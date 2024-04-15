const xlsx = require('xlsx');
const nodemailer = require('nodemailer');
const { Sequelize } = require('sequelize');

// Initialize Sequelize with MySQL
const sequelize = new Sequelize('xcel', 'root', '', {
  host: 'localhost',
  dialect: 'mysql',
  pool: {
    max: 10,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
});

exports.exportData = async (req, res) => {
  try {
    // Fetch recipient email from form-data
    const recipientEmail = req.body.recipientEmail;
    console.log(req.body);
    if (!recipientEmail) {
        return res.status(400).send('Recipient email is missing');
      }
      

    // Fetch data from database with required fields and join operation
    const query = `
      SELECT 
        d.productname, 
        d.productid, 
        d.sku, 
        d.variantid, 
        d.price, 
        d.discounted_percentage, 
        d.description, 
        c.categoryname
      FROM data d
      INNER JOIN category c ON d.category = c.categoryid
    `;
    
    // Execute the query using async/await
    const [results, metadata] = await sequelize.query(query);

    // Calculate discounted price and add it as a new column
    results.forEach(item => {
      item.discounted_price = item.price * (1 - item.discounted_percentage / 100);
    });

    // Convert data to Excel file
    const workbook = xlsx.utils.book_new();
    const worksheet = xlsx.utils.json_to_sheet(results);
    xlsx.utils.book_append_sheet(workbook, worksheet, 'Data');
    const excelBuffer = xlsx.write(workbook, { type: 'buffer', bookType: 'xlsx' });

    // Send email with attachment
    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: "hkariya.netclues@gmail.com",
        pass: "nmsm oasu wilg jfab"
      }
    });

    const mailOptions = {
      from:"hkariya.netclues@gmail.com",
      to: recipientEmail,
      subject: 'Data Export',
      text: 'Please find the attached Excel file.',
      attachments: [
        {
          filename: `data_export_${new Date().toISOString().replace(/:/g, '-')}.xlsx`,
          content: excelBuffer
        }
      ]
    };

    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        console.error('Error sending email:', error);
        res.status(500).send('Error sending email');
      } else {
        console.log('Email sent:', info.response);
        res.status(200).send('Email sent successfully');
      }
    });
  } catch (error) {
    console.error('Error exporting data:', error);
    res.status(500).send('Error exporting data');
  }
};
