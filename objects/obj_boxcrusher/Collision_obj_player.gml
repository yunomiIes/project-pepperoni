if ((other.state == (186 << 0)))
    return;
if ((sprite_index == spr_boxcrusher_fall))
{
    other.image_index = 0
    other.state = (106 << 0)
    other.x = x
    other.y = y
}
else if ((sprite_index == spr_boxcrusher_land))
{
    other.boxxed = 1
    other.movespeed = 0
    other.state = (33 << 0)
    if ((other.sprite_index != other.spr_boxxedpepintro))
        other.sprite_index = other.spr_boxxedpepintro
    other.image_index = 0
    other.hsp = 0
    other.vsp = 0
    other.x = x
    other.y = (y - 20)
}
