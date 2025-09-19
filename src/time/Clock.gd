## Game time manager. 
class_name Clock extends Node


#region constants

const PRELOADED_SCENE = preload("Clock.tscn")

#endregion


#region signals

## Fired on every time changes
signal time_tick(current_time: BloxxTime)

#endregion


#region fields

var _tick_value: int

@export var _timer: Timer

#endregion


#region builtins

func _ready() -> void:
	assert(_timer, "Timer is not set on Clock implementation")
	
	_timer.timeout.connect(_on_time_tick)

#endregion


#region setters/getters

## Get current time, presented as [BloxxTime] structure.
func get_current_time() -> BloxxTime:
	return BloxxTime.from_int(_tick_value)

#endregion


#region event handlers

func _on_time_tick() -> void:
	_tick_value += 1

	var current_time = get_current_time()
	time_tick.emit(current_time)

#endregion


#region static

static func make(start: BloxxTime = null) -> Clock:
	var clock_instance: Clock = PRELOADED_SCENE.instantiate()
	clock_instance._tick_value = start.as_int() if start else 0
	return clock_instance

#endregion
