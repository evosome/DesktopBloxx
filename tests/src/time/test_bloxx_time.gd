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


func test_add() -> void:

	const FIRST_NORMAL_HOURS = 12
	const FIRST_NORMAL_MINUTES = 20

	const SECOND_NORMAL_HOURS = 3
	const SECOND_NORMAL_MINUTES = 21

	const EXPECTED_SUM_HOURS = (FIRST_NORMAL_HOURS + SECOND_NORMAL_HOURS) % 24
	const EXPECTED_SUM_MINUTES = (FIRST_NORMAL_MINUTES + SECOND_NORMAL_MINUTES) % 60

	var first_bloxx_time = BloxxTime.new(FIRST_NORMAL_HOURS, FIRST_NORMAL_MINUTES)
	var second_bloxx_time = BloxxTime.new(SECOND_NORMAL_HOURS, SECOND_NORMAL_MINUTES)
	var bloxx_time_sum = first_bloxx_time.add(second_bloxx_time)
	assert_eq(bloxx_time_sum.get_hours(), EXPECTED_SUM_HOURS)
	assert_eq(bloxx_time_sum.get_minutes(), EXPECTED_SUM_MINUTES)
