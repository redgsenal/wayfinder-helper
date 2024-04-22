CREATE PROCEDURE `sp_update_itineraries` (
	IN vid INT,     
    IN vname VARCHAR(255),
    IN vnumberofattractions INT,
    IN vattractions VARCHAR(255),
    IN vimage VARCHAR(2048),
    IN vduration VARCHAR(255),
    IN vdurationcode INT,
    IN vopeninghours TEXT,
    IN veventdescription TEXT,
    IN vactive BOOLEAN)
BEGIN
	UPDATE 
		gbb_wayfinder.itineraries
	SET
		name = vname,
        numberOfAttractions = vnumberofattractions,
        attractions = vattractions,
        image = vimage,
        duration = vduration,
        durationCode = vdurationcode,
        openingHours = vopeninghours,
        eventDescription = veventdescription,
        active = vactive
	WHERE
		id = vid;
END
