extends Node





func link_property(property: Property) -> void:

	var linked_label = get_tree().get_first_node_in_group(property.property_id)

	linked_label.set_linked_property(property)