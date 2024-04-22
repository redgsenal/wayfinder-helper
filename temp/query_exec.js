let pool = require('./conn_pool.js');
console.log("connecting to db");
pool.getConnection(function (err, connection) {
    if (err) {
        return console.error(err);
    }
    console.log("db connected");
    // execute query
    // ...
    connection.release();
    connection.destroy();
    console.log("db release and destroy");
});