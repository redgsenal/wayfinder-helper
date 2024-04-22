CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_events`(
	IN vid INT,     
    IN vname VARCHAR(255),
    IN vlocationid INT,
    IN vfeaturedimage VARCHAR(2048),
    IN vdetailimage VARCHAR(2048),
    IN vlistingduration VARCHAR(255),
    IN vopeninghours TEXT,
    IN veventdescription TEXT,
    IN vactive BOOLEAN,
    IN vextract BOOLEAN)
BEGIN
	UPDATE 
		gbb_wayfinder.events
	SET 
		name = vname,
        location_id = vlocationid,
        featuredImage = vfeaturedimage,
        detailImage = vdetailimage,
        listingDuration = vlistingduration,
        openingHours = vopeninghours,
        eventDescription = veventdescription,
        active = vactive,
        extract = vextract
	WHERE
		id = vid;
END