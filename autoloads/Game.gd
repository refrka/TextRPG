extends Node


signal game_start_config_loaded


var start_config: GameStartConfig

var player: Character




func load_game_start_config(game_start_config: GameStartConfig) -> void:

	start_config = game_start_config.duplicate(true)

	player = start_config.player_template

	game_start_config_loaded.emit()






