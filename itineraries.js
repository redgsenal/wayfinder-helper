'use strict';

// extract the JSON data
const config = require('./config.js');
const ConnPool = require('./conn_pool.js');
const JsonReader = require('./json_reader.js');
const WayFinderHelper = require('./wayfinder_helper');

const jsonFeatures = new JsonReader('data/gbb-data.json');
const connPool = new ConnPool();

class Itineraries {
    constructor() {
        this.itineraries = jsonFeatures.JSONData.itineraries;
    }

    getItineraries() {
        return this.itineraries;
    }

    truncateItineraries = async function () {
        let sql = `TRUNCATE TABLE ${config.database}.itineraries`;
        let r = await WayFinderHelper.execQuery(connPool.conn, sql);
        console.log("truncate itineraries done");
    }

    insertItineraries = async function () {
        let loopr = function (itineraries) {
            let conn = connPool.conn;
            itineraries.forEach(function (v, i) {
                let sql = `INSERT INTO ${config.database}.itineraries VALUES (${v.id}, "${v.name}", ${v.numberOfAttractions}, "${v.attractions}", "${v.image}", "${v.duration}", ${v.durationCode}, "${v.openingHours}", "${v.eventDescription}", ${v.active});`;
                conn.query(sql, function (err, result) {
                    if (err) {
                        console.log("itineraries error: ", err);
                        return;
                    }
                    console.log("itinerary inserted: ", v.id);
                    console.log("itinerary data: ", v);
                });
            });
            conn.end();
        }
        loopr(this.itineraries);
    }
}

module.exports = Itineraries;

const main = async function () {
    let itnrs = new Itineraries();
    console.log("Iteneraries ", itnrs.itineraries.length);
    await itnrs.truncateItineraries();
    await itnrs.insertItineraries();
}

main();