class_name GameRoot extends Node

@export var character_nav_button: Button

@export var game_start_config: GameStartConfig



func _ready() -> void:

	Game.load_game_start_config(game_start_config)

	character_nav_button.button_pressed = true

	character_nav_button.pressed.emit()

