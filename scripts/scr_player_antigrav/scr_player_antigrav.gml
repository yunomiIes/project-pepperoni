function scr_player_antigrav() //gml_Script_scr_player_antigrav
{
    if ((character == "NTV"))
    {
        sprite_index = spr_playerN_bubbleidle
        move_h = (key_right + key_left)
        move_v = (key_down - key_up)
        move = (key_left + key_right)
        if ((move_h == 0))
            move_h = (key_right + key_left)
        if ((move_v == 0))
            move_v = (key_down - key_up)
        if ((target_vsp > -16))
        {
            if ((target_vsp > 0))
                target_vsp -= 0.3
            else
                target_vsp -= 0.2
        }
        hsp = Approach(hsp, (move_h * 8), 0.5)
        image_speed = (abs(vsp) / 15)
        if key_up
        {
            image_speed = clamp(image_speed, 0.35, 0.65)
            sprite_index = spr_playerN_bubbleup
            if ((target_vsp > -16) && (target_vsp <= 0))
                target_vsp -= 0.8
        }
        vsp = target_vsp
        if key_jump
        {
            movespeed = abs(hsp)
            state = (92 << 0)
            sprite_index = spr_machfreefall
            scr_soundeffect(sfx_antigravend)
        }
        if scr_solid(x, (y - 1))
        {
            scr_soundeffect(sfx_antigravbump1, 329, 330)
            target_vsp = 8
            with (create_debris(x, y, 1170))
            {
                hsp = random_range(-5, 5)
                vsp = random_range(-10, 10)
            }
        }
        if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_ratblock))) && (!(place_meeting((x + hsp), y, obj_destructibles))))
        {
            scr_soundeffect(sfx_antigravbump1, 329, 330)
            hsp = ((-hsp) * 0.8)
            repeat (3)
            {
                with (create_debris(x, y, 1170))
                {
                    hsp = random_range(-5, 5)
                    vsp = random_range(-10, 10)
                }
            }
        }
        return;
    }
    if ((character == "NTV"))
        sprite_index = spr_playerN_bubbleidle
    sprite_index = spr_currentplayer
    move = (key_right + key_left)
    hsp = Approach(hsp, (move * 8), 0.5)
    movespeed = hsp
    if ((vsp > -14))
        vsp -= 0.5
    if key_jump
    {
        movespeed = abs(hsp)
        state = (92 << 0)
        sprite_index = spr_machfreefall
        scr_soundeffect(sfx_antigravend)
    }
    if scr_solid(x, (y - 1))
    {
        audio_stop_sound(sfx_antigravbump1)
        audio_stop_sound(sfx_antigravbump2)
        audio_stop_sound(sfx_antigravbump3)
        scr_soundeffect(sfx_antigravbump1, 329, 330)
        vsp = 8
        with (create_debris(x, y, 1170))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
        }
    }
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_ratblock))) && (!(place_meeting((x + hsp), y, obj_destructibles))))
    {
        scr_soundeffect(sfx_antigravbump1, 329, 330)
        hsp = ((-hsp) * 0.8)
        repeat (3)
        {
            with (create_debris(x, y, 1170))
            {
                hsp = random_range(-5, 5)
                vsp = random_range(-10, 10)
            }
        }
    }
    image_speed = (abs(vsp) / 15)
    return;
}

