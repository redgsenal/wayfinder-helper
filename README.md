# README #

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

* Summary of set up
* Configuration
* Dependencies
* Database configuration
* How to run tests
* Deployment instructions

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact

# docker for mysql compose
docker compose -f docker-compose.yml up --build -d

# extract root password
docker logs mysqldbs-mysql-db-1 2>&1 | grep GENERATED

# user bash
root: (use thats specified in the docker compose)

# run server
npm run serve

# build the JSON file from the db
npm run extract

# import JSON data/gbb-data.json to DB (make sure gbb-data.json is valid and latest)
npm run db:build

# root: sayplease
http://localhost:8086/

# export SQL file to data
- docker login to mysql 
- change dir to /home
- /home should container sql files. gbb_wayfinder.sql creats gbb_wayfinder db with views and stored proc
- execute: mysql -u root -p gbb_wayfinder <  gbb_wayfinder.sql