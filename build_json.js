'use strict';
console.log('WayFinder DB');
const fs = require('fs');
const config = require('./config.js');

const ConnPool = require('./conn_pool.js');
const JsonReader = require('./json_reader.js');
const WayFinderHelper = require('./wayfinder_helper');

const jsonGBBData = new JsonReader('data/gbb-data.json');
const connPool = new ConnPool();

const defbuildpath = './build/gbb-data.json';
let buildpath = defbuildpath;

class BuildJSONData {
    constructor(buildjsonpath) {
        this.jsonData = jsonGBBData.JSONData;
        this.buildpath = defbuildpath;
        this.connPool = connPool;
        if (buildjsonpath) {
            this.buildpath = buildjsonpath;
        }
    }

    getFeaturesList = async function () {
        const sql = `SELECT * FROM ${config.database}.features_list;`
        let r = await WayFinderHelper.doQuery(connPool.conn, sql);
        console.log("fetch features list");
        return (r && r.length > 0) ? r : [];
    }

    getItineraryList = async function () {
        const sql = `SELECT * FROM ${config.database}.itineraries ORDER BY id;`
        let r = await WayFinderHelper.doQuery(connPool.conn, sql);
        console.log("fetch itinerary list");
        return (r && r.length > 0) ? r : [];
    }

    getEventsList = async function () {
        const sql = `SELECT * FROM ${config.database}.events ORDER BY id;`
        let r = await WayFinderHelper.doQuery(connPool.conn, sql);
        console.log("fetch events list");
        return (r && r.length > 0) ? r : [];
    }

    getQRLocationsList = async function () {
        const sql = `SELECT * FROM ${config.database}.qrLocations ORDER BY id;`
        let r = await WayFinderHelper.doQuery(connPool.conn, sql);
        console.log("fetch qrLocations list");
        return (r && r.length > 0) ? r : [];
    }

    getLocationCategoriesList = async function () {
        const sql = `SELECT * FROM ${config.database}.location_categories ORDER BY id;`
        let r = await WayFinderHelper.doQuery(connPool.conn, sql);
        console.log("fetch location categories list");
        return (r && r.length > 0) ? r : [];
    }

    getAdvisoryList = async function () {
        const sql = `SELECT * FROM ${config.database}.advisory ORDER BY id;`
        let r = await WayFinderHelper.doQuery(connPool.conn, sql);
        console.log("fetch advisory list");
        return (r && r.length > 0) ? r : [];
    }

    generateAdvisoryJSON = async function (jsonGBBData, advisories) {
        let jsonData = [];
        jsonData = jsonGBBData;
        return new Promise((resolve, reject) => {
            if (!jsonGBBData || jsonGBBData.length == 0) {
                reject("empty json data");
            }
            let advs = [];
            advisories.forEach(async function (v, i) {
                let adv = {};
                adv['id'] = v.id;
                adv['name'] = v.name;
                adv['locations'] = v.locations;
                let icon = {};
                icon['icon'] = v.icon;
                icon['width'] = v.width;
                icon['height'] = v.height;
                adv['advisoryIcon'] = icon;
                adv['advisoryDescription'] = v.advisoryDescription;
                adv['startDate'] = v.startDate;
                adv['endDate'] = v.endDate;
                adv['active'] = (v.active == 1);
                advs[advs.length] = adv;
            });
            jsonData['advisory'] = advs;
            console.log("-> | file: build_json.js | advisory size: ", advs.length);
            resolve(jsonData);
        });
    }

    generateLocationCategoriesJSON = async function (jsonGBBData, loccats) {
        let jsonData = [];
        jsonData = jsonGBBData;
        return new Promise((resolve, reject) => {
            if (!jsonGBBData || jsonGBBData.length == 0) {
                reject("empty json data");
            }
            let locs = [];
            loccats.forEach(async function (v, i) {
                let loc = {};
                loc['name'] = v.name;
                loc['showLabel'] = (v.showLabel == 1);
                locs[locs.length] = loc;
            });
            jsonData['locationCategories'] = locs;
            console.log("-> | file: build_json.js | locationCategories size: ", locs.length);
            resolve(jsonData);
        });
    }

    generateQRLocationsJSON = async function (jsonGBBData, qrLocations) {
        let jsonData = [];
        jsonData = jsonGBBData;
        return new Promise((resolve, reject) => {
            if (!jsonGBBData || jsonGBBData.length == 0) {
                reject("empty json data");
            }
            let locs = [];
            qrLocations.forEach(async function (v, i) {
                let loc = {};
                loc['id'] = v.id;
                loc['name'] = v.name;
                loc['eventsLocation'] = v.eventsLocation;
                loc['coordinates'] = [v.latitude, v.longitude];
                loc['icon'] = v.icon;
                loc['active'] = (v.active == 1);
                locs[locs.length] = loc;
            });
            jsonData['qrLocations'] = locs;
            console.log("-> | file: build_json.js | qrLocations size: ", locs.length);
            resolve(jsonData);
        });
    }

