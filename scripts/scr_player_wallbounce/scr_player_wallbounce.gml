function scr_player_wallbounce() //gml_Script_scr_player_wallbounce
{
    move = (key_left + key_right)
    var targethsp = (10 * move)
    if ((targethsp != 0) || (abs(hsp) < 10))
        hsp = Approach(hsp, targethsp, 1)
    if (grounded && (vsp > 0))
    {
        noise_jumpstop = 0
        if ((targethsp != 0))
            xscale = sign(targethsp)
        else if ((hsp != 0))
            xscale = sign(hsp)
        movespeed = (max(((abs(hsp) / 10) * 12), 6) * abs(sign(hsp)))
        hsp = (movespeed * xscale)
        noise_tornado_do = 1
        if ((movespeed != 0))
        {
            if ((movespeed >= 12))
            {
                with (instance_create(x, y, obj_noiseparticle))
                {
                    sprite_index = spr_noisevfxland
                    image_xscale = other.xscale
                }
            }
            sprite_index = ((movespeed >= 12) ? spr_mach4 : spr_mach)
            state = ((movespeed >= 12) ? (121 << 0) : (104 << 0))
        }
        else
            state = (0 << 0)
        return;
    }
    if (key_jump2 && (!noise_jumpneed))
        noise_jumpneed = 1
    if ((!key_jump2) && noise_jumpneed && (!noise_jumpstop) && (vsp < 0.5))
    {
        vsp /= 20
        noise_jumpstop = 1
    }
    var extra = sign(targethsp)
    if ((targethsp == 0))
        extra = xscale
    if (key_jump && (place_meeting((x + (extra * 8)), y, obj_solid) || scr_solid_slope((x + (extra * 8)), y)) && (!noise_wallbounce_buffer))
    {
        noise_wallbounce_buffer = 5
        noise_jumpstop = 0
        noise_jumpneed = 1
        noise_afterimage = 1
        vsp = -18
        instance_create((x + (sign(extra) * 8)), y, obj_noiseparticle)
        input_buffer_slap = 0
        noise_tornado_do = 1
        scr_soundeffect(sfx_misc_sniffbump)
        return;
    }
    if (key_down && noise_tornado_do)
    {
        noise_tornado_do = 0
        noise_tornado_timer = 15
        noise_tornado_skip = 0
        state = (306 << 0)
        scr_soundeffect(sfx_noise_machslide)
        return;
    }
    if (key_slap2 && (!noise_wallbounce_buffer))
    {
        input_buffer_shoot = 0
        noise_wallbounce_buffer = 5
        instance_create(x, y, obj_crazyrunothereffect)
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale
        noise_tornado_do = 1
        vsp = -4
        image_index = 0
        sprite_index = spr_playerN_wallbouncespinstart
        state = (305 << 0)
        input_buffer_slap = 0
        if ((hsp != 0))
            xscale = sign(hsp)
        hsp = (xscale * 14)
        scr_soundeffect(sfx_Nspin)
        return;
    }
    if ((noise_afterimage > 2))
        noise_afterimage--
    else if ((noise_afterimage == 2))
    {
        with (create_mach3effect(x, y, sprite_index, (image_index - 1)))
        {
            playerid = other.id
            image_xscale = other.xscale
        }
        noise_afterimage--
    }
    else if (!noise_afterimage)
    {
        noise_afterimage = 7
        with (create_red_afterimage(x, y, sprite_index, (image_index - 1), xscale))
            playerid = other.id
    }
    else
        noise_afterimage--
    sprite_index = spr_playerN_wallbounce
    image_speed = 0.35
}

