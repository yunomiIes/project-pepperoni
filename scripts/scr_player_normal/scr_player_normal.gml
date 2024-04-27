function state_player_normal() //state_player_normal
{
    mach2 = 0
    move = (key_left + key_right)
    skateboarding = 0
    momemtum = 0
    jumpstop = 0
    if ((dir != xscale))
    {
        dir = xscale
        movespeed = 2
        facehurt = 0
    }
    if key_taunt2
    {
        input_finisher_buffer = 60
        input_attack_buffer = 0
        input_up_buffer = 0
        input_down_buffer = 0
    }
    if (key_taunt && (input_finisher_buffer == 0) && (character != "S") && (!shotgunAnim))
        breakdance_speed = Approach(breakdance_speed, 0.6, 0.005)
    else
        breakdance_speed = 0.25
    if ((breakdance_speed >= 0.5))
    {
        if (!instance_exists(obj_beatbox))
        {
            scr_soundeffect(sfx_breakdance)
            instance_create(x, y, obj_genericpoofeffect)
            with (instance_create(x, y, obj_beatbox))
            {
                vsp = -11
                targetplayer = other.object_index
            }
        }
        notecreate--
    }
    if ((notecreate <= 0))
    {
        instance_create((x + random_range(-70, 70)), (y + random_range(-70, 70)), obj_notes)
        notecreate = 10
    }
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        railmovespeed = _railinst.movespeed
        raildir = _railinst.dir
        railmomentum = 1
    }
    hsp = ((move * movespeed) + (railmovespeed * raildir))
    if ((move != 0))
    {
        xscale = move
        if ((movespeed < 8))
            movespeed += 0.5
        else if ((floor(movespeed) == 8))
            movespeed = 6
        if ((movespeed < 3) && (move != 0))
            image_speed = 0.35
        else if ((movespeed > 3) && (movespeed < 6))
            image_speed = 0.45
        else
            image_speed = 0.6
        if ((!machslideAnim) && (!landAnim) && (!shotgunAnim))
        {
            machslideAnim = 0
            idle = 0
            facehurt = 0
            if shoot
                sprite_index = spr_pistolwalk
            else if mort
                sprite_index = spr_player_mortwalk
            else if (key_taunt && (input_finisher_buffer == 0))
            {
                if ((character != "S") && (!shotgunAnim))
                    sprite_index = spr_breakdance
            }
            else if ((global.minutes == 0) && (global.seconds == 0))
                sprite_index = spr_hurtwalk
            else if ((global.combo > 24) && (global.combo < 49))
                sprite_index = spr_3hpwalk
            else if ((global.combo > 49))
                sprite_index = spr_ragemove
            else
                sprite_index = spr_move
        }
        if (scr_solid((x + sign(hsp)), y) && (!(scr_solid_slope((x + sign(hsp)), y))) && (xscale == move) && (!(place_meeting(x, (y + 1), obj_slope))))
            movespeed = 0
        if ((!steppy) && (character != "V") && (floor((image_index == 3)) || (floor(image_index) == 8)))
        {
            var steppysfx = audio_play_sound(sfx_step, 0, false)
            audio_sound_pitch(steppysfx, random_range(0.84, 1))
            create_particle(x, (y + 43), (1 << 0), 0)
            steppy = 1
        }
        if ((floor(image_index) != 3) && (floor(image_index) != 8))
            steppy = 0
    }
    else
    {
        if ((sprite_index == spr_breakdance))
            image_speed = breakdance_speed
        else
            image_speed = 0.35
        movespeed = 0
        if ((!machslideAnim) && (!landAnim) && (!shotgunAnim))
        {
            if ((idle < 400) && (!key_taunt))
                idle++
            if ((idle >= 150) && (!key_taunt))
            {
                if ((sprite_index != spr_idle) && (floor(image_index) == (image_number - 1)))
                {
                    facehurt = 0
                    idle = 0
                }
                if ((sprite_index != spr_idle1) && (sprite_index != spr_idle2) && (sprite_index != spr_idle3) && (sprite_index != spr_idle4) && (sprite_index != spr_idle5) && (sprite_index != spr_idle6))
                {
                    idleanim = random_range(0, 100)
                    image_index = 0
                    if ((idleanim <= 16))
                        sprite_index = spr_idle1
                    else if ((idleanim > 16) && (idleanim <= 32))
                        sprite_index = spr_idle2
                    else if ((idleanim > 32) && (idleanim <= 48))
                        sprite_index = spr_idle3
                    else if ((idleanim > 48) && (idleanim <= 64))
                        sprite_index = spr_idle4
                    else if ((idleanim > 64) && (idleanim <= 80))
                        sprite_index = spr_idle5
                    else
                        sprite_index = spr_idle6
                    if ((character == "P") && ispeppino && (irandom(100) <= 50))
                        scr_soundeffect(sfx_Voice19, 229, 230)
                }
            }
            else if (!facehurt)
            {
                if ((windingAnim < 1800) || angry || (global.playerhealth == 1) || shoot)
                {
                    start_running = 1
                    movespeed = 0
                    if shoot
                        sprite_index = spr_player_pistolidle
                    else if mort
                        sprite_index = spr_player_mortidle
                    else if (key_taunt && (input_finisher_buffer == 0))
                    {
                        if ((character != "S") && (!shotgunAnim))
                            sprite_index = spr_breakdance
                    }
                    else if ((global.minutes == 0) && (global.seconds == 0))
                        sprite_index = spr_hurtidle
                    else if global.panic
                        sprite_index = spr_panic
                    else if ((global.combo > 24) && (global.combo < 49))
                        sprite_index = spr_3hpidle
                    else if ((global.combo > 49))
                        sprite_index = spr_rageidle
                    else
                        sprite_index = spr_idle
                }
                else
                {
                    idle = 0
                    windingAnim--
                    sprite_index = spr_winding
                    if (key_taunt && (input_finisher_buffer == 0))
                    {
                        if ((character != "S") && (!shotgunAnim))
                            sprite_index = spr_breakdance
                    }
                }
            }
            else
            {
                windingAnim = 0
                sprite_index = spr_facehurt
                if (key_taunt && (input_finisher_buffer == 0))
                {
                    if ((character != "S") && (!shotgunAnim))
                        sprite_index = spr_breakdance
                }
            }
        }
    }
    if ((movespeed > 8))
        movespeed -= 0.1
    if ((character == "S"))
    {
        if ((machslideAnim == 0))
        {
            if ((move == 0))
            {
                if ((idle < 400))
                    idle++
                if ((idle >= 100) && (floor(image_index) == (image_number - 1)))
                {
                    idle = 0
                    image_index = 0
                }
                if ((idle >= 100) && (sprite_index != spr_idle1))
                    sprite_index = spr_idle1
                if ((idle < 100))
                    sprite_index = spr_idle
            }
            if ((move != 0))
            {
                machslideAnim = 0
                sprite_index = spr_move
                xscale = move
            }
        }
    }
    if landAnim
    {
        if ((sprite_index == spr_player_mortland))
        {
            if ((floor(image_index) == (image_number - 1)))
            {
                landAnim = 0
                sprite_index = spr_player_mortidle
                image_index = 0
            }
        }
        else if (!shotgunAnim)
        {
            if ((move == 0))
            {
                movespeed = 0
                sprite_index = spr_land
                if ((floor(image_index) == (image_number - 1)))
                    landAnim = 0
            }
            else
            {
                sprite_index = spr_land2
                if ((floor(image_index) == (image_number - 1)))
                {
                    landAnim = 0
                    sprite_index = spr_move
                    image_index = 0
                }
            }
        }
        else
        {
            sprite_index = spr_shotgunland
            if ((floor(image_index) == (image_number - 1)))
            {
                landAnim = 0
                sprite_index = spr_shotgunidle
                if ((move != 0))
                    sprite_index = spr_shotgunwalk
                image_index = 0
            }
        }
    }
    else if (shotgunAnim && (sprite_index != spr_shotgunshoot) && (!machslideAnim))
        sprite_index = ((move == 0) ? spr_shotgunidle : spr_shotgunwalk)
    if machslideAnim
        sprite_index = spr_machslideend
    if ((floor(image_index) == (image_number - 1)))
    {
        switch sprite_index
        {
            case spr_machslideend:
                machslideAnim = 0
                sprite_index = spr_idle
                if shotgunAnim
                    sprite_index = spr_shotgunidle
                break
            case bg_ruinsky:
                sprite_index = spr_idle
                break
            case spr_shotgunshoot:
                sprite_index = spr_shotgunidle
                break
        }

    }
    if grounded
    {
        if ((key_jump || ((input_buffer_jump < 8) && (!key_attack) && (vsp > 0))) && (!key_down))
        {
            if ((character != "NTV"))
                scr_soundeffect(sfx_jump)
            else
                scr_soundeffect(sfx_jumpN)
            if ((sprite_index != spr_shotgunshoot))
            {
                sprite_index = spr_jump
                if shotgunAnim
                    sprite_index = spr_shotgunjump
                image_index = 0
            }
            particle_set_scale((4 << 0), xscale, 1)
            create_particle(x, y, (4 << 0), 0)
            vsp = -11
            state = (92 << 0)
            jumpAnim = 1
            jumpstop = 0
            if place_meeting(x, (y + 1), obj_railparent)
                railmomentum = 1
            freefallstart = 0
        }
        if ((character != "S"))
        {
            if (key_down || (grounded && (vsp > 0) && scr_solid(x, (y - 3)) && scr_solid(x, y)) || place_meeting(x, y, obj_solid))
            {
                state = (100 << 0)
                landAnim = 0
                crouchAnim = 1
                image_index = 0
                idle = 0
            }
        }
    }
    else if (!key_jump)
    {
        if ((sprite_index != spr_shotgunshoot))
        {
            if (!shotgunAnim)
                sprite_index = spr_fall
            else
                sprite_index = spr_shotgunfall
            image_index = 0
            jumpAnim = 0
        }
        else
            jumpAnim = 1
        state = (92 << 0)
    }
    if ((sprite_index == spr_breakdance) && (breakdance_speed > 0.4))
    {
        if ((!instance_exists(dashcloudid)) && grounded)
        {
            with (instance_create((x + 25), y, obj_dashcloud))
            {
                image_xscale = other.xscale
                other.dashcloudid = id
            }
        }
        if ((!instance_exists(dashcloudid)) && grounded)
        {
            with (instance_create((x - 25), y, obj_dashcloud))
            {
                image_xscale = (-other.xscale)
                other.dashcloudid = id
            }
        }
    }
    if (!finalmoveset)
    {
        if (key_shoot2 && shotgunAnim)
            scr_shotgunshoot()
        if ((character != "S") && (character != "V"))
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
                    movespeed = 8
                    image_index = 0
                    flash = 1
                }
                if ((character == "PI"))
                {
                    sprite_index = choose(spr_pizzano_kungfu1, spr_pizzano_kungfu2, spr_pizzano_kungfu3, spr_pizzano_kungfu4, spr_pizzano_kungfu5)
                    scr_soundeffect(sfx_kungfuair)
                    state = (80 << 0)
                    image_index = 0
                    flash = 1
                }
            }
            else if ((key_slap2 || (input_buffer_slap < 8)) && key_up)
            {
                state = (80 << 0)
                image_index = 0
                sprite_index = spr_breakdanceuppercut
                vsp = -14
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
    }
    else if shotgunAnim
    {
        if key_slap2
            scr_shotgunshoot()
    }
    else if ((character != "S") && (character != "V"))
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
                movespeed = 8
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
            state = (80 << 0)
            input_buffer_slap = 0
            image_index = 0
            sprite_index = spr_breakdanceuppercut
            if ((character != "NTV"))
                vsp = -14
            else
                vsp = -20
            movespeed = hsp
            particle_set_scale((4 << 0), xscale, 1)
            create_particle(x, y, (4 << 0), 0)
        }
    }
    switch character
    {
        case "NTV":
        case "B":
        case "P":
            if (key_attack && (state != (42 << 0)) && (!(place_meeting((x + xscale), y, obj_solid))) && ((!(place_meeting(x, (y + 1), obj_iceblockslope))) || (!(place_meeting((x + (xscale * 5)), y, obj_solid)))) && (!global.kungfu))
            {
                sprite_index = spr_mach1
                image_index = 0
                state = (104 << 0)
                if ((movespeed < 6))
                    movespeed = 6
            }
            if (global.kungfu && key_attack && (state != (42 << 0)))
            {
                state = (206 << 0)
                sprite_index = spr_player_airattack
                hsp = 0
                movespeed = 0
            }
            if (key_attack && (state != (42 << 0)) && (!(place_meeting((x + xscale), y, obj_solid))) && ((!(place_meeting(x, (y + 1), obj_iceblockslope))) || (!(place_meeting((x + (xscale * 5)), y, obj_solid)))) && (!global.kungfu))
            {
                sprite_index = spr_mach1
                image_index = 0
                state = (104 << 0)
                if ((movespeed < 6))
                    movespeed = 6
            }
            if (global.kungfu && key_attack && (state != (42 << 0)))
            {
                state = (206 << 0)
                sprite_index = spr_player_airattack
                hsp = 0
                movespeed = 0
            }
            break
        case "PZ":
            if (key_attack && (state != (42 << 0)) && (!(place_meeting((x + xscale), y, obj_solid))) && ((!(place_meeting(x, (y + 1), obj_iceblockslope))) || (!(place_meeting((x + (xscale * 5)), y, obj_solid)))) && (!global.kungfu))
            {
                sprite_index = spr_mach1
                image_index = 0
                state = (104 << 0)
                if ((movespeed < 6))
                    movespeed = 6
            }
            if (global.kungfu && key_attack && (state != (42 << 0)))
            {
                state = (206 << 0)
                sprite_index = spr_player_airattack
                hsp = 0
                movespeed = 0
            }
            break
        case "PI":
            if (key_attack && (state != (42 << 0)) && (!(place_meeting((x + xscale), y, obj_solid))) && ((!(place_meeting(x, (y + 1), obj_iceblockslope))) || (!(place_meeting((x + (xscale * 5)), y, obj_solid)))) && (!global.kungfu))
            {
                sprite_index = spr_mach1
                image_index = 0
                state = (104 << 0)
                if ((movespeed < 6))
                    movespeed = 6
            }
            if (global.kungfu && key_attack && (state != (42 << 0)))
            {
                state = (206 << 0)
                sprite_index = spr_player_airattack
                hsp = 0
                movespeed = 0
            }
            break
        case "S":
            if (key_attack && key_shoot && (state != (42 << 0)) && (move == 0))
            {
                image_index = 0
                state = (42 << 0)
                movespeed = 5
            }
            if (key_attack && (state != (42 << 0)) && (!(place_meeting((x + xscale), y, obj_solid))) && ((!(place_meeting(x, (y + 1), obj_iceblockslope))) || (!(place_meeting((x + (xscale * 5)), y, obj_solid)))) && (move != 0))
            {
                sprite_index = spr_mach1
                image_index = 0
                state = (104 << 0)
                if ((movespeed < 6))
                    movespeed = 6
            }
            break
        case "N":
            if (pogochargeactive || (pizzapepper > 0))
            {
                if key_attack2
                {
                    scr_soundeffect(sfx_noisewoah)
                    state = (99 << 0)
                    image_index = 0
                    sprite_index = ((!key_up) ? spr_playerN_jetpackstart : spr_player_superjumpprep)
                    hsp = 0
                    vsp = 0
                }
            }
            else if (key_attack && (!key_slap2))
            {
                sprite_index = spr_playerN_pogostart
                image_index = 0
                state = (58 << 0)
            }
            break
        case "V":
            if (key_attack && (!(place_meeting((x + xscale), y, obj_solid))))
            {
                if ((pizzapepper == 0))
                {
                    movespeed = 6
                    sprite_index = spr_mach1
                    image_index = 0
                    jumpAnim = 1
                    state = (103 << 0)
                }
                else
                {
                    movespeed = 21
                    sprite_index = spr_crazyrun
                    jumpAnim = 1
                    state = (121 << 0)
                    movespeed = 20
                }
            }
            if (key_shoot2 && (!instance_exists(dynamite_inst)))
            {
                if ((move == 0))
                    movespeed = 0
                state = (2 << 0)
                sprite_index = spr_playerV_dynamitethrow
                image_index = 0
                with (instance_create(x, y, obj_dynamite))
                {
                    image_xscale = other.xscale
                    movespeed = 6
                    vsp = -6
                    other.dynamite_inst = id
                    playerid = other.id
                }
            }
            if key_slap2
            {
                if ((move == 0))
                    movespeed = 0
                sprite_index = spr_playerV_revolverstart
                image_index = 0
                state = (1 << 0)
            }
            break
    }

    scr_dotaunt()
    if ((sprite_index == spr_shotgunshoot))
    {
        landAnim = 0
        machslideAnim = 0
        image_speed = 0.45
    }
    if ((sprite_index == spr_suplexbump) && (character == "PZ"))
    {
        hsp = 0
        movespeed = 0
    }
    if ((floor(image_index) == (image_index - 1)) && (sprite_index == spr_suplexbump) && (character == "PZ"))
    {
        sprite_index = spr_idle
        mach2 = 0
        move = (key_left + key_right)
        skateboarding = 0
        momemtum = 0
        jumpstop = 0
    }
    if (key_up2 && (character == "NTV") && (!(place_meeting(x, y, obj_exitgate))) && (!(place_meeting(x, y, obj_startgate))))
    {
        sprite_index = spr_superjumpprep
        state = (99 << 0)
        hsp = 0
        image_index = 0
    }
    return;
}

