class_name Weather extends RefCounted


#region fields

var _type: WeatherType
var _start_time: BloxxTime
var _end_time: BloxxTime

#endregion


#region builtins

func _init(
        type: WeatherType,
        start_time: BloxxTime,
        end_time: BloxxTime) -> void:
    
    _type = type
    _start_time = start_time
    _end_time = end_time

#endregion


#region setters/getters

func get_type() -> WeatherType:
    return _type


func get_start_time() -> BloxxTime:
    return _start_time


func get_end_time() -> BloxxTime:
    return _end_time

#endregion
