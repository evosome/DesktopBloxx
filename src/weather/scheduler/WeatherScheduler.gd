#TODO: this is concrete implementation. Make this class abstract and move impl
# to other class
## Class used for changing weather randomly
class_name WeatherScheduler extends Node


#region constants

const REPORT_BEFORE_HOURS = 1
const INITIAL_WEATHER_HOUR_LONG = 4

#endregion


#region signals

## Fired, when weather scheduler is about to change weather. This
## event fired when about one in-game hour remains until the weather changes.
signal weather_queued(weather: Weather, current_time: BloxxTime)

#endregion


#region fields

var _current_weather: Weather

var _event_timelime: Dictionary[int, TimelineEvent]

@export var _clock: Clock
@export var _initial_transition: WeatherSchedulerTransition
@export var _transition_map: Dictionary[String, WeatherSchedulerTransition]

#endregion


#region builtins

func _ready() -> void:
	assert(_clock, "Clock is not set on WeatherScheduler class")

	_clock.time_tick.connect(_on_time_tick)

	var current_time = _clock.get_current_time()
	var weather_change = WeatherScheduleEvent.new(_initial_transition)
	weather_change.perform(current_time, self)

#endregion


#region setters/getters

func get_current_weather() -> Weather:
	return _current_weather


func set_current_weather(weather: Weather) -> void:
	_current_weather = weather


## Schedule timeline event
func add_event(time: BloxxTime, event: TimelineEvent) -> void:
	_event_timelime[time.as_int()] = event


func get_transition_by_name(transition_name: String) -> WeatherSchedulerTransition:
	return _transition_map.get(transition_name)

#endregion


#region event handlers

func _on_time_tick(current_time: BloxxTime) -> void:

	var time_int = current_time.as_int()
	var event = _event_timelime.get(time_int)
	if !event:
		return
	
	event.perform(current_time, self)

	_event_timelime.erase(time_int)

#endregion


#region inner classes

class TimelineEvent extends RefCounted:
	
	@warning_ignore("unused_parameter")
	func perform(time: BloxxTime, scheduler: WeatherScheduler) -> void:
		pass


class WeatherChangeEvent extends TimelineEvent:

	var _weather: Weather

	func _init(weather: Weather) -> void:
		_weather = weather
	
	func perform(time: BloxxTime, scheduler: WeatherScheduler) -> void:
		scheduler.set_current_weather(_weather)


class WeatherReportEvent extends TimelineEvent:

	var _weather: Weather

	func _init(weather: Weather) -> void:
		_weather = weather
	
	func perform(time: BloxxTime, scheduler: WeatherScheduler) -> void:
		scheduler.weather_queued.emit(_weather, time)


class WeatherScheduleEvent extends TimelineEvent:
	
	var _current_transition: WeatherSchedulerTransition

	func _init(weather_transition: WeatherSchedulerTransition) -> void:
		_current_transition = weather_transition
	
	func perform(time: BloxxTime, scheduler: WeatherScheduler) -> void:

		var hours_long = _current_transition.random_hours_long()
		var weather_type = _current_transition.get_weather_type()
		var weather_start_time = time.add_hours(REPORT_BEFORE_HOURS)
		var weather_end_time = weather_start_time.add_hours(hours_long)
		var weather = Weather.new(weather_type, weather_start_time, weather_end_time)

		var weather_report_event = WeatherReportEvent.new(weather)
		scheduler.add_event(time,  weather_report_event)
		
		print_debug("Weather report scheduled at {time}".format({
			time = time
		}))

		var weather_change_event = WeatherChangeEvent.new(weather)
		scheduler.add_event(weather_start_time, weather_change_event)
		
		print_debug("Weather change scheduled at {time}".format({
			time = weather_start_time
		}))

		var next_transition_name = _current_transition.random_transition()
		var next_transition = scheduler.get_transition_by_name(next_transition_name)
		var next_weather_schedule = WeatherScheduleEvent.new(next_transition)
		scheduler.add_event(weather_end_time, next_weather_schedule)
		
		print_debug("Next weather change cycle scheduled at {time}".format({
			time = weather_end_time
		}))

#endregion
