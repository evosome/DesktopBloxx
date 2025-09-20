## Class, describing house block placement info with longest streak,
## placed block type and connection quality.
class_name PlacementInfo extends RefCounted


#region fields

var _block_type: BlockType
var _current_streak: int
var _dwellers_amount: int
var _connection_quality: TowerBlock.ConnectionQuality

#endregion


#region builtins

func _init(
		block_type: BlockType,
		current_streak: int,
		dwellers_amount: int,
		connection_quality: TowerBlock.ConnectionQuality) -> void:
	
	_block_type = block_type
	_current_streak = current_streak
	_dwellers_amount = dwellers_amount
	_connection_quality = connection_quality

#endregion


#region setters/getters

func get_block_type() -> BlockType:
	return _block_type


func get_current_streak() -> int:
	return _current_streak


func get_dwellers_amount() -> int:
	return _dwellers_amount


func get_connection_quality() -> TowerBlock.ConnectionQuality:
	return _connection_quality

#endregion
