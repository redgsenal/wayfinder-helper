/*
let config = {
    host: 'localhost',
    user: 'root',
    port: '3083',
    password: 'sayplease',
    database: 'gbb_wayfinder',
    connectionLimit: 10
};
*/
let config = {
    host: 'gbb-wayfinder-helper-db-1',
    user: 'root',
    password: 'sayplease',
    database: 'gbb_wayfinder',
    connectionLimit: 10
};
let cfg = JSON.parse(JSON.stringify(config));
cfg["password"] = "***";
console.log("-> | file: config.js | line 9 | config", cfg);
module.exports = config;
