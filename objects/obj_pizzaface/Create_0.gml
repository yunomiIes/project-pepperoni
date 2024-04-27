maxspeed = 8
movespeed = maxspeed
parryable = 0
movedir = 0
treasure = 0
image_speed = 0.35
depth = -5
x = obj_player1.x
y = obj_player1.y
alarm[1] = 10
image_alpha = 0
if ((obj_player1.character == "PZ") || (obj_player1.character == "PI"))
    sprite_index = spr_coneball_new
else if ((obj_player1.character != "PZ") && (obj_player1.character != "PI") && (global.laps >= 4))
    sprite_index = spr_pizzahead_haywire
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
