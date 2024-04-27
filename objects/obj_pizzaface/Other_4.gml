image_alpha = 0
x = obj_player1.x
y = obj_player1.y
if global.pizzafaceicon
{
    with (instance_create(x, y, obj_objecticontracker))
    {
        objectID = other.id
        if ((obj_player1.character == "PZ") || (obj_player1.character == "PI"))
        {
            sprite_index = spr_icon_coneball
            image_speed = 0.18
        }
        else
            sprite_index = spr_pizzafaceicon
    }
}
if ((room == rank_room))
    instance_destroy()
if ((room == timesuproom))
    instance_destroy(id, false)
movespeed = maxspeed
