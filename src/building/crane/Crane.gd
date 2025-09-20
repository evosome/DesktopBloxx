class_name Crane extends Node3D


#region constants

const PRELOADED_SCENE = preload("Crane.tscn")

#endregion


#region fields

var _rope_length: float
var _anchor_rotation: CraneAnchorRotation
var _current_block_type: BlockType

@export var _rope: Rope
@export var _crane: Node3D
@export var _rotating_mesh: MeshInstance3D

#endregion


#region builtins

func _ready() -> void:
	assert(_crane, "Crane node is not set on Crane base")
	assert(_rotating_mesh, "Rotating mesh instance is not set on Crane base")


func _process(_delta: float) -> void:
	_rope.set_start_3d(position)
	_rope.set_end_3d(_crane.position)


func _physics_process(_delta: float) -> void:

	if !_anchor_rotation:
		return

	_anchor_rotation.update(_crane)
	_crane.position.y += -_rope_length

#endregion


#region setters/getters

## Set block type.
## [param block_type] can be nullable. In this case, only crane anchor will dandle
## around without block mesh.
func set_block_type(block_type: BlockType) -> void:
	_current_block_type = block_type

	var model_mesh = block_type.get_simple_mesh()
	_set_block_mesh(model_mesh)


func get_block_type() -> BlockType:
	return _current_block_type


func set_rope_length(value: float) -> void:
	_rope_length = value


func get_rope_length() -> float:
	return _rope_length

#endregion


#region private

func _set_block_mesh(mesh: Mesh) -> void:
	_rotating_mesh.mesh = mesh

#endregion


#region static

static func make(crane_rotation: CraneAnchorRotation) -> Crane:
	var crane_instance = PRELOADED_SCENE.instantiate() as Crane
	crane_instance._anchor_rotation = crane_rotation
	return crane_instance

#endregion
