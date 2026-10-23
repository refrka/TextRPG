extends Node


signal region_updated

signal location_updated


var region: Region

var location: Location



var region_registry: Dictionary[WorldEnums.RegionID, Region]





func _ready() -> void:

	var path = "res://resources/objects/regions/"

	for dir in ResourceLoader.list_directory(path):

		var resource_path = path + dir

		var _region = load(resource_path) as Region

		region_registry[_region.region_id] = _region




func load_location(_location: Location) -> void:

	if location != _location:

		_set_location(_location)

		if !region or region.region_id != location.region_id:

			pass



func _set_region(_region: Region) -> void:

	region = _region

	region_updated.emit()



func _set_location(_location: Location) -> void:

	location = _location

	location_updated.emit()




func _get_region(region_id: WorldEnums.RegionID) -> Region:

	if region_registry.has(region_id):

		return region_registry[region_id]

	return null
