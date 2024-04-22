CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_advisory`(
	IN vid INT,     
    IN vname VARCHAR(255),
    IN vlocations VARCHAR(1000),
    IN viconpath VARCHAR(2048),
    IN vwidth INT, 
    IN vheight INT,
    IN vdescription TEXT,    
    IN vstartdate VARCHAR(255),
    IN venddate VARCHAR(255),
    IN vactive BOOLEAN)
BEGIN
	UPDATE 
		gbb_wayfinder.advisory
	SET
		name = vname,
        locations = vlocations,
        icon = viconpath,
        width = vwidth,
        height = vheight,
        advisoryDescription = vdescription,
        startDate = vstartdate,
        endDate= venddate,
        active = vactive
	WHERE
		id = vid;
END