'use strict';
console.log('WayFinder DB');
let instance = null;
const config = require('./config.js');
const ConnPool = require('./conn_pool.js');
class WayFinderDB {
    constructor(jsonData) {
        if (!jsonData || jsonData !== null) {
            console.log("-> | file: wayfinder_db.js | line 6 | WayFinderDB | constructor | found jsonData");
        }
        this.jsonData = jsonData;
        this.connPool = new ConnPool();
    }

    static sanitizeText = function (t) {
        return t.replaceAll(/(\r\n|\n|\r)/gm, "").replaceAll('"', '\\"');

    }

    static insertLocationData = function (params) {
        return new Promise((resolve, reject) => {
            let connPool = params.connPool;
            let propdata = params.data.properties;
            let id = propdata.id;
            let featureId = params.featureId;
            let zoomLevel = params.data.zoomLevel;
            connPool.pool.getConnection(function (err, conn) {
                if (err) {
                    console.log("-> | file: wayfinder_db.js |  WayFinderDB | err", err)
                    reject("Error insert location data ");
                    return;
                }
                console.log("-> | file: wayfinder_db.js | WayFinderDB | insertLocationData | params", params);
                let sql = `INSERT INTO ${config.database}.locations (id, type, geometry, properties, zoomLevel)VALUES (${id}, ${featureId}, ${id}, ${id}, ${zoomLevel});`;
                conn.query(sql, function (err, result) {
                    if (err) {
                        console.error("-> | file: wayfinder_db.js | WayFinderDB | err", err);
                        reject("Error insert property data ", propdata);
                        ConnPool.close(conn);
                        return;
                    }
                    if (result.affectedRows > 0) {
                        console.log("-> | file: wayfinder_db.js | WayFinderDB | locationb data inserted: ");
                    }
                    ConnPool.close(conn);
                    resolve(params);
                });
            });
        });
    }

    static insertPropertyData = function (params) {
        return new Promise((resolve, reject) => {
            let connPool = params.connPool;
            let propdata = params.data.properties;
            let id = propdata.id;
            let name = propdata.name;
            let category = propdata.category;
            let subCategory = propdata.subCategory;
            let customIconId = params.customIconId;
            let website = propdata.website;
            let popupContent = WayFinderDB.sanitizeText(propdata.popupContent);
            let openingHours = propdata.openingHours;
            let featuredImage = propdata.featuredImage;
            let detailImage = propdata.detailImage;
            let exclusivePromotion = propdata.exclusivePromotion;
            let visible = propdata.visible;
            connPool.pool.getConnection(function (err, conn) {
                if (err) {
                    console.log("-> | file: wayfinder_db.js | WayFinderDB | err", err);
                    reject("Error insert property data ");
                    return;
                }
                let sql = `INSERT INTO ${config.database}.locations_properties VALUES (${id}, "${name}", "${category}", "${subCategory}", ${customIconId}, "${website}", "${popupContent}", "${openingHours}", "${featuredImage}", "${detailImage}", "${exclusivePromotion}", ${visible});`;
                conn.query(sql, function (err, result) {
                    if (err) {
                        console.error("-> | file: wayfinder_db.js | WayFinderDB | err", err)
                        reject("Error insert property data ", propdata);
                        ConnPool.close(conn);
                        return;
                    }
                    if (result.affectedRows > 0) {
                        console.log("-> | file: wayfinder_db.js | WayFinderDB | property data inserted: ");
                    }
                    ConnPool.close(conn);
                    resolve(params);
                });
            });
        });
    }

    static insertGeometryData = function (params) {
        return new Promise((resolve, reject) => {
            let data = params.data;
            let geometry = data.geometry;
            let geometryId = data.properties.id;
            let coor = geometry.coordinates;
            let type = geometry.type;
            let lat = coor[0];
            let lon = coor[1];
            let connPool = params.connPool;
            console.log("-> | file: wayfinder_db.js | line 25 | WayFinderDB | returnnewPromise | params", params);
            connPool.pool.getConnection(function (err, conn) {
                if (err) {
                    console.error("-> | file: wayfinder_db.js | line 27 | WayFinderDB | err", err);
                    reject("Error insert geometry data ");
                    return;
                }
                console.log("-> | file: wayfinder_db.js | line 31 | WayFinderDB | inserting geometryId: ", geometryId);
                let sql = `INSERT INTO ${config.database}.locations_geometry VALUES (${geometryId}, "${type}", "${lat}", "${lon}");`;
                conn.query(sql, function (err, result) {
                    if (err) {
                        console.error("-> | file: wayfinder_db.js | line 35 | WayFinderDB | err", err)
                        reject("Error insert geometry data ", geometry);
                        ConnPool.close(conn);
                        return;
                    }
                    if (result.affectedRows > 0) {
                        console.log("-> | file: wayfinder_db.js | line 41 | WayFinderDB | geometry data inserted: ", geometry);
                    }
                    ConnPool.close(conn);
                    resolve(params);
                });
            });
        });
    }

