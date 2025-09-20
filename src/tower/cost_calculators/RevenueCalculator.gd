class_name RevenueCalculator extends BlockCostCalculator

var BlockT = {
	BlockType.BlockKind.BASE: 0.7,
	BlockType.BlockKind.COMMON: 1,
	BlockType.BlockKind.ROOF: 1.3
	}
var BlockBase = 700
var DwellerT = 200

var ConnectionT = {
	TowerBlock.ConnectionQuality.WEAK: 0.7,
	TowerBlock.ConnectionQuality.NORMAL: 1,
	TowerBlock.ConnectionQuality.PERFECT: 1.2,
}

func calculate(placement_info: PlacementInfo) -> int: 
	var dwellers_amount = placement_info.get_dwellers_amount()
	var block_type = placement_info.get_block_type().get_block_kind()
	var connection_quality = placement_info.get_connection_quality()
	var current_streak= placement_info.get_current_streak()
	
	var r = (BlockBase + DwellerT * dwellers_amount) * BlockT[block_type] * ConnectionT[connection_quality] * (1 + 0.01 * clamp(current_streak,0,15))
	return r
