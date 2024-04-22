'use strict';

const ConnPool = require("./conn_pool");

console.log('WayFinder Helper');

class WayFinderHelper {

    static validateBoolean = function (v){
        if (!v){
            return 0;
        }
        return (v == 'true' || v == '1' || v == 'on' || v == true) ? 1 : 0;
    }
    static sanitizeText = function (t) {
        if (!t || t === undefined || t == null || t == "null"){
            return "";
        }
        return t.toString().replace(/(\r\n|\n|\r)/gm, "").toString().replace('"', '\\"');
    }

    static closeConn = function (conn) {
        if (!conn) {
            return;
        }
        conn.close();
        conn.destroy();
    }

    static async execQuery(conn, sql) {
        let prms = new Promise((resolve, reject) => {
            conn.query(sql, function (err, result) {
                if (err) {
                    reject(err);
                    return;
                }
                resolve(result);
            });
        });
        return prms.then((val) => {
            return val;
        }).catch((msg) => {
            console.error(msg);
            return false;
        });       
    }

    static async doQuery(conn, sql) {
        let prms = new Promise((resolve, reject) => {
            conn.query(sql, function (err, result) {
                if (err) {
                    reject(err);
                    return;
                }
                resolve(result);
            });
        });
        return prms.then((val) => {
            return val;
        }).catch((msg) => {
            console.error(msg);
            return false;
        });      
    }
}

module.exports = WayFinderHelper;