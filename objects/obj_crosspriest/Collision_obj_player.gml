with (other)
    holycross = 300
if ((sprite_index != spr_crosspriest_pray))
{
    sprite_index = spr_crosspriest_pray
    image_index = 0
    var p = other.id
    scr_soundeffect(sfx_cross)
    with (instance_create_unique(other.x, other.y, 977))
        playerid = p
}
