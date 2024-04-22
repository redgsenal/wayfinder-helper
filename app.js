'use strict';
const express = require('express');
const basicAuth = require('express-basic-auth');
const cors = require('cors');
const request = require('request');
const handlebars = require('express-handlebars');
const BuildJSONData = require('./build_json.js');
const admin = require('./auth.js');

const app = express();

const hbs = handlebars.create({
    defaultLayout: 'main',
    layoutsDir: __dirname + '/views/layouts',
    extname: '.hbs'
});

app.engine('hbs', hbs.engine);
app.set('view engine', 'hbs');

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'))
app.use(cors());

const port = process.env.NODE_ENV === 'production' ? (process.env.PORT || 80) : 3000;

const config = require('./config.js');
const WayFinderHelper = require('./wayfinder_helper');
const db = config.database;
const ConnPool = require('./conn_pool.js');
const connPool = new ConnPool();
const conn = connPool.conn;

const buildJSONData = new BuildJSONData('./public/downloads');

const page = [];
const auth = [];
const dialog = [];

hbs.handlebars.registerHelper('sanitizeContent', function (currentValue) {
    return (currentValue == '1' || currentValue == 'true') ? "checked" : "";
});

hbs.handlebars.registerHelper('isChecked', function (currentValue) {
    return (currentValue == '1' || currentValue == 'true') ? "checked" : "";
});

hbs.handlebars.registerHelper('isActiveORVisibleIcon', function (currentValue) {
    return new hbs.handlebars.SafeString((currentValue == '1' || currentValue == 'true') ? "&#x2705;" : "&#x274C;");
});

conn.connect((err) => {
    console.log("Connecting to MYSQL database...");
    if (err) {
        console.log("Connection failed! " + JSON.stringify(err, null, 1));
        return;
    }
    console.log("MYSQL connection successful...");
    app.listen(port, () => {
        auth['user'] = 'admin';
        auth['pass'] = admin.admin;
        console.log("Server listening on port: ", port);
        console.log("Authentication: ", auth);
    });
});

app.use(basicAuth({
    users: admin,
    challenge: true
}));

app.get('/', (req, res) => {
    page['title'] = "Home";
    dialog['message'] = "";
    res.render('home', { page: page, dialog: dialog });
});

app.get('/download', async (req, res) => {
    let buildJSONData = new BuildJSONData("./public/downloads/gbb-data.json");
    buildJSONData.deleteJSONFile().then((v) => {
        console.error("generate JSON here");
    }).catch((v) => {
        console.log("unable to delete build JSON file aa");
    });
    let featuresList = await buildJSONData.getFeaturesList();
    let itineraryList = await buildJSONData.getItineraryList();
    let eventsList = await buildJSONData.getEventsList();
    let qrLocations = await buildJSONData.getQRLocationsList();
    let locationCategories = await buildJSONData.getLocationCategoriesList();
    let advisories = await buildJSONData.getAdvisoryList();
    buildJSONData.generateFeaturesJSON(buildJSONData.jsonData, featuresList).then((v) => {
        buildJSONData.generateItineraryJSON(v, itineraryList).then((v2) => {
            buildJSONData.generateEventsJSON(v2, eventsList).then((v3) => {
                buildJSONData.generateQRLocationsJSON(v3, qrLocations).then((v4) => {
                    buildJSONData.generateLocationCategoriesJSON(v4, locationCategories).then((v5) => {
                        buildJSONData.generateAdvisoryJSON(v5, advisories).then((v6) => {
                            buildJSONData.writeJSONData(v6, buildJSONData.buildpath);
                            console.log("build json file done");
							page['title'] = "Download JSON File";
                            res.render('download', { page : page});
                        }).catch((rej) => {
                            console.log("unable to build json data: ", rej);
                        });
                    }).catch((rej) => {
                        console.log("unable to build json data: ", rej);
                    });
                }).catch((rej) => {
                    console.log("unable to build json data: ", rej);
                });
            }).catch((rej) => {
                console.log("unable to build json data: ", rej);
            });
        }).catch((rej) => {
            console.log("unable to build json data: ", rej);
        });
    }).catch((rej) => {
        console.log("unable to build json data: ", rej);
    });
});

