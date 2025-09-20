class_name DefaultAnchorRotation extends CraneAnchorRotation


#region fields

var _phase: float = 0.0
var _wind_force: float = 0.0
var _prev_position: Vector3
var _physics: Physics

#endregion


#region builtins

func _init(physics: Physics) -> void:
    _physics = physics

#endregion


#region virtual

func update(anchor: Node3D) -> void:

    var wind_force = lerp(_wind_force, _physics.get_wind_force(), 0.5) + 1.0
    var angle = cos(_phase) * PI / (16.0 / wind_force)
    anchor.rotation.z = angle
    
    var current_position = Vector3(
        wind_force * cos(_phase),
        wind_force * 0.5 * sin(_phase),
        _prev_position.z
    )
    anchor.position = current_position
    _prev_position = current_position

    _phase += 0.04

#endregion
