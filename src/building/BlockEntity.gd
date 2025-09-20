class_name BlockEntity extends RigidBody3D


#region enums

enum FlyEndReason {
	TOUCHED_TOWER,
	FLEW_OFF
}

#endregion


#region constants

const PRELOADED_SCENE = null

#endregion


#region signals

signal fly_ended(end_reason: FlyEndReason)

#endregion


#region fields

@export var _visibility_notifier: VisibleOnScreenNotifier3D

#endregion


#region builtins

func _ready() -> void:
	assert(_visibility_notifier, "Visibility notifier is not set on BlockEntity base")

	freeze = true

#endregion


#region public

## This method is asynchronous.
func drop() -> void:
	pass


## This method is asynchronous.
## Block entity will fly at the certain direction without collision detection.
## Force can be specified to set how fast the block entity will fly.
func throw(direction: Vector3, force: float) -> FlyEndReason:
	freeze = false

	body_entered.connect(_on_body_entered)
	_visibility_notifier.screen_exited.connect(_on_screen_exited)

	var end_reason = await fly_ended

	_visibility_notifier.screen_exited.disconnect(_on_screen_exited)
	body_entered.disconnect(_on_body_entered)

	return end_reason

#endregion


#region event handlers

func _on_screen_exited() -> void:
	fly_ended.emit(FlyEndReason.FLEW_OFF)


func _on_body_entered(body: Node) -> void:
	if not body is Tower:
		return

	fly_ended.emit(FlyEndReason.TOUCHED_TOWER)


#endregion


#region static

static func make(block_type: BlockType) -> BlockEntity:
	return

#endregion
