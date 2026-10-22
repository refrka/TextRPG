class_name LinkedLabel extends Label



@export var linked_property_id: StringName



var linked_property: Property



func _ready() -> void:

	add_to_group(linked_property_id)




func set_linked_property(property: Property) -> void:

	if linked_property:

		linked_property.value_updated.disconnect(_on_linked_property_updated)

	linked_property = property

	if linked_property:

		linked_property.value_updated.connect(_on_linked_property_updated)

	_update()




func _update() -> void:

	text = ""

	if linked_property:

		text = str(linked_property.value)




func _on_linked_property_updated() -> void:

	_update()