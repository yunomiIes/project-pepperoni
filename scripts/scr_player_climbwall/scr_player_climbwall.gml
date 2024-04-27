function scr_player_climbwall() //gml_Script_scr_player_climbwall
{
    switch character
    {
        case "B":
        case "S":
        case "P":
            if ((windingAnim < 200))
                windingAnim++
            move = (key_left + key_right)
            suplexmove = 0
            vsp = (-wallspeed)
            if ((wallspeed < 20))
                wallspeed += 0.15
            if ((wallspeed < 0))
            {
                if ((mach4mode == 0))
                    movespeed += 0.2
                else
                    movespeed += 0.4
            }
            crouchslideAnim = 1
            if ((vsp < -5))
                sprite_index = spr_machclimbwall
            else
                sprite_index = spr_clingwall
            if (!finalmoveset)
            {
                if ((character != "S"))
                {
                    if ((!key_attack) && (!skateboarding))
                    {
                        state = (0 << 0)
                        movespeed = 0
                        railmovespeed = 6
                        raildir = (-xscale)
                    }
                }
                else if ((!key_attack) && (!skateboarding) && (move != xscale) && (move != 0))
                {
                    state = (0 << 0)
                    movespeed = 0
                    railmovespeed = 6
                    raildir = (-xscale)
                }
            }
            else
            {
                if ((grabclimbbuffer > 0))
                    grabclimbbuffer--
                if ((character != "S"))
                {
                    if ((!key_attack) && (!skateboarding) && (grabclimbbuffer == 0))
                    {
                        state = (0 << 0)
                        movespeed = 0
                        railmovespeed = 6
                        raildir = (-xscale)
                    }
                }
                else if ((!key_attack) && (!skateboarding) && (grabclimbbuffer == 0) && (move != xscale) && (move != 0))
                {
                    state = (0 << 0)
                    movespeed = 0
                    railmovespeed = 6
                    raildir = (-xscale)
                }
            }
            if ((verticalbuffer <= 0) && place_meeting(x, (y - 1), obj_solid) && (!(place_meeting(x, (y - 1), obj_verticalhallway))) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                trace("climbwall hit head")
                if (!skateboarding)
                {
                    sprite_index = spr_superjumpland
                    scr_soundeffect(sfx_groundpound)
                    image_index = 0
                    state = (123 << 0)
                    machhitAnim = 0
                }
                else if (!key_jump)
                {
                    state = (106 << 0)
                    hsp = (-2.5 * xscale)
                    vsp = -3
                    mach2 = 0
                    image_index = 0
                }
            }
            if ((verticalbuffer <= 0) && (!(scr_solid((x + xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))) && (!(place_meeting(x, (y - 12), obj_verticalhallway))))
            {
                trace("climbwall out")
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                ledge_bump(32)
                if ((wallspeed < 6))
                    wallspeed = 6
                if (((wallspeed >= 6) && (wallspeed < 12)) || skateboarding)
                {
                    state = (104 << 0)
                    movespeed = wallspeed
                }
                else if ((wallspeed >= 12))
                {
                    state = (121 << 0)
                    sprite_index = spr_mach4
                    movespeed = wallspeed
                }
            }
            if ((wallspeed < 0) && place_meeting(x, (y + 12), obj_solid))
                wallspeed = 0
            if key_jump
            {
                key_jump = 0
                movespeed = 10
                state = (104 << 0)
                image_index = 0
                sprite_index = spr_walljumpstart
                if skateboarding
                    sprite_index = spr_clownjump
                vsp = -11
                xscale *= -1
                jumpstop = 0
                walljumpbuffer = 4
            }
            image_speed = 0.6
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, (y + 43), obj_cloudeffect)
            break
        case "NTV":
            if (!skateboarding)
            {
                instance_create((x + (sign(xscale) * 8)), y, obj_noiseparticle)
                sprite_index = spr_playerN_wallbounce
                state = (306 << 0)
                savedmove = xscale
                vsp = (-((17 * (1 - (noisewalljump * 0.15)))))
                noisewalljump++
                hsp = 0
                movespeed = 0
                image_index = 0
                var wallbounce_sfx = audio_play_sound(sfx_skateboardjump, 0, false)
                audio_sound_pitch(wallbounce_sfx, random_range(1.05, 1.31))
            }
            break
        case "M":
            if ((windingAnim < 200))
                windingAnim++
            move = (key_left + key_right)
            suplexmove = 0
            vsp = (-wallspeed)
            if ((wallspeed > 0))
                wallspeed -= 0.085
            else if ((wallspeed > 2))
                wallspeed -= 0.1
            else if ((wallspeed > 4))
                wallspeed -= 0.3
            else if ((wallspeed > 6))
                wallspeed -= 0.45
            else if ((wallspeed > 7))
                wallspeed -= 0.75
            crouchslideAnim = 1
            sprite_index = spr_machclimbwall
            if (!finalmoveset)
            {
                if (!key_attack)
                {
                    state = (0 << 0)
                    movespeed = 0
                }
            }
            else
            {
                if ((grabclimbbuffer > 0))
                    grabclimbbuffer--
                if ((!key_attack) && (grabclimbbuffer == 0))
                {
                    state = (0 << 0)
                    movespeed = 0
                }
            }
            if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                sprite_index = spr_superjumpland
                scr_soundeffect(sfx_groundpound)
                image_index = 0
                state = (123 << 0)
                machhitAnim = 0
            }
            if ((!(scr_solid((x + xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))))
            {
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                if ((movespeed >= 6))
                    state = (104 << 0)
                if ((movespeed >= 12))
                {
                    state = (121 << 0)
                    sprite_index = spr_mach4
                }
            }
            if key_jump
            {
                movespeed = 12
                state = (121 << 0)
                image_index = 0
                sprite_index = spr_mach4
                vsp = -10
                xscale *= -1
                jumpstop = 0
            }
            if ((grounded && (wallspeed <= 0)) || (wallspeed <= 0.5))
            {
                state = (92 << 0)
                sprite_index = spr_fall
            }
            image_speed = 0.6
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, (y + 43), obj_cloudeffect)
            break
        case "PI":
        case "PZ":
            if ((windingAnim < 200))
                windingAnim++
            move = (key_left + key_right)
            suplexmove = 0
            vsp = (-wallspeed)
            if ((wallspeed < 26) && (move == xscale))
                wallspeed += 0.2
            if ((wallspeed < 0))
            {
                if ((mach4mode == 0))
                    movespeed += 0.2
                else
                    movespeed += 0.4
            }
            crouchslideAnim = 1
            sprite_index = spr_machclimbwall
            if ((grabclimbbuffer > 0))
                grabclimbbuffer--
            if ((!key_attack) && (grabclimbbuffer == 0))
            {
                state = (0 << 0)
                movespeed = 0
            }
            if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                sprite_index = spr_superjumpland
                scr_soundeffect(sfx_groundpound)
                image_index = 0
                state = (123 << 0)
                machhitAnim = 0
            }
            if ((!(scr_solid((x + xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))))
            {
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                if ((movespeed >= 6))
                    state = (104 << 0)
                if ((movespeed >= 12))
                {
                    state = (121 << 0)
                    sprite_index = spr_mach4
                }
            }
            if key_jump
            {
                if ((movespeed >= 11))
                {
                    movespeed = 12
                    state = (121 << 0)
                    image_index = 0
                    sprite_index = spr_mach3jump
                    vsp = -6
                    xscale *= -1
                    jumpstop = 0
                }
                else if ((movespeed >= 15))
                {
                    movespeed = 16
                    state = (121 << 0)
                    image_index = 0
                    sprite_index = spr_mach3jump
                    vsp = -6
                    xscale *= -1
                    jumpstop = 0
                }
                else
                {
                    movespeed = 10
                    state = (104 << 0)
                    image_index = 0
                    sprite_index = spr_mach
                    vsp = -5
                    xscale *= -1
                    jumpstop = 0
                }
            }
            if ((grounded && (wallspeed <= 0)) || (wallspeed <= 0))
            {
                state = (92 << 0)
                sprite_index = spr_fall
            }
            image_speed = 0.6
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, (y + 43), obj_cloudeffect)
            break
        case "V":
            if ((windingAnim < 200))
                windingAnim++
            move = (key_left + key_right)
            suplexmove = 0
            vsp = (-wallspeed)
            if ((wallspeed < 24) && (move == xscale))
                wallspeed += 0.1
            crouchslideAnim = 1
            sprite_index = spr_machclimbwall
            if (!finalmoveset)
            {
                if (!key_attack)
                {
                    state = (0 << 0)
                    movespeed = 0
                }
            }
            else
            {
                if ((grabclimbbuffer > 0))
                    grabclimbbuffer--
                if ((!key_attack) && (grabclimbbuffer == 0))
                {
                    state = (0 << 0)
                    movespeed = 0
                }
            }
            if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                sprite_index = spr_superjumpland
                scr_soundeffect(sfx_groundpound)
                image_index = 0
                state = (123 << 0)
                machhitAnim = 0
            }
            if ((!(scr_solid((x + xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))))
            {
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                if ((movespeed >= 6))
                    state = (104 << 0)
                if ((movespeed >= 12))
                {
                    state = (121 << 0)
                    sprite_index = spr_mach4
                }
            }
            if key_jump
            {
                movespeed = 10
                state = (104 << 0)
                image_index = 0
                sprite_index = spr_walljumpstart
                vsp = -11
                xscale *= -1
                jumpstop = 0
            }
            if ((grounded && (wallspeed <= 0)) || (wallspeed <= 0))
            {
                state = (92 << 0)
                sprite_index = spr_fall
            }
            image_speed = 0.6
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, (y + 43), obj_cloudeffect)
            break
        case "N":
            hsp = 0
            if ((sprite_index == spr_playerN_wallclingstart) && (floor(image_index) == (image_number - 1)))
                sprite_index = spr_playerN_wallcling
            if ((sprite_index == spr_playerN_wallcling))
                vsp = 2
            else
                vsp = 0
            wallclingcooldown = 0
            if ((floor(image_index) == (image_number - 1)) || (!key_jump2))
            {
                vsp = -15
                state = (92 << 0)
                sprite_index = spr_jump
                image_index = 0
            }
            if key_jump
            {
                vsp = -15
                state = (92 << 0)
                sprite_index = spr_jump
                image_index = 0
            }
            image_speed = 0.35
            break
    }

    return;
}

