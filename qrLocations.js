'use strict';

// extract the JSON data
const config = require('./config.js');
const ConnPool = require('./conn_pool.js');
const JsonReader = require('./json_reader.js');
const WayFinderHelper = require('./wayfinder_helper');

const jsonFeatures = new JsonReader('data/gbb-data.json');
const connPool = new ConnPool();

class QRLocations {
    constructor() {
        this.qrLocations = jsonFeatures.JSONData.qrLocations;
    }

    getQRLocations() {
        return this.qrLocations;
    }

    truncateQRLocations = async function () {
        let sql = `TRUNCATE TABLE ${config.database}.qrLocations`;
        let r = await WayFinderHelper.execQuery(connPool.conn, sql);
        console.log("truncate qrLocations done");
    }

    insertQRLocations = async function () {
        let loopr = function (qrLocations) {
            let conn = connPool.conn;
            qrLocations.forEach(function (v, i) {
                let sql = `INSERT INTO ${config.database}.qrLocations VALUES (${v.id}, "${v.name}", "${v.eventsLocation}", ${v.coordinates[0]}, ${v.coordinates[1]}, "${v.icon}", ${v.active});`;
                conn.query(sql, function (err, result) {
                    if (err) {
                        console.log("qrLocations error: ", err);
                        return;
                    }
                    console.log("qrLocations inserted: ", v.id);
                    console.log("qrLocations data: ", v);
                });
            });
            conn.end();
        }
        loopr(this.qrLocations);
    }
}

module.exports = QRLocations;

const main = async function () {
    const qrLocations = new QRLocations();
    console.log("qrLocations JSON data size ", qrLocations.qrLocations.length);
    await qrLocations.truncateQRLocations();
    await qrLocations.insertQRLocations();
}

main();