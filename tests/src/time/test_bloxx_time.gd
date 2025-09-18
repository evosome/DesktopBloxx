extends GutTest


func test_normal_ctor() -> void:
	const NORMAL_HOURS = 12
	const NORMAL_MINUTES = 20
	
	var bloxx_time

	bloxx_time = BloxxTime.new(NORMAL_HOURS, NORMAL_MINUTES)
	assert_eq(bloxx_time.get_hours(), NORMAL_HOURS)
	assert_eq(bloxx_time.get_minutes(), NORMAL_MINUTES)


func test_unnormal_ctor() -> void:

	const NORMAL_HOURS = 12
	const NORMAL_MINUTES = 20

	const UNNORMAL_HOURS = 25
	const UNNORMAL_MINUTES = 180

	var bloxx_time

	bloxx_time = BloxxTime.new(UNNORMAL_HOURS, NORMAL_MINUTES)
	assert_eq(bloxx_time.get_hours(), 1)
	assert_eq(bloxx_time.get_minutes(), NORMAL_MINUTES)

	bloxx_time = BloxxTime.new(NORMAL_HOURS, UNNORMAL_MINUTES)
	assert_eq(bloxx_time.get_hours(), NORMAL_HOURS + 3)
	assert_eq(bloxx_time.get_minutes(), 0)


func test_as_int() -> void:
	
	const NORMAL_HOURS = 12
	const NORMAL_MINUTES = 20

	var bloxx_time

	bloxx_time = BloxxTime.new(NORMAL_HOURS, NORMAL_MINUTES)
	assert_eq(bloxx_time.as_int(), NORMAL_HOURS * 60 + NORMAL_MINUTES)


func test_from_int() -> void:

	const NORMAL_HOURS = 12
	const NORMAL_MINUTES = 20

	var bloxx_time

	bloxx_time = BloxxTime.from_int(NORMAL_HOURS * 60 + NORMAL_MINUTES)
	assert_eq(bloxx_time.get_hours(), NORMAL_HOURS)
	assert_eq(bloxx_time.get_minutes(), NORMAL_MINUTES)
