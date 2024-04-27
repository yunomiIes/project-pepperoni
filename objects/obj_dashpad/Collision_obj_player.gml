with (other)
{
    if ((state != (186 << 0)) && (state != (146 << 0)))
    {
        var changecoord = 1
        if place_meeting(x, y, obj_superspring)
            changecoord = 0
        if changecoord
            y = (other.y - 14)
        vsp = 0
        create_particle(x, y, (5 << 0), 0)
        if ((boxxed == 0) && (isgustavo == 0))
        {
            if ((character == "P") || (character == "PZ") || (character == "B") || (character == "NTV"))
            {
                if ((sprite_index != spr_dashpadmach))
                {
                    sprite_index = spr_dashpadmach
                    image_index = 0
                }
            }
            else if ((character == "N") || (character == "PI") || (character == "V") || (character == "M"))
            {
                if ((sprite_index != spr_crazyrun))
                {
                    sprite_index = spr_crazyrun
                    image_index = 0
                }
            }
            if audio_is_playing(sfx_dashpad)
                audio_stop_sound(sfx_dashpad)
            scr_soundeffect(sfx_dashpad)
            machhitAnim = 0
            state = (121 << 0)
            xscale = sign(other.image_xscale)
            if ((movespeed < 14))
            {
                movespeed = 14
                hsp = (xscale * movespeed)
            }
            else
            {
                movespeed += 0.5
                hsp = (xscale * movespeed)
            }
            other.buffer = 30
        }
        else
        {
            xscale = sign(other.image_xscale)
            if boxxed
            {
                boxxeddash = 1
                if ((abs(movespeed) < 14))
                    movespeed = (xscale * 14)
                else
                    movespeed += (xscale * 0.5)
                sprite_index = spr_boxxedpepwalk
                state = (33 << 0)
                other.buffer = 30
            }
            if isgustavo
            {
                create_particle(x, y, (5 << 0), 0)
                xscale = sign(other.image_xscale)
                dir = xscale
                ratmount_movespeed = 14
                gustavodash = 51
                state = (191 << 0)
                if ((abs(movespeed) < 14))
                    movespeed = (other.image_xscale * 14)
                other.buffer = 30
            }
        }
    }
}
