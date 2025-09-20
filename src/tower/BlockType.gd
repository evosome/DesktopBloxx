class_name BlockType extends Resource


#region enums

enum BlockKind {
	BASE,
	COMMON,
	ROOF
}

#endregion


#region fields

@export var _packed_model: PackedScene
@export var _block_kind: BlockKind = BlockKind.COMMON
@export var _max_dwellers: int = 2
@export var _cost_calculator: BlockCostCalculator

#endregion


#region setters/getters

func get_block_kind() -> BlockKind:
	return _block_kind


func get_max_dwellers() -> int:
	return _max_dwellers

#endregion


#region public

## Shorthand for
## [code] block_type.get_cost_calculator().calculate(...) [/code]
func calculate_cost(placement_info: PlacementInfo) -> int:
	if !_cost_calculator:
		push_error("Block cost calculator is not set on block type resouce")
		return 0
	return _cost_calculator.calculate(placement_info)


## Instantiate new Model-like object from packed model scene. If
## instance of the specified packed model scene is not Model-like throw error.
func instantiate_model() -> BlockModel:
	var instance = _packed_model.instantiate()
	if not instance is BlockModel:
		push_error("Instance of packed model should be Model-like object")
		return null
	return instance as BlockModel

#endregion
