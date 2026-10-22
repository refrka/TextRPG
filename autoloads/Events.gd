extends Node




var pending_events: Array[Event]

var scheduled_events: Dictionary[Schedule, Event]




func _ready() -> void:

	var event = Event.new()

	var schedule = Schedule.new_schedule(Clock.DaySection.MORNING, Clock.SectionPhase.START)

	scheduled_events[schedule] = event







func get_scheduled_events(schedule: Schedule) -> Array[Event]:

	var clock_events: Array[Event] = []

	for _schedule in scheduled_events:

		if _schedule.match_schedule(schedule):

			var event = scheduled_events[_schedule]

			clock_events.append(event)

	return clock_events