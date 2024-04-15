const xlsx = require('xlsx');
const { Sequelize } = require('sequelize');
const emailController = require('../controllers/emailController');
// Initialize Sequelize with MySQL
const sequelize = new Sequelize('xcel', 'root', '', {
  host: 'localhost',
  dialect: 'mysql'
});

// Function to parse Excel file and extract data
function parseExcel(filePath) {
  const workbook = xlsx.readFile(filePath);
  const sheetName = workbook.SheetNames[0];
  const sheet = workbook.Sheets[sheetName];
  return xlsx.utils.sheet_to_json(sheet);
}

// Function to insert data into MySQL database
// Function to insert data into MySQL database
async function insertDataIntoDB(data) {
  try {
    // console.log(data)
    // Insert data into the database using Sequelize model
    const Product = sequelize.define('data', {
      // Define the attributes without an 'id' column
      productname: {
        type: Sequelize.STRING,
        allowNull: false
      },
      productid: {
        type: Sequelize.STRING,
        allowNull: false
      },
      sku: {
        type: Sequelize.STRING,
        allowNull: false
      },
      variantid: {
        type: Sequelize.STRING,
        allowNull: false
      },
      price: {
        type: Sequelize.DECIMAL(10, 2),
        allowNull: false
      },
      discounted_percentage: {
        type: Sequelize.DECIMAL(5, 2),
        defaultValue: 0
      },
      description: {
        type: Sequelize.TEXT
      },
      categoryid: {
        type: Sequelize.STRING,
        allowNull: false
      }
      },{
        timestamps: false // Exclude createdAt and updatedAt fields
      
    });

    // Insert the data into the database, excluding the 'id' field
    await Product.bulkCreate(data, { fields: ['productname', 'productid', 'sku', 'variantid', 'price', 'discounted_percentage', 'description' , 'categoryid'] });
  } catch (error) {
    console.error('Error inserting data into database:', error);
    throw error;
  }
}

function calculateRowsInserted(file) {
  // Assuming you have logic to calculate the number of rows inserted
  const jsonData = parseExcel(file.path);
  return jsonData.length;
}
// Export the handleUpload function
module.exports = {
  handleUpload(req, res) {
    const { file } = req;
    const recipientEmail = req.body.recipientEmail;
    // Read Excel file and extract data
    const jsonData = parseExcel(file.path);
    const rowsInserted = calculateRowsInserted(req.file);
    // Use the value of rowsInserted in your code
    console.log(`Rows inserted: ${rowsInserted}`);

    // Insert data into database
    insertDataIntoDB(jsonData);

    // Send response
    emailController.sendUploadEmail(rowsInserted, file.originalname, recipientEmail);
    res.status(200).send('File uploaded successfully');
  }
};