    generateEventsJSON = async function (jsonGBBData, eventsList) {
        let jsonData = [];
        jsonData = jsonGBBData;
        return new Promise((resolve, reject) => {
            if (!jsonGBBData || jsonGBBData.length == 0) {
                reject("empty json data");
            }
            let events = [];
            let indx = 0;
            eventsList.forEach(async function (v, i) {
                let event = {};
                if (v.extract == 1) {
                    event['id'] = String(++indx);
                    event['name'] = v.name;
                    event['location_id'] = String(v.location_id);
                    let props = {};
                    props['featuredImage'] = v.featuredImage;
                    props['detailImage'] = v.detailImage;
                    event['properties'] = props;
                    event['listingDuration'] = WayFinderHelper.sanitizeText(v.listingDuration);
                    event['openingHours'] = v.openingHours;
                    event['eventDescription'] = v.eventDescription;
                    event['openingHours'] = v.openingHours;
                    event['active'] = (v.active == 1);
                    events[events.length] = event;
                }
            });
            jsonData['events'] = events;
            console.log("-> | file: build_json.js | events size: ", events.length);
            resolve(jsonData);
        });
    }

    generateItineraryJSON = async function (jsonGBBData, itineraryList) {
        let jsonData = [];
        jsonData = jsonGBBData;
        return new Promise((resolve, reject) => {
            if (!jsonGBBData || jsonGBBData.length == 0) {
                reject("empty json data");
            }
            let itineraries = [];
            itineraryList.forEach(async function (v, i) {
                let itnr = {};
                itnr['id'] = v.id;
                itnr['name'] = v.name;
                itnr['numberOfAttractions'] = v.numberOfAttractions;
                itnr['attractions'] = v.attractions;
                itnr['image'] = v.image;
                itnr['duration'] = v.duration;
                itnr['durationCode'] = v.durationCode;
                itnr['openingHours'] = v.openingHours;
                itnr['eventDescription'] = v.eventDescription;
                itnr['active'] = (v.active == 1);
                itineraries[itineraries.length] = itnr;
            });
            jsonData['itineraries'] = itineraries;
            console.log("-> | file: build_json.js | itineraries size: ", itineraries.length);
            resolve(jsonData);
        });
    }

    generateFeaturesJSON = async function (jsonGBBData, featuresList) {
        let jsonData = [];
        jsonData = jsonGBBData;
        return new Promise((resolve, reject) => {
            if (!jsonGBBData || jsonGBBData.length == 0) {
                reject("empty json data");
            }
            let features = [];
            featuresList.forEach(async function (v, i) {
                let f = {};
                f['type'] = v.type;
                let g = {};
                g['type'] = v.geo_type;
                g['coordinates'] = [String(v.latitude), String(v.longitude)];
                f['geometry'] = g;
                let p = {};
                p['id'] = String(v.id);
                p['name'] = v.name;
                p['category'] = v.category;
                p['subCategory'] = v.subCategory;
                let icon = {};
                icon['icon'] = v.icon;
                icon['width'] = v.width;
                icon['height'] = v.height;
                p['customIcon'] = icon;
                p['website'] = v.website;
                p['popupContent'] = v.popupContent;
                p['openingHours'] = v.openingHours;
                p['featuredImage'] = v.featuredImage;
                p['detailImage'] = v.detailImage;
                p['exclusivePromotion'] = v.exclusivePromotion;
                p['visible'] = (v.visible === 'true');
                f['properties'] = p;
                f['zoomLevel'] = v.zoomLevel;
                features[features.length] = f;
            });
            jsonData['features'] = features;
            console.log("-> | file: build_json.js | line 59 | features size:", features.length)
            resolve(jsonData);
        });
    }

    writeJSONData = async function (jsonData, path) {
        // build json file removed        
        const wData = JSON.stringify(jsonData);
        // write new json file
        fs.writeFileSync(path, wData);
        console.log("write new gbb json file done...", path);
    }

    deleteJSONFile = async function () {
        let bp = buildpath;
        return new Promise((resolve, reject) => {
            fs.unlink(bp, (err) => {
                console.log("old build json file deleted");
                resolve(true);
            });
        });
    }
}
module.exports = BuildJSONData;