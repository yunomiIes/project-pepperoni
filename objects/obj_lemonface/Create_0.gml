maxspeed = 8
movespeed = 1
parryspeed = 1
parryable = 0
movedir = 0
treasure = 0
hsp = 0
vsp = 0
image_speed = 0.35
depth = -5
x = obj_player1.x
y = obj_player1.y
alarm[0] = 10
image_alpha = 0
lastframexdistance = 0
lastframeydistance = 0
if global.pizzafaceicon
{
    with (instance_create(x, y, obj_objecticontracker))
    {
        objectID = other.id
        sprite_index = spr_pizzafaceicon
    }
}
