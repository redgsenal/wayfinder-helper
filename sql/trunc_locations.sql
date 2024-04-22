CREATE DEFINER=`root`@`%` PROCEDURE `ProcTruncLocations`()
BEGIN
	TRUNCATE TABLE locations_geometry;
    TRUNCATE TABLE locations_properties;
    TRUNCATE TABLE locations;
END