class_name WeatherSchedulerTransition extends Resource


#region fields

@export var _transitions: Array[String]
@export var _weather_type: WeatherType
@export var _weather_min_hour_long: int = 1
@export var _weather_max_hour_long: int = 5

#endregion


#region setters/getters

func get_weather_type() -> WeatherType:
	return _weather_type

#endregion


#region public

func random_transition() -> String:
	var random_transition = _transitions.pick_random()
	return random_transition


func random_hours_long() -> int:
	return randi_range(_weather_min_hour_long, _weather_max_hour_long)

#endregion
