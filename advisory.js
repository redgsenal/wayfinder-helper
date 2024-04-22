'use strict';

// extract the JSON data
const config = require('./config.js');
const ConnPool = require('./conn_pool.js');
const JsonReader = require('./json_reader.js');
const WayFinderHelper = require('./wayfinder_helper');

const jsonFeatures = new JsonReader('data/gbb-data.json');
const connPool = new ConnPool();

class Advisory {
    constructor() {
        this.advisory = jsonFeatures.JSONData.advisory;
    }

    getItineraries() {
        return this.advisory;
    }

    truncateAdvisory = async function () {
        let sql = `TRUNCATE TABLE ${config.database}.advisory`;
        let r = await WayFinderHelper.execQuery(connPool.conn, sql);
        console.log("truncate advisory done");
    }

    insertAdvisory = async function () {
        let loopr = function (advisory) {
            let conn = connPool.conn;
            advisory.forEach(function (v, i) {
                let icon = v.advisoryIcon.icon;
                let width = v.advisoryIcon.width;
                let height = v.advisoryIcon.height;
                let advisoryDescription = WayFinderHelper.sanitizeText(v.advisoryDescription);
                let sql = `INSERT INTO ${config.database}.advisory VALUES (${v.id}, "${v.name}", "${v.locations}", "${icon}", ${width}, ${height}, "${advisoryDescription}", "${v.startDate}", "${v.endDate}", ${v.active});`;
                conn.query(sql, function (err, result) {
                    if (err) {
                        console.log("advisory error: ", err);
                        return;
                    }
                    console.log("advisory inserted: ", v.id);
                    console.log("advisory data: ", v);
                });
            });
            conn.end();
        }
        loopr(this.advisory);
    }
}

module.exports = Advisory;

const main = async function () {
    let advisory = new Advisory();
    console.log("Advisory ", advisory.advisory.length);
    await advisory.truncateAdvisory();
    await advisory.insertAdvisory();
}

main();