    static getCustomIconId = function (params) {
        return new Promise((resolve, reject) => {
            if (!params) {
                console.error("-> | file: wayfinder_db.js | line 53 | WayFinderDB | param is invalid");
                reject("param data is invalid");
                return;
            }
            let icon = params.data.properties.customIcon.icon;
            console.log("-> | file: wayfinder_db.js | line 59 | WayFinderDB | icon", icon)
            params.customIcons.forEach(function (v, i) {
                if (icon.toLowerCase() == v.icon.toLowerCase()) {
                    params['customIconId'] = v.id;
                    resolve(params);
                }
            });
        });
    }

    static getFeatureTypeId = function (params) {
        return new Promise((resolve, reject) => {
            let r = 1;
            let featureTypes = params.featureTypes;
            let type = params.data.type;
            params['featureId'] = 1;
            if (!featureTypes || !type) {
                resolve(params);
            }
            featureTypes.forEach(function (v, i) {
                if (type.toLowerCase() == v.type.toLowerCase()) {
                    params['featureId'] = v.id;
                }
            });
            resolve(params);
        });
    }

    static insertFeatureData = function (params) {
        return new Promise((resolve, reject) => {
            if (!params) {
                console.error("-> | file: wayfinder_db.js | line 74 | WayFinderDB | param is invalid");
                reject("param data is invalid");
                return;
            }
            let connPool = params.connPool;
            let data = params.data;
            let indx = params.data.properties.id;
            let params2 = [];
            params2['connPool'] = params.connPool;
            params2['featureTypes'] = params.featureTypes;
            params2['data'] = params.data;
            params2['indx'] = params.data.properties.id;
            params2['customIcons'] = params.customIcons;
            console.log("-> | file: wayfinder_db.js | line 86 | WayFinderDB | insert feature data indx: ", indx);
            WayFinderDB.getFeatureTypeId(params2).then(function (resolv) {
                WayFinderDB.getCustomIconId(params2).then(function (resolv) {
                    WayFinderDB.insertGeometryData(resolv).then(function (resolv2) {
                        console.log("geometry data insert done...", resolv2.indx);
                        WayFinderDB.insertPropertyData(resolv2).then(function (resolv3) {
                            console.log("property data insert done...", resolv3.indx);
                            WayFinderDB.insertLocationData(resolv3).then(function (resolv4) {
                                console.log("location data insert done...", resolv4.indx);
                                resolve(1);
                            }).catch(function (rej) {
                                console.log("reject ", rej);
                                reject(rej);
                            });
                        });
                    }).catch(function (rej) {
                        console.log("reject ", rej);
                        reject(rej);
                    });
                });
            });
        });
    }

    static insertNewData = function (params) {
        return new Promise((resolve, reject) => {
            let jsonData = params.jsonData;
            //console.log("-> | file: wayfinder_db.js | line 104 | WayFinderDB | param", params)
            if (!params) {
                console.error("-> | file: wayfinder_db.js | line 106 | WayFinderDB | param is invalid");
                reject("param data is invalid");
                return;
            }
            let params2 = [];
            params2['connPool'] = params.connPool;
            params2['featureTypes'] = params.featureTypes;
            params2['customIcons'] = params.customIcons;
            //console.log("-> | file: wayfinder_db.js | line 114 | WayFinderDB | params2", params2);
            jsonData.features.forEach(function (v, i) {
                params2['indx'] = i;
                params2['data'] = v;
                //console.log("-> | file: wayfinder_db.js | line 118 | WayFinderDB | param2", param2);
                WayFinderDB.insertFeatureData(params2).then(function (resolv) {
                    resolve(resolv);
                }).catch(function (rej) {
                    console.log("-> | file: wayfinder_db.js | line 123 | WayFinderDB | WayFinderDB.insertFeatureData | reject", rej);
                    reject(rej);
                });
            });
        });
    }

