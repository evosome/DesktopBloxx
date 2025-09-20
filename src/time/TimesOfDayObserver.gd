class_name TimesOfDayObserver extends RefCounted


#region signals

## Fired when time of day changed
signal time_of_day_changed(time_of_day: int)

#endregion


#region fields

var _previous_time_of_day: int = -1

#endregion


#region builtins

func _init(clock: Clock) -> void:
    clock.time_tick.connect(_on_time_tick)

#endregion


#region event handlers

func _on_time_tick(time: BloxxTime) -> void:
    var time_of_day = TimesOfDay.to_times_of_day(time)

    if time_of_day == _previous_time_of_day:
        return
    
    _previous_time_of_day = time_of_day
    time_of_day_changed.emit(time_of_day)

#endregion