app.get('/features/edit/:id/success', (req, res) => {
    let id = req.params.id;
    request.get({
        url: `http://localhost:3000/features/${id}`,
        auth: auth,
        json: true,
        headers: { 'User-Agent': 'request' }
    }, (err, resp, data) => {
        if (err) {
            console.error(err);
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        if (resp.statusCode != 200){
            res.status(resp.statusCode).send(resp.statusMessage);
            return;
        }
        page['title'] = "Edit Features";
        if (data && data.length > 0) {
            console.log(data[0]);
            dialog['message'] = "Edit Features Success";
            res.render('features-edit', {
                data: data[0],
                page: page,
                dialog: dialog
            });
        }
    });
});

app.get('/features/edit/:id', (req, res) => {
    let id = req.params.id;
    request.get({
        url: `http://localhost:3000/features/${id}`,
        auth: auth,
        json: true,
        headers: { 'User-Agent': 'request' }
    }, (err, resp, data) => {
        if (err) {
            console.error(err);
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        if (resp.statusCode != 200){
            res.status(resp.statusCode).send(resp.statusMessage);
            return;
        }
        page['title'] = "Edit Features";
        if (data && data.length > 0) {
            console.log(data[0]);
            res.render('features-edit', {
                data: data[0],
                page: page
            });
        }
    });
});

app.get('/events/edit/:id/success', (req, res) => {
    let id = req.params.id;
    request.get({
        url: `http://localhost:3000/events/${id}`,
        auth: auth,
        json: true,
        headers: { 'User-Agent': 'request' }
    }, (err, resp, data) => {
        if (err) {
            console.error(err);
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        if (resp.statusCode != 200){
            res.status(resp.statusCode).send(resp.statusMessage);
            return;
        }
        page['title'] = "Edit Events";
        if (data && data.length > 0) {
            dialog['message'] = "Edit Event Success";
            res.render('events-edit', {
                data: data[0],
                page: page,
                dialog: dialog
            });
        }
    });
});

app.get('/advisory/edit/:id/success', (req, res) => {
    let id = req.params.id;
    request.get({
        url: `http://localhost:3000/advisory/${id}`,
        auth: auth,
        json: true,
        headers: { 'User-Agent': 'request' }
    }, (err, resp, data) => {
        if (err) {
            console.error(err);
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        if (resp.statusCode != 200){
            res.status(resp.statusCode).send(resp.statusMessage);
            return;
        }
        page['title'] = "Edit Advisory";
        if (data && data.length > 0) {
            dialog['message'] = "Edit Advisory Success";
            res.render('advisory-edit', {
                data: data[0],
                page: page,
                dialog: dialog
            });
        }
    });
});

app.get('/events/edit/:id', (req, res) => {
    let id = req.params.id;
    request.get({
        url: `http://localhost:3000/events/${id}`,
        auth: auth,
        json: true,
        headers: { 'User-Agent': 'request' }
    }, (err, resp, data) => {
        if (err) {
            console.error(err);
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        if (resp.statusCode != 200){
            res.status(resp.statusCode).send(resp.statusMessage);
            return;
        }
        page['title'] = "Edit Events";
        if (data && data.length > 0) {
            console.log(data[0]);
            res.render('events-edit', {
                data: data[0],
                page: page
            });
        }
    });
});

app.get('/itineraries/edit/:id', (req, res) => {
    let id = req.params.id;
    request.get({
        url: `http://localhost:3000/itineraries/${id}`,
        auth: auth,
        json: true,
        headers: { 'User-Agent': 'request' }
    }, (err, resp, data) => {
        if (err) {
            console.error(err);
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        if (resp.statusCode != 200){
            res.status(resp.statusCode).send(resp.statusMessage);
            return;
        }
        page['title'] = "Edit Itineraries";
        if (data && data.length > 0) {
            console.log(data[0]);
            res.render('itineraries-edit', {
                data: data[0],
                page: page
            });
        }
    });
});

app.get('/itineraries/edit/:id/success', (req, res) => {
    let id = req.params.id;
    request.get({
        url: `http://localhost:3000/itineraries/${id}`,
        auth: auth,
        json: true,
        headers: { 'User-Agent': 'request' }
    }, (err, resp, data) => {
        if (err) {
            console.error(err);
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        if (resp.statusCode != 200){
            res.status(resp.statusCode).send(resp.statusMessage);
            return;
        }
        page['title'] = "Edit Itineraries";
        if (data && data.length > 0) {
            dialog['message'] = "Edit Itineraries Success";
            console.log(data[0]);
            res.render('itineraries-edit', {
                data: data[0],
                page: page,
                dialog: dialog
            });
        }
    });
});

app.get('/advisory/edit/:id', (req, res) => {
    let id = req.params.id;
    request.get({
        url: `http://localhost:3000/advisory/${id}`,
        auth: auth,
        json: true,
        headers: { 'User-Agent': 'request' }
    }, (err, resp, data) => {
        if (err) {
            console.error(err);
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        if (resp.statusCode != 200){
            res.status(resp.statusCode).send(resp.statusMessage);
            return;
        }
        page['title'] = "Edit Advisory";
        if (data && data.length > 0) {
            console.log(data[0]);
            res.render('advisory-edit', {
                data: data[0],
                page: page
            });
        }
    });
});

app.get('/features/list', (req, res) => {
    request.get({
        url: "http://localhost:3000/features",
        auth: auth,
        json: true,
        headers: { 'User-Agent': 'request' }
    }, (err, resp, data) => {
        if (err) {
            console.error(err);
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        if (resp.statusCode != 200){
            res.status(resp.statusCode).send(resp.statusMessage);
            return;
        }        
        page['title'] = "Features List";
        res.render('features', {
            results: data,
            page: page
        });
    });
});

app.get('/events/list', (req, res) => {
    request.get({
        url: "http://localhost:3000/events",
        auth: auth,
        json: true,
        headers: { 'User-Agent': 'request' }
    }, (err, resp, data) => {
        if (err) {
            console.error(err);
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        if (resp.statusCode != 200){
            res.status(resp.statusCode).send(resp.statusMessage);
            return;
        }
        page['title'] = "Events List";
        res.render('events', {
            results: data,
            page: page
        });
    });
});

app.get('/itineraries/list', (req, res) => {
    request.get({
        url: "http://localhost:3000/itineraries",
        auth: auth,
        json: true,        
        headers: { 'User-Agent': 'request' }
    }, (err, resp, data) => {
        if (err) {
            console.error(err);
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        if (resp.statusCode != 200){
            res.status(resp.statusCode).send(resp.statusMessage);
            return;
        }
        page['title'] = "Itineraries List";
        res.render('itineraries', {
            results: data,
            page: page
        });
    });
});

app.get('/advisory/list', (req, res) => {
    request.get({
        url: "http://localhost:3000/advisory",
        auth: auth,
        json: true,        
        headers: { 'User-Agent': 'request' }
    }, (err, resp, data) => {
        if (err) {
            console.error(err);
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        if (resp.statusCode != 200){
            res.status(resp.statusCode).send(resp.statusMessage);
            return;
        }
        page['title'] = "Advisory List";
        res.render('advisory', {
            results: data,
            page: page
        });
    });
});

app.get('/advisory', (req, res) => {
    conn.query(`SELECT * FROM ${db}.advisory ORDER BY id`, (err, results, fields) => {
        if (err) {
            console.error("MYSQL error features listing");
            res.status(501).send(new Error('Unable to process'));	
            return;
        }
        res.send(results);
    });
});


app.get('/events', (req, res) => {
    conn.query(`SELECT * FROM ${db}.events ORDER BY id`, (err, results, fields) => {
        if (err) {
            console.error("MYSQL error features listing");
            res.status(501).send(new Error('Unable to process'));	
            return;
        }
        res.send(results);
    });
});

app.get('/features', (req, res) => {
    conn.query(`SELECT * FROM ${db}.features_list`, (err, results, fields) => {
        if (err) {
            console.error("MYSQL error features listing");
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        res.send(results);
    });
});

app.get('/itineraries', (req, res) => {
    conn.query(`SELECT * FROM ${db}.itineraries ORDER BY id`, (err, results, fields) => {
        if (err) {
            console.error("MYSQL error features listing");
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        res.send(results);
    });
});

app.get('/features/:id', (req, res) => {
    let id = req.params.id;
    conn.query(`SELECT * FROM ${db}.features_list WHERE id = ${id}`, (err, results, fields) => {
        if (err) {
            console.error("MYSQL error features id listing " + JSON.stringify(err, null, 1));
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        res.send(results);
    });
});

app.get('/events/:id', (req, res) => {
    let id = req.params.id;
    conn.query(`SELECT * FROM ${db}.events WHERE id = ${id}`, (err, results, fields) => {
        if (err) {
            console.error("MYSQL error events id listing " + JSON.stringify(err, null, 1));
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        res.send(results);
    });
});

app.get('/itineraries/:id', (req, res) => {
    let id = req.params.id;
    conn.query(`SELECT * FROM ${db}.itineraries WHERE id = ${id}`, (err, results, fields) => {
        if (err) {
            console.error("MYSQL error itineraries id listing " + JSON.stringify(err, null, 1));
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        res.send(results);
    });
});

app.get('/advisory/:id', (req, res) => {
    let id = req.params.id;
    conn.query(`SELECT * FROM ${db}.advisory WHERE id = ${id}`, (err, results, fields) => {
        if (err) {
            console.error("MYSQL error advisroy id listing " + JSON.stringify(err, null, 1));
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        res.send(results);
    });
});

let updateFeatures = ((req, res) => {
    let data = req.body;
    let id = data.id;
    let locationType = data.type;
    let name = data.name;
    let iconPath = data.icon;
    let category = data.category;
    let subCategory = data.subCategory;
    let geoType = data.geo_type;
    let website = data.website;
    let popupContent = WayFinderHelper.sanitizeText(data.popupContent);
    let openingHours =  WayFinderHelper.sanitizeText(data.openingHours);
    let featuredImage = data.featuredImage;
    let detailImage = data.detailImage;
    let exclusivePromotion = WayFinderHelper.sanitizeText(data.exclusivePromotion);
    let zoomLevel = data.zoomLevel ? data.zoomLevel : 17;
    let exclude = WayFinderHelper.validateBoolean(data.exclude);
    let visible = WayFinderHelper.validateBoolean(data.visible);
    let lat = data.latitude;
    let lon = data.longitude;

    let redirect = data.redirect;

    console.log("data ", data);

    let sql = `CALL sp_update_features(${id},"${name}","${locationType}","${iconPath}","${category}","${subCategory}","${geoType}",${lat},${lon},"${website}","${popupContent}","${openingHours}","${featuredImage}","${detailImage}","${exclusivePromotion}",${zoomLevel},${exclude},${visible});`;
    console.log(sql);
    conn.query(sql, (err, rows, fields) => {
        console.log("update here");
        const result = { "feature id": id, "process": "update feature", "success": !err, "data": data, "err": err };
        console.log(result);
        if (err) {
            console.error("MYSQL error " + JSON.stringify(err, null, 1));
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        if (result['success']) {
            if (redirect) {
                res.redirect(redirect);
                return;
            }            
        }
        res.setHeader('Content-Type', 'application/json');
        res.end(JSON.stringify(result));    
    });
});

app.post('/features', (req, res) => {
    updateFeatures(req, res);
});

app.put('/features', (req, res) => {
    updateFeatures(req, res);
});

let updateEvents = ((req, res) => {
    let data = req.body;
    let id = data.id;
    let name = data.name;
    let locationId = data.location_id;
    let featuredImage = data.featuredImage;
    let detailImage = data.detailImage;
    let listingDuration = data.listingDuration;
    let openingHours =  WayFinderHelper.sanitizeText(data.openingHours);
    let eventDescription =  WayFinderHelper.sanitizeText(data.eventDescription);
    let active = WayFinderHelper.validateBoolean(data.active);
    let extract = WayFinderHelper.validateBoolean(data.extract);

    let redirect = data.redirect;

    console.log("data ", data);

    let sql = `CALL sp_update_events(${id},"${name}",${locationId},"${featuredImage}","${detailImage}","${listingDuration}","${openingHours}","${eventDescription}",${active}, ${extract});`;
    console.log(sql);
    conn.query(sql, (err, rows, fields) => {
        console.log("update here");
        const result = { "event id": id, "process": "update event", "success": !err, "data": data, "err": err };
        console.log(result);
        if (err) {
            console.error("MYSQL error " + JSON.stringify(err, null, 1));
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        if (result['success']) {
            if (redirect) {
                res.redirect(redirect);
                return;
            }            
        }
        res.setHeader('Content-Type', 'application/json');
        res.end(JSON.stringify(result));    
    });
});

app.post('/events', (req, res) => {
    updateEvents(req, res);
});

let updateItineraries = ((req, res) => {
    let data = req.body;
    let id = data.id;
    let name = data.name;
    let numberOfAttractions = data.numberOfAttractions;
    let attractions = data.attractions;
    let image = data.image;
    let duration = data.duration;
    let durationCode = data.durationCode;
    let openingHours = WayFinderHelper.sanitizeText(data.openingHours);
    let eventDescription =  WayFinderHelper.sanitizeText(data.eventDescription);
    let active = WayFinderHelper.validateBoolean(data.active);

    let redirect = data.redirect;

    console.log("data ", data);

    let sql = `CALL sp_update_itineraries(${id},"${name}","${numberOfAttractions}","${attractions}","${image}","${duration}","${durationCode}", "${openingHours}","${eventDescription}",${active});`;
    console.log(sql);
    conn.query(sql, (err, rows, fields) => {
        console.log("update here");
        const result = { "event id": id, "process": "update itineraries", "success": !err, "data": data, "err": err };
        console.log(result);
        if (err) {
            console.error("MYSQL error " + JSON.stringify(err, null, 1));
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        if (result['success']) {
            if (redirect) {
                res.redirect(redirect);
                return;
            }
        }
        res.setHeader('Content-Type', 'application/json');
        res.end(JSON.stringify(result));
    });
});

app.post('/itineraries', (req, res) => {
    updateItineraries(req, res);
});

let updateAdvisory = ((req, res) => {
    let data = req.body;
    let id = data.id;
    let name = data.name;
    let locations = data.locations;
    let icon = data.icon;
    let width = data.width;
    let height = data.height;
    let advisoryDescription =  WayFinderHelper.sanitizeText(data.advisoryDescription);
    let startDate = data.startDate;
    let endDate = data.endDate;
    let active = WayFinderHelper.validateBoolean(data.active);

    let redirect = data.redirect;

    console.log("data ", data);

    let sql = `CALL sp_update_advisory(${id},"${name}","${locations}","${icon}",${width},${height},"${advisoryDescription}", "${startDate}","${endDate}",${active});`;
    console.log(sql);
    conn.query(sql, (err, rows, fields) => {
        console.log("update here");
        const result = { "advisory id": id, "process": "update advisory", "success": !err, "data": data, "err": err };
        console.log(result);
        if (err) {
            console.error("MYSQL error " + JSON.stringify(err, null, 1));
            res.status(501).send(new Error('Unable to process'));
            return;
        }
        if (result['success']) {
            if (redirect) {
                res.redirect(redirect);
                return;
            }
        }
        res.setHeader('Content-Type', 'application/json');
        res.end(JSON.stringify(result));
    });
});

app.post('/advisory', (req, res) => {
    updateAdvisory(req, res);
});