extends Node



signal day_section_updated

signal section_progress_updated

signal section_progress_completed


enum DaySection {

	MORNING,

	DAY,

	EVENING,

	NIGHT,

}


enum SectionPhase {

	START,

	MAIN,

	END,

}




var current_day_section: DaySection

var current_section_progress:= 0.0

var current_section_phase: SectionPhase

var day:= 1



func _ready() -> void:

	_change_section(DaySection.MORNING)



func get_schedule() -> Schedule:

	return Schedule.new_schedule(current_day_section, current_section_phase, day)




func get_next_day_section() -> DaySection:

	match current_day_section:

		DaySection.NIGHT:

			return DaySection.MORNING
		
		_:

			return current_day_section + 1 as DaySection






func add_progress(amount: float) -> void:

	var new_progress = current_section_progress + amount

	_set_progress(new_progress)

	if current_section_progress >= 1.0:

		_complete_section()

















func _complete_section() -> void:

	var next_section = get_next_day_section()

	_change_section(next_section)

	section_progress_completed.emit()





func _change_section(new_section: DaySection) -> void:

	_set_section(new_section)

	day_section_updated.emit()










func _set_progress(progress: float) -> void:

	current_section_progress = progress

	section_progress_updated.emit()




func _set_section(section: DaySection) -> void:

	current_day_section = section

	day_section_updated.emit()