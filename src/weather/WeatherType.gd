class_name WeatherType extends Resource


#region fields

@export var _icon: Texture2D
@export var _name: String
@export var _tower_affector: TowerAffector
@export var _enviroment_affector: EnviromentAffector

#endregion


#region setters/getters

func get_icon() -> Texture2D:
    return _icon


func get_name_() -> String:
    return _name


func affect_tower(tower: Tower) -> void:
    if !_tower_affector:
        push_error("Tower affector is not set on WeatherType")
        return
    _tower_affector.affect(tower)


func affect_enviroment(enviroment) -> void:
    if !_enviroment_affector:
        push_error("Enviroment affector is not set on WeatherType")
        return
    _enviroment_affector.affect(enviroment)

#endregion
