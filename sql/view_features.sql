CREATE VIEW `view_features` AS
    SELECT 
        ltype.type,
        geo.type AS geo_type,
        geo.latitude,
        geo.longitude,
        props.id,
        props.name,
        props.category,
        props.subCategory,
        icons.icon,
        icons.width,
        icons.height,
        props.website,
        props.popupContent,
        props.openingHours,
        props.featuredImage,
        props.detailImage,
        props.exclusivePromotion,
        IF(props.visible = 1, 'true', 'false') AS visible,
        locs.zoomLevel
    FROM
        locations AS locs
            INNER JOIN
        locations_type AS ltype ON ltype.id = locs.type
            INNER JOIN
        locations_geometry AS geo ON locs.id = geo.id
            INNER JOIN
        locations_properties AS props ON props.id = locs.id
            INNER JOIN
        locations_properties_customicons AS icons ON icons.id = props.customIconId
    ORDER BY locs.id;
