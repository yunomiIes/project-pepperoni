if ((!locked) && (state != (291 << 0)) && (other.state != (112 << 0)) && (other.state != (146 << 0)) && (other.state != (95 << 0)))
{
    with (other)
    {
        hitX = x
        hitY = y
        state = (291 << 0)
        sprite_index = spr_hurt
        image_speed = 0.35
    }
    scr_soundeffect(sfx_johnghost)
    fadein = 0
    state = (291 << 0)
    playerid = other.id
}
