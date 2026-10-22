class_name CharacterScreen extends MarginContainer




@export var name_container: MarginContainer

@export var name_label: LinkedLabel

@export var name_edit: NameEdit


var editing_name = false



func _ready() -> void:

	name_edit.visible = false

	name_container.gui_input.connect(_on_name_gui_input)

	name_edit.text_submitted.connect(_on_name_text_submitted)





func _edit_name() -> void:

	print("edit")

	editing_name = true

	name_label.visible = false

	name_edit.visible = true

	name_edit.text = name_label.text

	name_edit.select_all()

	name_edit.caret_column = name_label.text.length()

	name_edit.edit()




func _stop_editing() -> void:

	var new_name = name_edit.text

	name_edit.visible = false

	name_label.linked_property._set_value(new_name)

	name_label.visible = true





func _on_name_text_submitted(_text: String) -> void:

	_stop_editing()




func _on_name_gui_input(event: InputEvent) -> void:

	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():

		_edit_name()





func _unhandled_input(event: InputEvent) -> void:

	if editing_name and (event is InputEventMouseButton and event.button_index == 1 and event.is_pressed()):

		_stop_editing()