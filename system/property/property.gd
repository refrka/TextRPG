class_name Property extends Resource



signal value_updated



@export var property_id: StringName

@export var value: Variant



func _init() -> void:

	Game.game_start_config_loaded.connect(_on_game_start_config_loaded)





func _set_value(new_value: Variant) -> void:

	value = new_value

	value_updated.emit()



func _on_game_start_config_loaded() -> void:

	Scribe.link_property(self)