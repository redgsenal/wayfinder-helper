CREATE DEFINER=`root`@`%` PROCEDURE `sp_insert_location`(
	IN vid INT,     
    IN vname VARCHAR(255),
    IN vlocationtype VARCHAR(255),
    IN vcategory VARCHAR(255), 
    IN vsubcategory VARCHAR(255),
    IN vgeotype VARCHAR(255),
    IN vgeolat DOUBLE,
    IN vgeolon DOUBLE,
    IN vwebsite TEXT,
    IN vpopupcontent TEXT,
    IN vopeninghours TEXT,
    IN vfeaturedimage VARCHAR(2048),
    IN vdetailimage VARCHAR(2048),
    IN vexclusivepromotion VARCHAR(255),
    IN vvisible BOOLEAN)
BEGIN
	
    DECLARE icon_id INT;
    DECLARE type_id INT;

SELECT 
    id
INTO icon_id FROM
    gbb_wayfinder.locations_properties_customicons
WHERE
    name = vcategory;
    
SELECT 
    id
INTO type_id FROM
    gbb_wayfinder.locations_type
WHERE
    type = vlocationtype;
    
    INSERT INTO gbb_wayfinder.locations (id, type, geometry, properties) VALUES (vid, type_id, vid, vid);
    INSERT INTO gbb_wayfinder.locations_geometry (id, type, latitude, longitude) VALUES (vid, vgeotype, vgeolat, vgeolon);
    INSERT INTO gbb_wayfinder.locations_properties (id, name, category, subCategory, icon_id, website, popupContent, openingHours, featuredImage, detailImage, exclusivePromotion, visible) VALUES (vid, vname, vcategory, vsubcategory, icon_id, vwebsite, vpopupcontent, vopeninghours, vfeaturedimage, vdetailimage, vexclusivepromotion, vvisible);
        
END