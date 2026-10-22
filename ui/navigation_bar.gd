class_name NavigationBar extends MarginContainer


@export var nav_button_list: HBoxContainer

@export var clock_reset_button: Button

@export var season_label: Label

@export var day_count_label: Label

@export var day_section_label: Label

@export var next_section_button: Button





func _ready() -> void:

	next_section_button.pressed.connect(_on_next_section_pressed)





func _on_next_section_pressed() -> void:

	pass