'use strict';

const demo = async function () {
    for (let i = 0; i < 100; i++) {
        console.log("i ", i);
    }
    return "hey!";
}

const main = async function () {
    let r = await demo();
    console.log("r ", r);
}

buildCustomIconsList = async function () {
    let sql = `SELECT * FROM ${config.database}.locations_properties_customicons;`;
    let r = await WayFinderHelper.doQuery(connPool.conn, sql);
    console.log("fetch custom icons list");
    return (r && r.length > 0) ? r : [];
}

buildFeatureTypesList = async function () {
    let sql = `SELECT * FROM ${config.database}.locations_type;`;
    let r = await WayFinderHelper.doQuery(connPool.conn, sql);
    console.log("fetch feature types list");
    return (r && r.length > 0) ? r : [];
}

main();