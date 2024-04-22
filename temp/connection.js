let mysql = require('mysql2');
let config = require('./config.js');
let connection = mysql.createConnection(config);

connection.connect(function (err) {
    if (err) {
        return console.erroror('error: ' + err.message);
    }
    console.log('Connected to the MySQL server.');
});
module.exports = connection;