class_name Schedule extends Resource


@export var day_count:= -1

@export var day_section: Clock.DaySection

@export var section_phase: Clock.SectionPhase





func match_schedule(schedule: Schedule) -> bool:

	if day_count != -1:
		
		if day_count != schedule.day_count:
			
			return false
			
	if day_section != schedule.day_section or section_phase != schedule.section_phase:

		return false

	return true



static func new_schedule(_day_section: Clock.DaySection, _section_phase: Clock.SectionPhase, _day_count:= -1) -> Schedule:

	var schedule = Schedule.new()

	schedule.day_count = _day_count

	schedule.day_section = _day_section

	schedule.section_phase = _section_phase

	return schedule
