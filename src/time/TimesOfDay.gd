## Utility class for determining time of day by the [BloxxTime] value.
class_name TimesOfDay

#region enums

enum {
    MORNING,
    AFTERNOON,
    EVENING,
    NIGHT
}

#endregion


#region static

static func to_times_of_day(time: BloxxTime) -> int:
    var hour = time.get_hours()
    
    if (22 <= hour && hour < 24) || (0 <= hour && hour < 6):
        return NIGHT
    elif 6 <= hour && hour < 12:
        return MORNING
    elif 12 <= hour && hour < 17:
        return AFTERNOON
    else:
        return EVENING

#endregion
