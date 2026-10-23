class_name WorldScreen extends MarginContainer


@export var region_label: Label

@export var location_label: Label





func _ready() -> void:

	World.region_updated.connect(_on_region_updated)

	World.location_updated.connect(_on_location_updated)





func _on_region_updated() -> void:

	region_label.text = World.region.display_name



func _on_location_updated() -> void:

	location_label.text = World.location.display_name
