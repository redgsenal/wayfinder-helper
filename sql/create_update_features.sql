CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_features`(
	IN vid INT,     
    IN vname VARCHAR(255),
    IN vlocationtype VARCHAR(255),
    IN viconpath VARCHAR(2048),
    IN vcategory VARCHAR(255), 
    IN vsubcategory VARCHAR(255),
    IN vgeotype VARCHAR(255),
    IN vgeolat DOUBLE,
    IN vgeolon DOUBLE,
    IN vwebsite TEXT,
    IN vpopupContent TEXT,
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
    icon = viconpath;
    
SELECT 
    id
INTO type_id FROM
    gbb_wayfinder.locations_type
WHERE
    type = vlocationtype;
    
UPDATE gbb_wayfinder.locations 
SET 
    type = type_id
WHERE
    id = vid;
    
UPDATE gbb_wayfinder.locations_geometry 
SET 
    type = vgeotype,
    latitude = vgeolat,
    longitude = vgeolon
WHERE
    id = vid;
    
UPDATE gbb_wayfinder.locations_properties 
SET 
    name = vname,
    category = vcategory,
    subcategory = vsubcategory,
    customIconId = icon_id,
    website = vwebsite,
    popupContent = vpopupContent,
    featuredImage = vfeaturedimage,
    detailImage = vdetailimage,
    exclusivePromotion = vexclusivepromotion,
    visible = vvisible
WHERE
    id = vid;
    
END