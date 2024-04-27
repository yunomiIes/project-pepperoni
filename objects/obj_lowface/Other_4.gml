if ((room == rank_room))
    instance_destroy()
if ((room == timesuproom))
    instance_destroy(id, false)
if global.pizzafaceicon
{
    with (instance_create(x, y, obj_objecticontracker))
    {
        objectID = other.id
        sprite_index = spr_pizzafaceicon
    }
}