function state_pepperman_normal() //state_pepperman_normal
{
    pepperman_grab_reset()
    move = (key_left + key_right)
    if ((move != 0) && (move == sign(xscale)) && (movespeed < pepperman_maxhsp_normal))
        movespeed += pepperman_accel
    else if ((move != 0) && (move != sign(xscale)) && (movespeed > 0))
        movespeed -= pepperman_deccel
    else if ((move == 0))
        movespeed -= pepperman_deccel
    if ((floor(movespeed) == pepperman_maxhsp_normal))
        movespeed = pepperman_maxhsp_normal
    if ((movespeed > pepperman_maxhsp_normal))
        movespeed -= 0.3
    else if ((movespeed < 0))
        movespeed = 0
    if ((move != 0) && (movespeed == 0))
        xscale = move
    hsp = (xscale * movespeed)
    if ((sprite_index != spr_pepperman_throw))
    {
        if ((hsp != 0))
            sprite_index = spr_move
        else
            sprite_index = spr_idle
    }
    if (((input_buffer_jump < 8) || key_jump) && grounded && (vsp > 0))
    {
        scr_soundeffect(sfx_jump)
        sprite_index = spr_jump
        image_index = 0
        vsp = (-pepperman_jumpspeed)
        state = (92 << 0)
        with (instance_create(x, (y - 5), obj_highjumpcloud2))
            image_xscale = other.xscale
    }
    if ((!grounded) && (!key_jump))
    {
        state = (92 << 0)
        sprite_index = spr_fall
    }
    if (key_attack && ((!(place_meeting((x + xscale), y, obj_solid))) || place_meeting((x + xscale), y, obj_destructibles)) && (pepperman_grabID == noone) && (sprite_index != spr_pepperman_throw))
    {
        if ((move != 0))
            xscale = move
        movespeed = 12
        state = (121 << 0)
        sprite_index = spr_mach4
        scr_soundeffect(sfx_dashpad)
    }
    if ((sprite_index == spr_pepperman_throw) && (floor(image_index) == (image_number - 1)))
        sprite_index = spr_pepperman_idle
    if ((move != 0) && ((floor(image_index) == 4) || (floor(image_index) == 11)) && (steppy == 0) && (character != "V"))
    {
        instance_create(x, (y + 38), obj_cloudeffect)
        steppy = 1
    }
    if ((move != 0) && (floor(image_index) != 4) && (floor(image_index) != 11))
        steppy = 0
    if key_taunt2
    {
        scr_soundeffect(sfx_taunt)
        taunttimer = 20
        tauntstoredmovespeed = movespeed
        tauntstoredvsp = vsp
        tauntstoredsprite = sprite_index
        tauntstoredstate = state
        state = (84 << 0)
        if ((supercharged == 1) && key_up)
        {
            image_index = 0
            scr_soundeffect(sfx_supertaunt)
            sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4)
        }
        else
        {
            taunttimer = 20
            image_index = random_range(0, 11)
            sprite_index = spr_taunt
        }
        with (instance_create(x, y, obj_taunteffect))
            player = other.id
    }
    if (key_slap2 && (input_buffer_slap > 0) && key_up && (shotgunAnim == 0))
    {
        state = (80 << 0)
        input_buffer_slap = 0
        image_index = 0
        sprite_index = spr_breakdanceuppercut
        vsp = -14
        movespeed = hsp
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
    }
    return;
}

function pepperman_grab_reset() //pepperman_grab_reset
{
    if ((pepperman_grabID != noone))
    {
        if (!instance_exists(pepperman_grabID))
            pepperman_grabID = -4
    }
    return;
}

function scr_player_normal() //scr_player_normal
{
    if ((character != "M"))
        state_player_normal()
    else
        state_pepperman_normal()
    return;
}

