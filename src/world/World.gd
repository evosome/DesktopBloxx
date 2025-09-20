## Class, describing game world with all game details (clock,
## tower, weather) gathered together.
class_name World extends Node


#region signals

signal wind_force_changed(value: float)

#endregion


#region fields

var _wind_force: float = 0.0
var _times_of_day_observer: TimesOfDayObserver

var _tower: Tower

@export var _clock: Clock
@export var _weather_scheduler: WeatherScheduler

#endregion


#region builtins

func _ready() -> void:
	assert(_clock, "Clock is not set on World class")
	assert(_weather_scheduler, "Weather scheduler is not set on World class")

	_tower = Tower.make(self)
	_times_of_day_observer = TimesOfDayObserver.new(_clock)

#endregion


#region setters/getters

func get_tower() -> Tower:
	return _tower


func get_clock() -> Clock:
	return _clock


func get_times_of_day_observer() -> TimesOfDayObserver:
	return _times_of_day_observer


func get_weather_scheduler() -> WeatherScheduler:
	return _weather_scheduler


func get_wind_force() -> float:
	return _wind_force


func set_wind_force(value: float) -> void:
	_wind_force = value

#endregion
