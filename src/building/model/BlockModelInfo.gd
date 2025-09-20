## Represents info about block model. It has both simple block mesh
## and block model node (to be attached to tower).
class_name BlockModelInfo extends Resource


#region fields

@export var _simple_mesh: Mesh
@export var _packed_model: PackedScene

#endregion


#region setters/getters

## Get simple house block mesh (Without any visual effects and other)
func get_simple_mesh() -> Mesh:
    return _simple_mesh

#endregion


#region public

func instantiate_model() -> BlockModel:
    var instance = _packed_model.instantiate()
    if not instance is BlockModel:
        push_error("Instance of packed model is not Model-like object")
        return null
    return instance as BlockModel

#endregion
