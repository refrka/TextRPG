class_name Player extends Character


signal exp_updated

signal level_updated


@export var xp:= 0





func add_xp(amount: int) -> void:

	var new_xp = xp + amount

	var new_level = Game.get_level_for_exp(new_xp)

	if new_level > level:

		var levels_gained = new_level - level

		for i in range(levels_gained):

			level_up()





func level_up() -> void:

	var new_level = level + 1

	_set_level(new_level)

	print("leveled to ", new_level)




func _set_xp(_xp: int) -> void:

	xp = _xp

	exp_updated.emit()



func _set_level(_level: int) -> void:

	level = _level

	level_updated.emit()