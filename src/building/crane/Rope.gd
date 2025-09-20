class_name Rope extends Node2D


#region fields

var _start: Vector2
var _end: Vector2

#endregion


#region builtins


func _process(_delta: float) -> void:
	queue_redraw()


func _draw() -> void:
	draw_line(_start, _end, Color.BLACK, 8)

#endregion


#region setters/getters

func set_start_3d(value3d: Vector3) -> void:
	_start = _unproject_position(value3d)


func get_start() -> Vector2:
	return _start


func set_end_3d(value3d: Vector3) -> void:
	_end = _unproject_position(value3d)


func get_end() -> Vector2:
	return _end

#endregion


#region private

func _unproject_position(position3d: Vector3) -> Vector2:
	var viewport = get_viewport()
	var current_camera_3d = viewport.get_camera_3d()
	var unprojected_position = current_camera_3d.unproject_position(position3d)
	return unprojected_position

#endregion
