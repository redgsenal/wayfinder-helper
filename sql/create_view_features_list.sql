CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `features_list` AS
    SELECT 
        `ltype`.`type` AS `type`,
        `geo`.`type` AS `geo_type`,
        `geo`.`latitude` AS `latitude`,
        `geo`.`longitude` AS `longitude`,
        `props`.`id` AS `id`,
        `props`.`name` AS `name`,
        `props`.`category` AS `category`,
        `props`.`subCategory` AS `subCategory`,
        `icons`.`icon` AS `icon`,
        `icons`.`width` AS `width`,
        `icons`.`height` AS `height`,
        `props`.`website` AS `website`,
        `props`.`popupContent` AS `popupContent`,
        `props`.`openingHours` AS `openingHours`,
        `props`.`featuredImage` AS `featuredImage`,
        `props`.`detailImage` AS `detailImage`,
        `props`.`exclusivePromotion` AS `exclusivePromotion`,
        IF((`props`.`visible` = 1),
            'true',
            'false') AS `visible`,
        `locs`.`zoomLevel` AS `zoomLevel`
    FROM
        ((((`locations` `locs`
        JOIN `locations_type` `ltype` ON ((`ltype`.`id` = `locs`.`type`)))
        JOIN `locations_geometry` `geo` ON ((`locs`.`id` = `geo`.`id`)))
        JOIN `locations_properties` `props` ON ((`props`.`id` = `locs`.`id`)))
        JOIN `locations_properties_customicons` `icons` ON ((`icons`.`id` = `props`.`customIconId`)))
    ORDER BY `locs`.`id`