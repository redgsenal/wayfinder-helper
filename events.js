'use strict';

// extract the JSON data
const config = require('./config.js');
const ConnPool = require('./conn_pool.js');
const JsonReader = require('./json_reader.js');
const WayFinderHelper = require('./wayfinder_helper');

const jsonFeatures = new JsonReader('data/gbb-data.json');
const connPool = new ConnPool();

class Events {
    constructor() {
        this.events = jsonFeatures.JSONData.events;
    }

    getevents() {
        return this.events;
    }

    truncateEvents = async function () {        
        let sql = `TRUNCATE TABLE ${config.database}.events`;
        let r = await WayFinderHelper.execQuery(connPool.conn, sql);
        console.log("truncate events done");
    }

    insertEvents = async function () {
        let loopr = function(events) {
            let conn = connPool.conn;
            events.forEach(function(v, i){
                let openingHours = WayFinderHelper.sanitizeText(v.openingHours);
                let eventDescription = WayFinderHelper.sanitizeText(v.eventDescription);
                let listingDuration = WayFinderHelper.sanitizeText(v.listingDuration);
                let sql = `INSERT INTO ${config.database}.events VALUES (${v.id}, "${v.name}", ${v.location_id}, "${v.properties.featuredImage}", "${v.properties.detailImage}", "${listingDuration}", "${openingHours}", "${eventDescription}", ${v.active}, ${v.active})`;
                conn.query(sql, function (err, result) {
                    if (err) {
                        console.log("events error: ", err);
                        return;
                    }
                    console.log("event inserted: ", v.id);
                    console.log("event data: ", v);
                });
            });
            conn.end();
        }
        loopr(this.events);
    }
}

module.exports = Events;

const main = async function () {
    let events = new Events();
    console.log("Events JSON data size ", events.events.length);
    await events.truncateEvents();
    await events.insertEvents();
}

main();