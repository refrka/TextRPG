class_name NavButton extends Button



@export var screen: MarginContainer





func _ready() -> void:

	toggled.connect(_on_nav_toggled)




func _on_nav_toggled(state: bool) -> void:

	screen.visible = state