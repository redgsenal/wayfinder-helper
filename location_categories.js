'use strict';

// extract the JSON data
const config = require('./config.js');
const ConnPool = require('./conn_pool.js');
const JsonReader = require('./json_reader.js');
const WayFinderHelper = require('./wayfinder_helper');

const jsonFeatures = new JsonReader('data/gbb-data.json');
const connPool = new ConnPool();

class LocationCategories {
    constructor() {
        this.locationCategories = jsonFeatures.JSONData.locationCategories;
    }

    getLocationCategories() {
        return this.locationCategories;
    }

    truncateLocationCategories = async function () {
        let sql = `CALL ${config.database}.sp_trunc_location_categories();`;
        let r = await WayFinderHelper.doQuery(connPool.conn, sql);
        console.log("truncate location categories done");
    }

    insertLocationCategories = async function () {
        let loopr = function (locationCategories) {
            let conn = connPool.conn;
            locationCategories.forEach(function (v, i) {
                let id = i + 1;
                let sql = `INSERT INTO ${config.database}.location_categories VALUES (${id}, "${v.name}", ${v.showLabel}) `;
                conn.query(sql, function (err, result) {
                    if (err) {
                        console.error("location categories error: ", err);
                        return;
                    }
                    console.log("location categories inserted: ", id);
                    console.log("location categories data: ", v);
                });
            });
            conn.end();
        };
        loopr(this.locationCategories);
    }
}

module.exports = LocationCategories;

const main = async function () {
    let itnrs = new LocationCategories();
    console.log("Location Categories ", itnrs.locationCategories.length);
    await itnrs.truncateLocationCategories();
    await itnrs.insertLocationCategories();
}

main();