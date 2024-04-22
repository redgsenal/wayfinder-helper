'use strict';
const fs = require('fs');
console.log('JSON Reader');
class JsonReader {
    constructor(path) {
        this.path = path;
        this.JSONData = [];
        console.log("-> | file: json_reader.js | line 8 | JsonReader | this.rawdata=fs.readFileSync | path", path);
        let rawdata = fs.readFileSync(path);
        this.JSONData = JSON.parse(rawdata);
        console.log("-> | file: json_reader.js | line 12 | JsonReader | this.rawdata=fs.readFileSync | jsdata size:", Object.keys(this.JSONData).length);
    }
}
module.exports = JsonReader;