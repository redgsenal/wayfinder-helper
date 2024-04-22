select ltype.type, geo.type as geo_type, geo.latitude, geo.longitude, props.id,  props.name, props.category, props.subCategory, icons.icon, icons.width,icons.height, props.website, props.popupContent, props.openingHours, props.featuredImage, props.detailImage, props.exclusivePromotion, if(props.visible = 1, 'true', 'false') as visible, locs.zoomLevel from locations as locs 
inner join locations_type as ltype on ltype.id = locs.type 
inner join locations_geometry as geo on locs.id = geo.id 
inner join locations_properties as props on props.id = locs.id 
inner join locations_properties_customicons as icons on icons.id =  props.customIconId
order by locs.id;