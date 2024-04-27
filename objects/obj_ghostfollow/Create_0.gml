hsp = 0
vsp = 0
depth = -70
movespeed = 2
image_alpha = 0.75
start_alpha = image_alpha
image_speed = 0.35
blur_effect = 0
state = (0 << 0)
fadein = 0
locked = 0
lap5 = 0
if lap5
{
    with (instance_create(x, y, obj_objecticontracker))
    {
        objectID = other.id
        sprite_index = spr_icon_ghostjohn
        image_speed = 0.18
    }
}
mask_index = spr_ghostjohn
if ((global.laps >= 4))
    persistent = 1
else
    persistent = 0
