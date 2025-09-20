## Class, describing game world with all game details (clock,
## tower, weather, physics) gathered together.
class_name World extends Node


#region fields

var _times_of_day_observer: TimesOfDayObserver

var _tower: Tower
var _physics: Physics

@export var _clock: Clock
@export var _weather_scheduler: WeatherScheduler

#endregion


#region builtins

func _ready() -> void:
	assert(_clock, "Clock is not set on World class")
	assert(_weather_scheduler, "Weather scheduler is not set on World class")

	_tower = Tower.make(self)
	_physics = Physics.new()
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


func get_physics() -> Physics:
	return null

#endregion
