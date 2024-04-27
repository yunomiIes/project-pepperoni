instance_destroy(instance_place(x, (y - 1), obj_baddie))
if place_meeting(x, (y - 1), obj_player)
{
    with (obj_player)
    {
        if ((state != (148 << 0)) && (state != (91 << 0)) && (state != (186 << 0)) && (state != (214 << 0)) && (state != (213 << 0)) && (state != (212 << 0)))
        {
            if place_meeting(x, (y + 1), -2)
            {
                if (((state != (210 << 0)) && (state != (211 << 0))) || (character == "NTV"))
                {
                    if ((!instance_exists(obj_surfback)) || (character != "NTV"))
                    {
                        if ((state != (113 << 0)) && (state != (114 << 0)) && (state != (116 << 0)) && (state != (115 << 0)))
                        {
                            if ((state != (94 << 0)) || (sprite_index != spr_currentplayer))
                                scr_soundeffect(sfx_misc_waterslidesplash)
                            state = (94 << 0)
                            sprite_index = spr_currentplayer
                        }
                        else
                        {
                            state = (116 << 0)
                            if ((sprite_index != spr_player_barrelslipnslide))
                                sprite_index = spr_player_barrelroll
                        }
                        xscale = sign(other.image_xscale)
                        movespeed = 20
                    }
                    else if ((state != (94 << 0)))
                    {
                        scr_soundeffect(sfx_misc_waterslidesplash)
                        movespeed = 15
                        state = (94 << 0)
                    }
                }
                else
                {
                    scr_soundeffect(sfx_misc_waterslidesplash)
                    with (instance_create(x, y, obj_slidecloud))
                    {
                        image_xscale = other.xscale
                        sprite_index = spr_watereffect
                    }
                    vsp = -6
                    image_index = 0
                    if ((state == (210 << 0)))
                    {
                        state = (211 << 0)
                        movespeed = abs(movespeed)
                        dir = xscale
                        movespeed += 3
                        instance_create(x, y, obj_jumpdust)
                        sprite_index = spr_player_trashslide
                    }
                }
            }
        }
    }
}
