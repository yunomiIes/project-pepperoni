function scr_player_tumble() //scr_player_tumble
{
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        railmovespeed = _railinst.movespeed
        raildir = _railinst.dir
    }
    hsp = ((xscale * movespeed) + (railmovespeed * raildir))
    move = (key_right + key_left)
    mask_index = spr_crouchmask
    if ((sprite_index == spr_tumblestart))
        movespeed = 6
    if (grounded && (sprite_index == spr_pizzelle_machroll) && (movespeed >= 11.99) && (sprite_index != spr_pizzelle_mach3roll_new))
        sprite_index = spr_pizzelle_mach3rollstart_new
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_pizzelle_mach3rollstart_new))
        sprite_index = spr_pizzelle_mach3roll_new
    if ((sprite_index == spr_playerV_divekickstart) && (floor(image_index) == (image_number - 1)))
        sprite_index = spr_playerV_divekick
    if (((sprite_index == spr_player_faceplant) || (sprite_index == spr_pizzelle_machtumble)) && (floor(image_index) == (image_number - 1)) && (!key_attack))
        state = (0 << 0)
    if (((sprite_index == spr_player_faceplant) || (sprite_index == spr_pizzelle_machtumble)) && (floor(image_index) == (image_number - 1)) && key_attack)
    {
        if ((movespeed >= 12))
        {
            state = (121 << 0)
            sprite_index = spr_rollgetup
        }
        else if ((movespeed <= 12))
        {
            state = (121 << 0)
            movespeed = 12
            sprite_index = spr_rollgetup
        }
    }
    if ((sprite_index == spr_crouchslip) && key_jump2 && jumpdiveTEST && (character == "P"))
    {
        vsp = -10
        sprite_index = spr_player_jumpdive1
    }
    if ((sprite_index == spr_dive) && key_slap2 && jumpdiveTEST && (character == "P"))
    {
        vsp = -10
        sprite_index = spr_player_jumpdive1
    }
    if (((!grounded) && ((sprite_index == spr_machroll) || (sprite_index == spr_mach2jump) || (sprite_index == spr_crouchslip) || (sprite_index == spr_player_backslide) || (sprite_index == spr_player_backslideland) || (sprite_index == spr_pizzelle_mach3rollstart_new) || (sprite_index == spr_pizzelle_mach3roll_new) || (sprite_index == spr_playerN_fastroll))) || ((!grounded) && (sprite_index == spr_dive) && (character == "NTV")))
    {
        if ((character == "NTV"))
        {
            scr_soundeffect(sfx_divebomb1)
            sprite_index = spr_playerN_divebomb
            tornadomaskbuffer = 23
            state = (306 << 0)
            vsp = 20
            savedmove = xscale
            movespeed = hsp
            image_index = 0
            return;
        }
        else
        {
            vsp = 10
            sprite_index = spr_dive
            scr_soundeffect(sfx_pep_dive)
        }
    }
    if (grounded && (sprite_index == spr_dive) && (character != "S"))
    {
        sprite_index = spr_machroll
        image_index = 0
    }
    if (grounded && (sprite_index == spr_dive) && (character == "S"))
    {
        if ((movespeed >= 12))
        {
            sprite_index = spr_mach4
            image_index = 0
            movespeed = 12
            state = (121 << 0)
        }
        else
        {
            state = (104 << 0)
            movespeed = 8
            sprite_index = spr_mach
            image_index = 0
        }
    }
    if (!finalmoveset)
    {
        if (grounded && (sprite_index != spr_tumble))
            movespeed -= 0.05
    }
    if ((sprite_index == spr_dive) && key_jump && (character != "PZ"))
    {
        if ((character != "NTV"))
        {
            sprite_index = spr_poundcancel1
            scr_soundeffect(sfx_groundpoundstart)
            image_index = 0
            state = (108 << 0)
            vsp = -6
        }
        else
        {
            sprite_index = spr_playerN_divebomb
            state = (306 << 0)
            vsp = 20
            hsp = 0
            savedmove = xscale
            movespeed = 0
            image_index = 0
            return;
        }
    }
    if ((sprite_index == spr_dive) && key_jump && (character == "PZ"))
    {
        sprite_index = spr_pizzelle_groundpoundprep
        scr_soundeffect(sfx_groundpoundstart)
        image_index = 0
        state = (108 << 0)
        vsp = -6
    }
    if ((movespeed <= 2) && (sprite_index != spr_breakdance))
        state = (0 << 0)
    if ((!scr_slope()) && (sprite_index == spr_tumblestart) && (floor(image_index) < 11))
        image_index = 11
    if ((sprite_index == spr_mach2jump) && grounded)
    {
        image_index = 0
        sprite_index = spr_machroll
    }
    if ((sprite_index == spr_player_mach2jump) && grounded)
    {
        image_index = 0
        sprite_index = spr_machroll
    }
    if ((sprite_index == spr_Sjumpcancelland) && (floor(image_index) == (image_number - 1)))
        sprite_index = spr_Sjumpcancelslide
    if ((sprite_index == spr_player_jumpdive2) && grounded)
        sprite_index = spr_crouchslip
    if ((sprite_index == spr_player_jumpdive1) && (floor(image_index) == (image_number - 1)))
        sprite_index = spr_player_jumpdive2
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_player_machroll) && (movespeed >= 11))
    {
        sprite_index = spr_player_backslideland
        image_index = 0
    }
    if ((sprite_index == spr_playerN_machroll) && (movespeed >= 11))
    {
        sprite_index = spr_playerN_fastroll
        image_index = 0
    }
    if ((sprite_index == spr_machroll) && (!grounded) && (!finalmoveset))
        sprite_index = spr_player_mach2jump
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_player_backslideland))
        sprite_index = spr_player_backslide
    if ((sprite_index == spr_Sjumpcancel) && grounded)
        sprite_index = spr_Sjumpcancelland
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_Sjumpcancelland))
        sprite_index = spr_Sjumpcancelslide
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_breakdance))
    {
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        movespeed = 12
        sprite_index = spr_breakdancesuper
    }
    if ((sprite_index == spr_tumblestart) && (floor(image_index) == (image_number - 1)))
    {
        sprite_index = spr_tumble
        movespeed = 14
    }
    if (((state != (108 << 0)) && (place_meeting((x + xscale), y, obj_solid) || scr_solid_slope((x + xscale), y)) && (!(place_meeting((x + hsp), y, obj_rollblock))) && ((!(place_meeting((x + hsp), y, obj_rattumble))) || (sprite_index != spr_tumble)) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || place_meeting(x, y, obj_timedgate))
    {
        hsp = 0
        movespeed = 0
        if ((sprite_index == spr_tumble) || (sprite_index == spr_tumblestart))
        {
            scr_soundeffect(sfx_bumpwall)
            state = (106 << 0)
            landAnim = 0
            sprite_index = spr_tumbleend
            image_index = 0
            hsp = ((-xscale) * 2)
            vsp = -3
            jumpstop = 1
        }
        else if finalmoveset
        {
            scr_soundeffect(sfx_pep_splat)
            state = (106 << 0)
            image_index = 0
            sprite_index = spr_wallsplat
        }
    }
    if key_jump
        input_buffer_jump = 0
    if ((!key_jump2) && (jumpstop == 0) && (vsp < 0.5) && (stompAnim == 0))
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && (vsp > 0) && (!(place_meeting(x, y, obj_bigcheese))))
        jumpstop = 0
    if ((input_buffer_jump < 8) && grounded && (hsp != 0) && (sprite_index == spr_tumble))
    {
        with (instance_create(x, y, obj_highjumpcloud2))
            image_xscale = other.xscale
        vsp = -11
        image_index = 0
    }
    if ((crouchslipbuffer > 0))
        crouchslipbuffer--
    if ((!key_down) && key_attack && grounded && (sprite_index != spr_tumble) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && (sprite_index != spr_breakdance) && (sprite_index != spr_player_faceplant) && (sprite_index != spr_pizzelle_machtumble))
    {
        if ((crouchslipbuffer == 0))
        {
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale
            if ((movespeed >= 12))
                state = (121 << 0)
            else
                state = (104 << 0)
            image_index = 0
            sprite_index = spr_rollgetup
        }
        if ((crouchslipbuffer == 0) && (character == "M"))
        {
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale
            state = (121 << 0)
            movespeed = 12
            image_index = 0
            sprite_index = spr_mach4
        }
    }
    if ((!key_down) && (!key_attack) && grounded && (sprite_index != spr_tumble) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && (sprite_index != spr_breakdance) && (sprite_index != spr_player_faceplant) && (sprite_index != spr_pizzelle_machtumble))
    {
        if ((crouchslipbuffer == 0))
        {
            if ((movespeed > 6))
            {
                state = (105 << 0)
                sprite_index = spr_machslidestart
                image_index = 0
            }
            else
                state = (0 << 0)
        }
    }
    if ((sprite_index == spr_Sjumpcancelslide) || (sprite_index == spr_breakdancesuper) || (sprite_index == spr_machroll) || (sprite_index == spr_tumble) || (sprite_index == spr_tumblestart) || (sprite_index == spr_machroll) || (sprite_index == spr_player_mach2jump) || (sprite_index == spr_player_backslide) || (sprite_index == spr_playerV_divekickstart) || (sprite_index == spr_playerV_dive) || (sprite_index == spr_pizzelle_mach3rollstart_new))
        image_speed = (abs(movespeed) / 15)
    else if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_mach2jump))
        image_speed = 0
    else if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_Sjumpcancel))
        image_speed = 0
    else
        image_speed = 0.35
    if ((sprite_index == spr_player_faceplant) || (sprite_index == spr_pizzelle_machtumble))
        image_speed = 0.45
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    return;
}

