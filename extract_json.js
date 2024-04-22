'use strict';
console.log('Extract Wayfinder JSON');
const BuildJSONData = require('./build_json.js');
/* const fs = require('fs');
const config = require('./config.js');

const ConnPool = require('./conn_pool.js');
const JsonReader = require('./json_reader.js');
const WayFinderHelper = require('./wayfinder_helper');

const jsonGBBData = new JsonReader('data/gbb-data.json');
const connPool = new ConnPool();

const defbuildpath = './build/gbb-data.json';
let buildpath = defbuildpath; */

const buildJSONData = new BuildJSONData();

const main = async function () {
    let buildJSONData = new BuildJSONData();
    await buildJSONData.deleteJSONFile().then((v) => {
        console.log("generate JSON here");
    }).catch((v) => {
        console.log("unable to delete build JSON file aa");
    });
    let featuresList = await buildJSONData.getFeaturesList();
    let itineraryList = await buildJSONData.getItineraryList();
    let eventsList = await buildJSONData.getEventsList();
    let qrLocations = await buildJSONData.getQRLocationsList();
    let locationCategories = await buildJSONData.getLocationCategoriesList();
    let advisories = await buildJSONData.getAdvisoryList();
    buildJSONData.connPool.conn.end();
    buildJSONData.generateFeaturesJSON(buildJSONData.jsonData, featuresList).then((v) => {
        buildJSONData.generateItineraryJSON(v, itineraryList).then((v2) => {
            buildJSONData.generateEventsJSON(v2, eventsList).then((v3) => {
                buildJSONData.generateQRLocationsJSON(v3, qrLocations).then((v4) => {
                    buildJSONData.generateLocationCategoriesJSON(v4, locationCategories).then((v5) => {
                        buildJSONData.generateAdvisoryJSON(v5, advisories).then((v6) => {
                            buildJSONData.writeJSONData(v6, buildJSONData.buildpath);
                            console.log("build json file done");
                        });
                    });
                });
            });
        });
    }).catch((rej) => {
        console.log("unable to build json data");
    });
}

main();