class_name LevelThresholds extends Resource



@export var thresholds: Dictionary[int, int] = {

	1: 100,

	2: 200,

	3: 500,

	4: 1500,

	5: 5000,

	6: 10000,

	7: 20000,

}




func get_level(xp: int) -> int:

	var matched_level:= -1

	for level in thresholds:

		var threshold_amount = thresholds[level]

		if matched_level == -1 or threshold_amount <= xp:

			matched_level = level

		if threshold_amount > xp:

			break

	return matched_level

