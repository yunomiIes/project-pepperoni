image_alpha = 0
x = obj_player1.x
y = obj_player1.y
if global.pizzafaceicon
{
    with (instance_create(x, y, obj_objecticontracker))
    {
        objectID = other.id
        sprite_index = spr_pizzafaceicon
    }
}
if ((room == rank_room))
    instance_destroy()
if ((room == timesuproom))
    instance_destroy(id, false)
if ((room == tower_lemonfacejumpscare))
    alarm[1] = 145
