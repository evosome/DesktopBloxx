extends Node3D


#region constants

const CRANE_TEST_BLOCK_TYPE = preload("CraneTestBlockType.tres")

#endregion


#region fields

@export var _wind_force_slider: Slider
@export var _rope_length_slider: Slider

#endregion


#region builtins

func _ready() -> void:
	var physics = Physics.new()
	
	physics.set_wind_force(_wind_force_slider.value)
	_wind_force_slider.value_changed.connect(func(v: float): physics.set_wind_force(v))
	
	var default_crane_rotation = DefaultAnchorRotation.new(physics)
	
	var crane = Crane.make(default_crane_rotation)
	crane.set_block_type(CRANE_TEST_BLOCK_TYPE)
	
	crane.set_rope_length(_rope_length_slider.value)
	_rope_length_slider.value_changed.connect(func(v: float): crane.set_rope_length(v))
	
	add_child(crane)

#endregion
