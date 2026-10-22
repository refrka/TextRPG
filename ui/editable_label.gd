class_name EditableLabel extends Label


signal label_edited


@export var line_edit: LineEdit

var edit_mode:= false

var temp_text: String


func _ready() -> void:

	line_edit.visible = false

	gui_input.connect(_on_gui_input)

	line_edit.text_submitted.connect(_on_text_submitted)




func _edit() -> void:

	edit_mode = true

	line_edit.visible = true

	line_edit.text = text

	line_edit.select_all()

	line_edit.caret_column = text.length()

	line_edit.edit()

	temp_text = text

	text = ""




func _submit(new_text: String) -> void:

	text = new_text
	
	_return()




func _return() -> void:

	if not edit_mode:

		return

	edit_mode = false

	if line_edit.text == "":

		text = temp_text

	else:

		text = line_edit.text

	line_edit.visible = false




func _on_gui_input(event: InputEvent) -> void:

	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():

		_edit()




func _on_text_submitted(new_text: String) -> void:

	_submit(new_text)




func _unhandled_input(event: InputEvent) -> void:

	if not edit_mode:

		return

	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():

		_return()




	