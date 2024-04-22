'use strict';
// extract the JSON data
const config = require('./config.js');
const JsonReader = require('./json_reader.js');
const ConnPool = require('./conn_pool.js');
const WayFinderHelper = require('./wayfinder_helper');

const jsonFeatures = new JsonReader('data/gbb-data.json');
const connPool = new ConnPool();
class Features {
    constructor() {
        this.features = jsonFeatures.JSONData.features;
    }

    getFeatures = function () {
        return this.features;
    }

    truncateFeatures = async function () {
        let sql = `CALL ${config.database}.sp_trunc_locations();`;
        let r = await WayFinderHelper.execQuery(connPool.conn, sql);
        console.log("truncate locations done");
    }

    insertFeatures = async function () {
        let loopr = function (features) {
            console.log("looper here");
            let conn = connPool.conn;
            features.forEach(async function (v, i) {
                let propdata = v.properties;
                let id = propdata.id;
                let locationType = v.type;
                let name = propdata.name;
                let iconPath = propdata.customIcon.icon;
                let category = propdata.category;
                let subCategory = propdata.subCategory;
                let website = propdata.website;
                let popupContent = WayFinderHelper.sanitizeText(propdata.popupContent);
                let openingHours = propdata.openingHours;
                let featuredImage = propdata.featuredImage;
                let detailImage = propdata.detailImage;
                let exclusivePromotion = propdata.exclusivePromotion;
                let visible = propdata.visible;
                let geometry = v.geometry;
                let coor = geometry.coordinates;
                let geotype = geometry.type;
                let lat = coor[0];
                let lon = coor[1];
                let indx = i + 1;
                let sql = `CALL ${config.database}.sp_insert_location(
                    ${id}, 
                    "${name}", 
                    "${locationType}",
                    "${iconPath}",
                    "${category}",
                    "${subCategory}",
                    "${geotype}",
                    ${lat},
                    ${lon},
                    "${website}", 
                    "${popupContent}", 
                    "${openingHours}", 
                    "${featuredImage}", 
                    "${detailImage}", 
                    "${exclusivePromotion}", 
                    ${visible});`;
                console.log("id: ", indx);
                conn.query(sql, function (err, result) {
                    if (err) {
                        console.log("error id: ", indx);
                        console.error("-> | file: features.js | Features | err", err);
                        return;
                    }
                    console.log("sp_insert_location id done: ", v);
                });
            });
            conn.end();
        };
        loopr(this.features);
    }
}
module.exports = Features;

const main = async function () {
    let features = new Features();
    console.log("Features ", features.features.length);
    await features.truncateFeatures();
    await features.insertFeatures();
}

main();
