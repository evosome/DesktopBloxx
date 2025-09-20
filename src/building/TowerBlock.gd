class_name TowerBlock extends RefCounted


#region enum

enum ConnectionQuality {
    WEAK,
    NORMAL,
    PERFECT
}

#endregion


#region fields

var _cost: int
var _block_type: BlockType
var _dwellers_amount: int
var _connection_quality: ConnectionQuality

#endregion


#region builtins

func _init(
        cost: int,
        block_type: BlockType,
        dwellers_amount: int,
        connection_quality: ConnectionQuality) -> void:
    
    _cost = cost
    _block_type = block_type
    _dwellers_amount = dwellers_amount
    _connection_quality = connection_quality

#endregion


#region public

func get_cost() -> int:
    return _cost


func get_block_type() -> BlockType:
    return _block_type


func get_dwellers_amount() -> int:
    return _dwellers_amount


func get_connection_quality() -> ConnectionQuality:
    return _connection_quality

#endregion
