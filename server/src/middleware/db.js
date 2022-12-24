require("dotenv").config();

const mysql = require("mysql");

const createConnection = (req, res, next) => {
  const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
  });

  req.db = db;
  next();
};

module.exports = createConnection;
