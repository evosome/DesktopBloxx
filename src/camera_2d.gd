extends Camera2D

func _physics_process(delta: float) -> void:
	position.y-=0.1

func _ready() -> void:
	var block = BlockType.new()
	block._block_kind = BlockType.BlockKind.COMMON
	var t: PlacementInfo = PlacementInfo.new(block,0,2,TowerBlock.ConnectionQuality.NORMAL)
	
	var calc = RevenueCalculator.new()
	print(calc.calculate(t))
