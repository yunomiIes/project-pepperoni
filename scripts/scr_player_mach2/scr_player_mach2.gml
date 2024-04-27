function scr_player_mach2() //gml_Script_scr_player_mach2
{
    if ((windingAnim < 2000))
        windingAnim++
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        railmovespeed = _railinst.movespeed
        raildir = _railinst.dir
    }
    hsp = ((xscale * movespeed) + (railmovespeed * raildir))
    move2 = (key_right2 + key_left2)
    move = (key_right + key_left)
    crouchslideAnim = 1
    if ((!key_jump2) && (jumpstop == 0) && (vsp < 0.5))
    {
        vsp /= 20
        jumpstop = 1
    }
    if (grounded && (vsp > 0))
        jumpstop = 0
    if ((input_buffer_jump < 8) && grounded && (sprite_index != spr_secondjump1) && (sprite_index != spr_clownjump) && (!(((move == 1) && (xscale == -1)))) && (!(((move == -1) && (xscale == 1)))))
    {
        image_index = 0
        sprite_index = spr_secondjump1
        if ((character != "NTV"))
            scr_soundeffect(sfx_jump)
        else
            scr_soundeffect(sfx_jumpN)
        if skateboarding
            sprite_index = spr_clownjump
        vsp = -11
    }
    if ((!grounded) && ispeppino && key_up && (character == "NTV") && noisedoublejump && key_jump && (!skateboarding) && (sprite_index != spr_clownjump))
        scr_player_do_noisecrusher()
    var mortjump = 0
    if (key_jump && (global.mort == 1) && (sprite_index != spr_mortdoublejump) && (!grounded) && (!skateboarding))
    {
        state = (92 << 0)
        repeat (6)
            create_debris(x, y, 1178)
        scr_soundeffect(sfx_woosh)
        sprite_index = spr_mortdoublejump
        image_index = 0
        grav = 0.25
        with (instance_create(x, y, obj_highjumpcloud2))
            image_xscale = other.xscale
        mort = 1
        mortjump = 1
    }
    if (grounded && (vsp > 0))
    {
        if ((sprite_index == spr_playerN_skateboarddoublejump))
            sprite_index = spr_mach
        if ((machpunchAnim == 0) && (sprite_index != spr_mach) && (sprite_index != spr_mach1) && (sprite_index != spr_mach4) && (sprite_index != spr_player_machhit))
        {
            if ((sprite_index != spr_player_machhit) && (sprite_index != spr_rollgetup) && (sprite_index != spr_suplexdash) && (sprite_index != spr_taunt) && (sprite_index != spr_player_Sjumpcancelstart))
                sprite_index = spr_mach
        }
        if ((machpunchAnim == 1))
        {
            if ((punch == 0))
                sprite_index = spr_machpunch1
            if ((punch == 1))
                sprite_index = spr_machpunch2
            if ((floor(image_index) == 4) && (sprite_index == spr_machpunch1))
            {
                punch = 1
                machpunchAnim = 0
            }
            if ((floor(image_index) == 4) && (sprite_index == spr_machpunch2))
            {
                punch = 0
                machpunchAnim = 0
            }
        }
    }
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_mach1))
        sprite_index = spr_mach
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_pizzano_kungfuair1start))
        sprite_index = spr_pizzano_kungfuair1
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_pizzano_kungfuair2start))
        sprite_index = spr_pizzano_kungfuair2
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_pizzano_kungfuair3start))
        sprite_index = spr_pizzano_kungfuair3
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_longjump))
        sprite_index = spr_longjumpend
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_playerN_skateboarddoublejump))
        image_index = (image_number - 3)
    if ((sprite_index == spr_playerN_skateboarddoublejump) && grounded && (vsp > 0))
        sprite_index = spr_mach
    if (!grounded)
        machpunchAnim = 0
    if grounded
    {
        if (scr_slope() && (hsp != 0) && (movespeed > 8))
            scr_player_addslopemomentum(0.1, 0.2)
        if ((movespeed < 12) && (character != "S") && (character != "M"))
        {
            if ((mach4mode == 0))
                movespeed += 0.1
            else
                movespeed += 0.2
        }
        if ((movespeed < 12) && (character == "S"))
        {
            if ((mach4mode == 0))
                movespeed += 0.2
            else
                movespeed += 0.3
        }
        if ((movespeed < 12) && (character == "M"))
        {
            movespeed = 12
            sprite_index = spr_mach4
            state = (121 << 0)
        }
        if ((abs(hsp) >= 12) && (skateboarding == 0) && (sprite_index != spr_suplexdash))
        {
            machhitAnim = 0
            state = (121 << 0)
            flash = 1
            if ((sprite_index != spr_rollgetup))
                sprite_index = spr_mach4
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
        }
    }
    if key_jump
        input_buffer_jump = 0
    if (((!grounded) && (place_meeting((x + hsp), y, obj_solid) || scr_solid_slope((x + hsp), y)) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || (grounded && (place_meeting((x + sign(hsp)), (y - 16), obj_solid) || scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting(x, (y + 1), obj_slope)))
    {
        if (!finalmoveset)
        {
            wallspeed = movespeed
            if ((vsp > 0))
                wallspeed -= vsp
            state = (37 << 0)
        }
        else
        {
            wallspeed = movespeed
            grabclimbbuffer = 0
            if ((movespeed < 1))
                wallspeed = 1
            else
                movespeed = wallspeed
            state = (37 << 0)
        }
    }
    if ((!grounded) && place_meeting((x + sign(hsp)), y, obj_climbablewall) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))))
    {
        wallspeed = movespeed
        if finalmoveset
            grabclimbbuffer = 0
        state = (37 << 0)
    }
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    if (grounded && (floor(image_index) == (image_number - 1)) && ((sprite_index == spr_rollgetup) || (sprite_index == spr_player_rampjump)))
        sprite_index = spr_mach
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_suplexdash))
        sprite_index = spr_mach
    if ((!grounded) && (sprite_index != spr_playerN_skateboarddoublejump) && (sprite_index != spr_playerN_sidewayspin) && (sprite_index != spr_playerN_grindcancel) && (sprite_index != spr_playerN_sidewayspinend) && (sprite_index != spr_secondjump2) && (sprite_index != spr_clownjump) && (sprite_index != spr_clownfall) && (sprite_index != spr_mach2jump) && (sprite_index != spr_mach2jump) && (sprite_index != spr_walljumpstart) && (sprite_index != spr_taunt) && (sprite_index != spr_player_Sjumpcancelstart) && (sprite_index != spr_walljumpend) && (sprite_index != spr_longjump) && (sprite_index != spr_longjumpend) && (sprite_index != spr_pizzelle_mach2jump) && (sprite_index != spr_pizzano_kungfuair1start) && (sprite_index != spr_pizzano_kungfuair1) && (sprite_index != spr_pizzano_kungfuair2start) && (sprite_index != spr_pizzano_kungfuair2) && (sprite_index != spr_pizzano_kungfuair3start) && (sprite_index != spr_pizzano_kungfuair3))
    {
        sprite_index = spr_secondjump1
        if skateboarding
            sprite_index = spr_clownfall
    }
    if ((sprite_index == spr_playerN_sidewayspin) && (floor(image_index) == (image_number - 1)))
        sprite_index = spr_playerN_sidewayspinend
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_secondjump1))
        sprite_index = spr_secondjump2
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_walljumpstart))
        sprite_index = spr_walljumpend
    if ((!grounded) && (sprite_index != spr_clownfall) && (sprite_index == spr_clownjump) && (floor(image_index) == (image_number - 1)))
        sprite_index = spr_clownfall
    if (grounded && ((sprite_index == spr_playerN_sidewayspin) || (sprite_index == spr_playerN_grindcancel) || (sprite_index == spr_playerN_sidewayspinend)))
        sprite_index = spr_mach
    if (key_down && (!(place_meeting(x, y, obj_dashpad))))
    {
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        flash = 0
        state = (5 << 0)
        vsp = 10
        image_index = 0
        if (!grounded)
        {
            if ((character != "NTV"))
                scr_soundeffect(sfx_pep_dive)
            if (!finalmoveset)
                sprite_index = spr_mach2jump
            else
                sprite_index = spr_dive
        }
        else
            sprite_index = spr_machroll
        if ((character == "V"))
            sprite_index = spr_playerV_dive
    }
    if (key_shoot && key_attack && (!(place_meeting((x + xscale), y, obj_solid))) && (character == "S") && grounded && (move == 0))
    {
        state = (42 << 0)
        movespeed = 0
    }
    if (scr_solid((x + xscale), y) && (!scr_slope()) && (scr_solid_slope((x + sign(hsp)), y) || place_meeting((x + sign(hsp)), y, obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_climbablewall))) && grounded)
    {
        if skateboarding
            xscale *= -1
        else
        {
            var _bump = ledge_bump(((vsp >= 0) ? 32 : 22))
            if _bump
            {
                state = (106 << 0)
                image_index = 0
                sprite_index = spr_wallsplat
            }
        }
    }
    if ((!key_attack) && (movespeed >= 8) && grounded && (skateboarding == 0))
    {
        image_index = 0
        state = (105 << 0)
        scr_soundeffect(sfx_break)
        sprite_index = spr_machslidestart
    }
    else if ((!key_attack) && (movespeed < 8) && grounded && (skateboarding == 0))
        state = (0 << 0)
    if ((move == (-xscale)) && (movespeed >= 8) && grounded && (skateboarding == 0))
    {
        scr_soundeffect(sfx_machslideboost)
        image_index = 0
        state = (105 << 0)
        sprite_index = spr_machslideboost
    }
    else if ((move == (-xscale)) && (movespeed < 8) && grounded && (skateboarding == 0))
    {
        xscale *= -1
        movespeed = 6
    }
    if ((clowntimer > 0) && (skateboarding == 1))
        clowntimer--
    if ((clowntimer <= 0) && (skateboarding == 1))
    {
        state = (0 << 0)
        instance_create(x, y, obj_genericpoofeffect)
    }
    if (key_slap2 && (character == "V"))
    {
        vsp = -5
        state = (1 << 0)
        image_index = 0
        sprite_index = spr_playerV_airrevolver
        image_index = 0
        with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
        {
            is_solid = 0
            image_xscale = other.xscale
        }
        scr_soundeffect(sfx_killingblow)
    }
    if (key_shoot2 && (character == "V") && (!instance_exists(dynamite_inst)))
    {
        vsp = -5
        state = (2 << 0)
        image_index = 0
        sprite_index = spr_playerV_dynamitethrow
        with (instance_create(x, y, obj_dynamite))
        {
            image_xscale = other.xscale
            other.dynamite_inst = id
            playerid = other.id
            movespeed = (other.movespeed + 4)
            vsp = -6
        }
    }
    if ((sprite_index == spr_rollgetup) || (sprite_index == spr_suplexdash) || (sprite_index == spr_pizzelle_longjump))
        image_speed = 0.4
    else
        image_speed = (abs(movespeed) / 15)
    scr_dotaunt()
    if (skateboarding && (sprite_index != spr_clownjump) && grounded)
        sprite_index = spr_clown
    if mortjump
        sprite_index = spr_player_mortjumpstart
    if (!finalmoveset)
    {
        if (key_shoot2 && shotgunAnim)
            scr_shotgunshoot()
        if ((key_slap2 || (input_buffer_slap < 8)) && (!key_up) && (character != "V") && (character != "S"))
        {
            if ((character != "PI"))
            {
                sprite_index = spr_suplexdash
                suplexmove = 1
                suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
                sfx_gain(suplexdashsnd)
                state = (42 << 0)
                image_index = 0
            }
            if ((character == "PI"))
            {
                sprite_index = choose(spr_pizzano_kungfu1, spr_pizzano_kungfu2, spr_pizzano_kungfu3, spr_pizzano_kungfu4, spr_pizzano_kungfu5)
                scr_soundeffect(sfx_kungfuair)
                state = (80 << 0)
                image_index = 0
            }
        }
    }
    else if shotgunAnim
    {
        if key_slap2
            scr_shotgunshoot()
    }
    else if ((character != "V") && (character != "S"))
    {
        if ((key_slap2 || (input_buffer_slap < 8)) && (!key_up))
        {
            if ((character != "PI"))
            {
                sprite_index = spr_suplexdash
                suplexmove = 1
                suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
                sfx_gain(suplexdashsnd)
                state = (42 << 0)
                image_index = 0
            }
            if ((character == "PI"))
            {
                sprite_index = choose(spr_pizzano_kungfu1, spr_pizzano_kungfu2, spr_pizzano_kungfu3, spr_pizzano_kungfu4, spr_pizzano_kungfu5)
                scr_soundeffect(sfx_kungfuair)
                state = (80 << 0)
                image_index = 0
            }
        }
        else if (key_slap2 && (input_buffer_slap > 0) && key_up && (shotgunAnim == 0))
        {
            input_buffer_slap = 0
            state = (80 << 0)
            image_index = 0
            sprite_index = spr_breakdanceuppercut
            movespeed = 8
            if ((character != "NTV"))
                vsp = -10
            else
                vsp = -21
            movespeed = hsp
            particle_set_scale((4 << 0), xscale, 1)
            create_particle(x, y, (4 << 0), 0)
            if ((character == "NTV"))
            {
                repeat (4)
                {
                    with (instance_create((x + irandom_range(-40, 40)), (y + irandom_range(-40, 40)), obj_explosioneffect))
                    {
                        sprite_index = spr_shineeffect
                        image_speed = 0.35
                    }
                }
            }
        }
    }
    if ((global.attackstyle == 2) && key_slap2)
    {
        randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 557, 556, 555, spr_punch])
        image_index = 0
        state = (43 << 0)
    }
    return;
}

