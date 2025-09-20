extends GutTest


func test_times_of_day() -> void:

	var MORNING_TIME = BloxxTime.new(6, 0)
	var NIGHT_BEFORE_MIDNIGHT = BloxxTime.new(22, 0)
	var NIGHT_AFTER_MIDNIGHT = BloxxTime.new(5, 59)
	var AFTERNOON_TIME = BloxxTime.new(16, 59)
	var EVENING_TIME = BloxxTime.new(21, 59)

	var time_of_day

	time_of_day = TimesOfDay.to_times_of_day(MORNING_TIME)
	assert_eq(time_of_day, TimesOfDay.MORNING)

	time_of_day = TimesOfDay.to_times_of_day(NIGHT_AFTER_MIDNIGHT)
	assert_eq(time_of_day, TimesOfDay.NIGHT)

	time_of_day = TimesOfDay.to_times_of_day(NIGHT_BEFORE_MIDNIGHT)
	assert_eq(time_of_day, TimesOfDay.NIGHT)

	time_of_day = TimesOfDay.to_times_of_day(AFTERNOON_TIME)
	assert_eq(time_of_day, TimesOfDay.AFTERNOON)

	time_of_day = TimesOfDay.to_times_of_day(EVENING_TIME)
	assert_eq(time_of_day, TimesOfDay.EVENING)
