extends GutTest


func test_ctor() -> void:
    var starting_time = BloxxTime.new(12, 30)

    var clock = Clock.make(starting_time)
    
    var current_time

    current_time = clock.get_current_time()
    assert_eq(current_time.get_hours(), starting_time.get_hours())
    assert_eq(current_time.get_minutes(), starting_time.get_minutes())
