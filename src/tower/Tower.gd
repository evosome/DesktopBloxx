class_name Tower extends Node3D


#region fields

var _building_nodes: Array[TowerBlock] = []

#endregion


#region public

func push_block(type: BlockType, connection_quality: TowerBlock.ConnectionQuality) -> void:
    pass


func pop_block() -> TowerBlock:
    return null

#endregion