    static getCustomIcons = function (params) {
        return new Promise((resolve, reject) => {
            console.log("get list of custom icons...");
            let connPool = params.connPool;
            connPool.pool.getConnection(function (err, conn) {
                if (err) {
                    console.error("-> | file: wayfinder_db.js | line 136 | WayFinderDB | err", err)
                    reject(err);
                    ConnPool.close(conn);
                    return;
                }
                let sql = `SELECT * FROM ${config.database}.locations_properties_customicons;`;
                conn.query(sql, function (err, result) {
                    let r = [];
                    if (err) {
                        throw err;
                    }
                    result.forEach(function (v, i) {
                        r[r.length] = { "id": v.id, "name": v.name, "icon": v.icon, "width": v.width, "height": v.height };
                    });
                    params['customIcons'] = r;
                    ConnPool.close(conn);
                    resolve(params);
                });
            });
        });
    }

    static getFeatureTypes = function (params) {
        return new Promise((resolve, reject) => {
            console.log("get list of feature types...");
            let connPool = params.connPool;
            connPool.pool.getConnection(function (err, conn) {
                if (err) {
                    console.error("-> | file: wayfinder_db.js | line 165 | WayFinderDB | err", err)
                    reject(err);
                    ConnPool.close(conn);
                    return;
                }
                let sql = `SELECT * FROM ${config.database}.locations_type;`;
                conn.query(sql, function (err, result) {
                    let r = [];
                    if (err) {
                        throw err;
                    }
                    result.forEach(function (v, i) {
                        r[r.length] = { "id": v.id, "type": v.type };
                    });
                    params['featureTypes'] = r;
                    resolve(params);
                    ConnPool.close(conn);
                });
            });
        });
    }

    processNewData = function () {
        this.featureTypes = [];
        return new Promise((resolve, reject) => {
            console.log("process new data");
            if (!this.jsonData) {
                console.error("-> | file: wayfinder_db.js | line 100 | WayFinderDB | jsonData is empty", jsonData);
                reject("invalid json data");
                return;
            }
            const params = { "connPool": this.connPool, "jsonData": this.jsonData };
            WayFinderDB.getFeatureTypes(params).then(function (reslv) {
                //console.log("-> | file: wayfinder_db.js | line 199 | WayFinderDB | featureTypes", reslv);
                WayFinderDB.getCustomIcons(reslv).then(function (reslv) {
                    //console.log("-> | file: wayfinder_db.js | line 201 | WayFinderDB | getCustomIcons", reslv);
                    WayFinderDB.insertNewData(reslv).then(function (reslv) {
                        resolve(reslv);
                    });
                }).catch(function (rj) {
                    console.error("-> | file: wayfinder_db.js | line 206 | WayFinderDB | this.getCustomIcons | reject", rj)
                    reject(rj);
                });
            }).catch(function (rj) {
                console.log("-> | file: wayfinder_db.js | line 210 | WayFinderDB | this.getFeatureTypes | reject", reject);
                reject(rj);
            });
        });
    }

    prepareDB = function () {
        // truncate tables        
        return new Promise((resolve, reject) => {
            console.log('prepare db');
            this.connPool.pool.getConnection(function (err, conn) {
                if (err) {
                    console.error("-> | file: wayfinder_db.js | line 222 | WayFinderDB | conn_pool.getConnection | err", err);
                    reject(err);
                    ConnPool.close(conn);
                    return;
                }
                console.log("conn db is ok");
                let sql1 = "TRUNCATE TABLE locations";
                conn.query(sql1, function (err, result) {
                    if (err) {
                        console.error("-> | file: wayfinder_db.js | line 231 | WayFinderDB | conn.query | err", err);
                        reject(err);
                        ConnPool.close(conn);
                        return;
                    }
                    console.log("-> | file: wayfinder_db.js | line 236 | WayFinderDB | query success sql1 ", sql1);
                    let sql2 = "TRUNCATE TABLE locations_geometry";
                    conn.query(sql2, function (err, result) {
                        if (err) {
                            console.log("-> | file: wayfinder_db.js | line 240 | WayFinderDB | err", err);
                            reject(err);
                            ConnPool.close(conn);
                            return;
                        }
                        console.log("-> | file: wayfinder_db.js | line 245 | WayFinderDB | query success sql2 ", sql2);
                        let sql3 = "TRUNCATE TABLE locations_properties";
                        conn.query(sql3, function (err, result) {
                            if (err) {
                                console.log("-> | file: wayfinder_db.js | line 249 | WayFinderDB | err", err);
                                reject(err);
                                ConnPool.close(conn);
                                return;
                            }
                            console.log("-> | file: wayfinder_db.js | line 254 | WayFinderDB | query success sql3 ", sql3);
                            ConnPool.close(conn);
                            console.log("db truncate done...");
                            resolve(1);
                        });
                    });
                });
            });
        });

    }

    static getInstance() {
        return instance || new WayFinderDB();
    }
}

module.exports = WayFinderDB;