function scr_player_slipnslide() //scr_player_slipnslide
{
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    alarm[5] = -1
    alarm[8] = 60
    alarm[7] = 120
    hurted = 1
    machhitAnim = 0
    crouchslideAnim = 1
    if ((character == "NTV"))
    {
        image_speed = 0.35
        sprite_index = spr_playerN_surfing
        move = (key_left + key_right)
        hsp = (xscale * movespeed)
        if ((move != 0))
        {
            if ((xscale == move))
                movespeed = Approach(movespeed, 15, 0.4)
            else
            {
                movespeed = Approach(movespeed, 0, 0.2)
                if ((movespeed == 0))
                    xscale = move
            }
        }
        else
            movespeed = Approach(movespeed, 0, 0.1)
        if scr_noise_machcancel_grab2()
            return;
        if (scr_solid((x + sign(hsp)), y) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
            movespeed = 0
        if (grounded && (vsp > 0))
        {
            if place_meeting(x, (y + 1), obj_current)
            {
                if key_jump2
                    vsp = -10
                else
                    vsp = -3
                with (instance_create(x, y, obj_slidecloud))
                {
                    image_xscale = other.xscale
                    sprite_index = spr_watereffect
                    scr_soundeffect(sfx_misc_waterslidesplash)
                }
            }
            else
            {
                state = (0 << 0)
                if key_attack
                {
                    state = (104 << 0)
                    if ((movespeed < 6))
                        movespeed = 6
                }
                image_index = 0
            }
        }
        return;
    }
    hsp = (xscale * movespeed)
    if ((movespeed <= 0))
    {
        state = (0 << 0)
        movespeed = 0
        mach2 = 0
        image_index = 0
    }
    if (scr_solid((x + xscale), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        state = (92 << 0)
        vsp = -14
        jumpstop = 1
    }
    if (scr_slope() && (movespeed <= 0))
        movespeed = 2
    image_speed = 0.35
    if ((!instance_exists(obj_slidecloud)) && grounded && (movespeed > 1.5) && (sprite_index == spr_slipnslide))
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale
    }
    if ((!instance_exists(obj_slidecloud)) && grounded && (movespeed > 1.5) && place_meeting(x, (y + 1), obj_current))
    {
        with (instance_create(x, y, obj_slidecloud))
        {
            image_xscale = other.xscale
            sprite_index = spr_watereffect
            scr_soundeffect(sfx_misc_waterslidesplash)
        }
    }
    if ((sprite_index == spr_currentplayer) && (!(place_meeting(x, (y + 1), obj_current))))
    {
        scr_soundeffect(sfx_misc_waterslidesplash)
        scr_soundeffect(sfx_bananaslip)
        vsp = -5
        sprite_index = spr_slipbanan1
        image_index = 0
        state = (165 << 0)
    }
    if ((sprite_index == spr_slipnslide) && place_meeting(x, (y + 1), obj_current))
        sprite_index = spr_currentplayer
}

