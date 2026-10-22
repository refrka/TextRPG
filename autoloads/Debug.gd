extends Node







var control_panel: ControlPanel




func _ready() -> void:

	control_panel = get_tree().get_first_node_in_group("control_panel")

	control_panel.visible = false

	




func _input(event: InputEvent) -> void:

	if event.is_action_pressed("control_panel"):

		control_panel.visible = !control_panel.visible