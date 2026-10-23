extends Node


signal game_start_config_loaded


var start_config: GameStartConfig

var player: Character




func load_game_start_config(game_start_config: GameStartConfig) -> void:

	start_config = game_start_config.duplicate(true)

	player = start_config.player_template

	World.load_location(start_config.starting_location)

	game_start_config_loaded.emit()





func get_level_for_exp(xp: int) -> int:

	return start_config.level_thresholds.get_level(xp)
