## Represents class, containing all physics parameters and signals
## corresponding to their changes.
class_name Physics extends RefCounted


#region constants

const CALM_WIND = 1.0
const NORMAL_WIND = 1.5
const THUNDERSTORM_WIND = 2.0

#endregion


#region signals

signal wind_force_changed(value: float)

#endregion


#region fields

var _wind_force: float

#endregion


#region setters/getters

## Set the wind force ranged from 1.0 to 2.0
func set_wind_force(value: float) -> void:
    if _wind_force != value:
        wind_force_changed.emit(value)
    _wind_force = clamp(value, 1.0, 2.0)


func get_wind_force() -> float:
    return _wind_force

#endregion
