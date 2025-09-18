## Class, describing in-game time presented in hours:minutes.
class_name BloxxTime extends RefCounted


#region fields

var _hours: int
var _minutes: int

#endregion


#region builtins

func _init(hours: int, minutes: int) -> void:
    _normalize_time(hours, minutes)

#endregion


#region setters/getters

func get_hours() -> int:
    return _hours


func get_minutes() -> int:
    return _minutes

#endregion


#region private

func _normalize_time(hours, minutes) -> void:
    _minutes = minutes % 60
    var _hours_remaining: int = minutes / 60
    _hours = (hours + _hours_remaining) % 24

#endregion


#region public

func as_int() -> int:
    return _hours * 60 + _minutes

#endregion


#region static

static func from_int(value: int) -> BloxxTime:
    var hours: int = value / 60
    var minutes = value % 60
    return BloxxTime.new(hours, minutes)

#endregion
