class_name ControlPanel extends MarginContainer


@export var fire_event_button: Button



var held:= false

var held_offset:= Vector2.ZERO




func _hold() -> void:

	held = true

	held_offset = get_global_mouse_position() - global_position



func _drop() -> void:

	held = false




func _gui_input(event: InputEvent) -> void:

	if event is InputEventMouseButton and event.button_index == 1:
		
		if event.is_pressed():

			_hold()

		else:

			_drop()





func _process(_delta: float) -> void:

	if held:

		global_position = get_global_mouse_position() - held_offset

