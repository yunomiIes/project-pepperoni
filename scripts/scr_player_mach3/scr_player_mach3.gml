function scr_player_mach3() //scr_player_mach3
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
    if grounded
    {
        if (scr_slope() && (hsp != 0) && (movespeed > 10) && (movespeed < 18))
            scr_player_addslopemomentum(0.1, 0.2)
    }
    if ((move == xscale) && grounded)
    {
        if ((movespeed < 20) && (character != "S") && (character != "M") && (character != "PZ"))
        {
            if ((mach4mode == 0))
                movespeed += 0.025
            else
                movespeed += 0.1
        }
        else if ((movespeed < 24) && (character == "PZ"))
        {
            if ((mach4mode == 0))
                movespeed += 0.025
            else
                movespeed += 0.01
        }
        else if ((movespeed < 40) && (character == "S"))
        {
            if ((mach4mode == 0))
                movespeed += 0.04
            else
                movespeed += 0.2
        }
        else if ((movespeed < 24) && (character == "M"))
            movespeed += 0.02
    }
    if (grounded && (sprite_index == spr_playerN_skateboarddoublejump))
        sprite_index = spr_mach4
    mach2 = 100
    momemtum = 1
    move = (key_right + key_left)
    move2 = (key_right2 + key_left2)
    if ((fightball == 1) && (global.coop == 1))
    {
        if ((object_index == obj_player1))
        {
            x = obj_player2.x
            y = obj_player2.y
        }
        if ((object_index == obj_player2))
        {
            x = obj_player1.x
            y = obj_player1.y
        }
    }
    if ((character == "NTV") && grounded)
    {
        if ((sprite_index == spr_mach4) && place_meeting(x, (y + 1), obj_water))
            sprite_index = spr_playerN_mach3water
        else if ((sprite_index == spr_playerN_mach3water) && (!(place_meeting(x, (y + 1), obj_water))))
            sprite_index = spr_mach4
    }
    if ((sprite_index == spr_crazyrun))
    {
        if ((flamecloud_buffer > 0))
            flamecloud_buffer--
        else
        {
            flamecloud_buffer = 10
            with (instance_create(x, y, obj_dashcloud))
            {
                image_xscale = other.xscale
                sprite_index = spr_flamecloud
            }
        }
    }
    crouchslideAnim = 1
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_playerN_skateboarddoublejump))
        image_index = (image_number - 3)
    if ((sprite_index == spr_playerN_skateboarddoublejump) && grounded && (vsp > 0))
        sprite_index = spr_mach4
    if ((!key_jump2) && (jumpstop == 0) && (vsp < 0.5))
    {
        vsp /= 20
        jumpstop = 1
    }
    if (grounded && (vsp > 0))
        jumpstop = 0
    if ((input_buffer_jump < 8) && (sprite_index != spr_mach3jump) && grounded && (!(((move == 1) && (xscale == -1)))) && (!(((move == -1) && (xscale == 1)))))
    {
        if ((character != "NTV"))
            scr_soundeffect(sfx_jump)
        else
            scr_soundeffect(sfx_jumpN)
        if ((sprite_index != spr_fightball) && (character != "M"))
        {
            image_index = 0
            sprite_index = spr_mach3jump
        }
        if ((character == "P") || (character == "PI") || (character == "PZ") || (character == "B") || (character == "S") || (character == "M") || (character == "NTV"))
            vsp = -11
        else
            vsp = -13
    }
    if ((!grounded) && ispeppino && key_up && (character == "NTV") && noisedoublejump && key_jump)
        scr_player_do_noisecrusher()
    if ((fightball == 0))
    {
        if ((sprite_index == spr_mach3jump) && (floor(image_index) == (image_number - 1)) && (character != "PI"))
            sprite_index = spr_mach4
        if ((sprite_index == spr_pizzelle_superjump_cancel) && grounded)
            sprite_index = spr_mach4
        if ((sprite_index == spr_playerB_Sjumpcancel) && grounded)
            sprite_index = spr_rollgetup
        if finalmoveset
        {
            if ((sprite_index == spr_player_Sjumpcancel) && grounded)
                sprite_index = spr_rollgetup
        }
        if ((sprite_index == spr_pizzano_sjumpside) && grounded)
            sprite_index = spr_pizzano_mach3
        if ((floor(image_index) == (image_number - 1)) && ((sprite_index == spr_rollgetup) || (sprite_index == spr_mach3hit) || (sprite_index == spr_dashpadmach)))
            sprite_index = spr_mach4
        if ((sprite_index == spr_mach2jump) && grounded && (vsp > 0))
            sprite_index = spr_mach4
        if ((sprite_index == spr_mach2jump) && grounded)
            sprite_index = spr_mach4
        if ((sprite_index == spr_playerN_sidewayspin) && (floor(image_index) == (image_number - 1)))
            sprite_index = spr_playerN_sidewayspinend
        if (grounded && ((sprite_index == spr_playerN_sidewayspin) || (sprite_index == spr_playerN_sidewayspinend)))
            sprite_index = spr_mach4
        if ((movespeed > 16) && (sprite_index != spr_crazyrun) && (sprite_index != spr_Sjumpcancelstart) && (sprite_index != spr_taunt) && (character != "M"))
        {
            mach4mode = 1
            flash = 1
            sprite_index = spr_crazyrun
            with (create_debris(x, y, 1227))
            {
                hsp = random_range(-5, 5)
                vsp = random_range(-10, 10)
            }
        }
        else if ((movespeed <= 16) && (sprite_index == spr_crazyrun))
            sprite_index = spr_mach4
    }
    if ((sprite_index == spr_crazyrun) && (!instance_exists(crazyruneffectid)))
    {
        with (instance_create(x, y, obj_crazyrunothereffect))
        {
            playerid = other.object_index
            other.crazyruneffectid = id
        }
    }
    if key_jump
        input_buffer_jump = 0
    if ((!key_attack) && (fightball == 0) && (!launched) && (sprite_index != spr_dashpadmach) && grounded && ((character == "P") || (character == "N") || (character == "V") || (character == "M") || (character == "PI") || (character == "PZ") || (character == "B") || (character == "S") || (character == "NTV")))
    {
        sprite_index = spr_machslidestart
        if ((character == "NTV"))
            scr_soundeffect(sfx_noise_machslide)
        else
            scr_soundeffect(sfx_break)
        state = (105 << 0)
        image_index = 0
        launched = 0
    }
    if ((move == (-xscale)) && grounded && (!launched) && ((character == "P") || (character == "N") || (character == "V") || (character == "M") || (character == "PI") || (character == "PZ") || (character == "B") || (character == "S") || (character == "NTV")) && (fightball == 0) && (sprite_index != spr_dashpadmach))
    {
        if ((character == "NTV"))
            scr_soundeffect(sfx_noise_skateturn)
        else
            scr_soundeffect(sfx_machslideboost)
        sprite_index = spr_mach3boost
        state = (105 << 0)
        image_index = 0
    }
    if (key_down && (fightball == 0) && (sprite_index != spr_pizzano_sjumpsidemach4grounded))
    {
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        flash = 0
        state = (5 << 0)
        image_index = 0
        vsp = 10
        if (!grounded)
        {
            sprite_index = spr_dive
            if ((character != "NTV"))
                scr_soundeffect(sfx_pep_dive)
        }
        else
            sprite_index = spr_machroll
        if ((character == "V"))
        {
            if (!grounded)
            {
                sprite_index = spr_playerV_dive
                scr_soundeffect(sfx_pep_dive)
            }
            else
                sprite_index = spr_playerV_divekickstart
        }
    }
    if (((!grounded) && (place_meeting((x + hsp), y, obj_solid) || scr_solid_slope((x + hsp), y)) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock)))) || (grounded && (place_meeting((x + sign(hsp)), (y - 16), obj_solid) || scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting(x, (y + 1), obj_slope)))
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
    if (!finalmoveset)
    {
        if (key_shoot2 && shotgunAnim)
            scr_shotgunshoot()
        if ((key_slap2 || (input_buffer_slap < 8)) && (!key_up) && (character != "V") && (character != "S") && (character != "M"))
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
    else if ((character != "V") && (character != "S") && (character != "M"))
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
    if (scr_solid((x + sign(hsp)), y) && (!(place_meeting((x + sign(hsp)), y, obj_mach3solid))) && (!scr_slope()) && (scr_solid_slope((x + sign(hsp)), y) || place_meeting((x + sign(hsp)), y, obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_climbablewall))) && grounded)
    {
        var _bump = ledge_bump(((vsp >= 0) ? 32 : 22))
        if _bump
        {
            with (obj_camera)
            {
                shake_mag = 20
                shake_mag_acc = (40 / room_speed)
            }
            with (obj_baddie)
            {
                if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && (vsp > 0))
                {
                    stun = 1
                    alarm[0] = 200
                    ministun = 0
                    vsp = -5
                    hsp = 0
                }
            }
            if (!fightball)
            {
                sprite_index = spr_hitwall
                scr_soundeffect(sfx_groundpound)
                scr_soundeffect(sfx_bumpwall)
                hsp = 0
                flash = 0
                state = (106 << 0)
                hsp = (-6 * xscale)
                vsp = -6
                mach2 = 0
                image_index = 0
                instance_create((x + 10), (y + 10), obj_bumpeffect)
            }
            else
            {
                fightball = 0
                with (obj_player)
                {
                    sprite_index = spr_hitwall
                    scr_soundeffect(sfx_groundpound)
                    scr_soundeffect(sfx_bumpwall)
                    hsp = 0
                    flash = 0
                    state = (106 << 0)
                    hsp = (-6 * xscale)
                    vsp = -6
                    mach2 = 0
                    image_index = 0
                    instance_create((x + 10), (y + 10), obj_bumpeffect)
                }
            }
        }
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
    if ((!instance_exists(dashcloudid)) && grounded && (!(place_meeting(x, (y + 1), obj_water))))
    {
        with (instance_create(x, y, obj_superdashcloud))
        {
            if ((other.fightball == 1))
                instance_create(obj_player.x, obj_player.y, obj_slapstar)
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    if ((!instance_exists(dashcloudid)) && grounded && place_meeting(x, (y + 1), obj_water))
    {
        with (instance_create(x, y, obj_superdashcloud))
        {
            if ((other.fightball == 1))
                instance_create(obj_player.x, obj_player.y, obj_slapstar)
            image_xscale = other.xscale
            sprite_index = spr_watereffect
            other.dashcloudid = id
        }
    }
    scr_dotaunt()
    if (!instance_exists(chargeeffectid))
    {
        with (instance_create(x, y, obj_chargeeffect))
        {
            playerid = other.object_index
            other.chargeeffectid = id
        }
    }
    if ((sprite_index == spr_mach4) || (sprite_index == spr_fightball))
        image_speed = 0.4
    else if ((sprite_index == spr_pizzelle_mach3jump))
        image_speed = 0.3
    else if ((sprite_index == spr_crazyrun) && (character != "PZ"))
        image_speed = 0.75
    else if ((sprite_index == spr_crazyrun) && (character == "PZ"))
        image_speed = 0.55
    else if (((sprite_index == spr_mach3hit) && (character == "PZ")) || ((sprite_index == spr_rollgetup) && (character == "PZ")))
        image_speed = 0.35
    else if (((sprite_index == spr_rollgetup) && (character != "PZ")) || ((sprite_index == spr_mach3hit) && (character != "PZ")) || (sprite_index == spr_dashpadmach))
        image_speed = 0.4
    else
        image_speed = 0.4
    if (key_up && (fightball == 0) && ((character == "P") || (character == "S") || (character == "M") || (character == "N") || (character == "PI") || (character == "PZ") || (character == "B") || (character == "NTV")) && grounded && (sprite_index != spr_dashpadmach) && (!(place_meeting(x, y, obj_dashpad))))
    {
        sprite_index = spr_superjumpprep
        state = (99 << 0)
        hsp = 0
        image_index = 0
    }
    if ((global.attackstyle == 2) && key_slap2)
    {
        randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_suplexmash5, spr_suplexmash6, spr_suplexmash7, spr_punch])
        image_index = 0
        state = (43 << 0)
    }
    return;
}

