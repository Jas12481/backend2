const mysql = require("mysql");
require('dotenv').config();

var properties = {
    host : process.env.DBHOST,
    user : process.env.DBUSER,
    password : process.env.DBPASSWD,
    port : process.env.DBPORT,
    database : process.env.DBNAME
};

var connection = mysql.createConnection(properties);

connection.connect((errors) => {
    if (errors) {
      console.log("Couldn't connect to the MySQL Server. Error: " + errors);
    } else {
      console.log("Connected to MySQL successfully!");
    }
});

connection.query(`select * from customer`, (error, results) => {
    if (error) {
      console.log(error);
    } else {
      console.log(results);
    }
  });

  
