class_name Tower extends Node3D


#region constants

const PRELOADED_SCENE = preload("Tower.tscn")

#endregion


#region fields

var _world: World

var _current_placement_height: int = 0
var _current_streak: int = 0
var _built_blocks: Array[TowerBlock] = []

@export var _collision_detector: Area3D

#endregion


#region builtins

func _ready() -> void:
	assert(_collision_detector, "Collision detector (Area 3D) is not set on Tower class")

#endregion


#region public

func push_block(type: BlockType, connection_quality: TowerBlock.ConnectionQuality) -> void:

	if connection_quality == TowerBlock.ConnectionQuality.PERFECT:
		_current_streak += 1
	
	_current_placement_height += 1
	_update_collider_transform()


func pop_block() -> TowerBlock:

	var built_block = _built_blocks.pop_front()

	_current_placement_height -= 1
	_update_collider_transform()

	return built_block

#endregion


#region private

func _update_collider_transform() -> void:
	_collision_detector.position.z = _current_placement_height

#endregion


#region static

static func make(world: World) -> Tower:
	var tower_instance = PRELOADED_SCENE.instantiate() as Tower
	tower_instance._world = world
	return tower_instance

#endregion
