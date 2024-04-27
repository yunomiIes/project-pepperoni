function scr_player_punch() //gml_Script_scr_player_punch
{
    if ((sprite_index == spr_breakdanceuppercut) || (sprite_index == spr_breakdanceuppercutend))
    {
        move = (key_left + key_right)
        landAnim = 1
        jumpstop = 0
        if ((sprite_index != spr_playerN_breakdanceuppercut))
            image_speed = 0.4
        else
            image_speed = 0.3
        hsp = movespeed
        if (!finalmoveset)
        {
            if ((move != 0))
            {
                dir = move
                movespeed = Approach(movespeed, (move * 4), 0.5)
            }
        }
        else if ((move != 0))
        {
            dir = move
            movespeed = Approach(movespeed, (move * 4), 0.5)
        }
        else
            movespeed = Approach(movespeed, 0, 0.5)
        if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_breakdanceuppercut))
            sprite_index = spr_breakdanceuppercutend
        if (grounded && (vsp > 0) && ((sprite_index == spr_breakdanceuppercut) || (sprite_index == spr_breakdanceuppercutend)))
        {
            if ((hsp != 0))
            {
                dir = sign(hsp)
                xscale = dir
            }
            movespeed = abs(movespeed)
            state = (0 << 0)
        }
        if ((punch_afterimage > 0))
            punch_afterimage--
        else
        {
            punch_afterimage = 10
            create_afterimage(x, y, sprite_index, image_index, xscale)
        }
    }
    else
    {
        switch character
        {
            case "B":
            case "PZ":
            case "PI":
            case "P":
            case "N":
                move = (key_left + key_right)
                landAnim = 1
                jumpstop = 0
                image_speed = 0.4
                if ((breakdance > 0))
                    breakdance--
                if ((move != 0))
                {
                    if ((move != xscale) && (movespeed > -6))
                    {
                        if ((sprite_index != spr_player_kungfujump))
                            movespeed -= 1
                        else
                            movespeed -= 0.1
                    }
                    else if ((move == xscale) && (movespeed < 6) && (sprite_index == spr_player_kungfujump))
                        movespeed += 0.2
                }
                hsp = (xscale * movespeed)
                var pizzanoairstart = ((sprite_index == spr_pizzano_kungfuair1start) ? true : ((sprite_index == spr_pizzano_kungfuair2start) ? true : (sprite_index == spr_pizzano_kungfuair3start)))
                var pizzanodash = ((sprite_index == spr_pizzano_kungfu1) ? true : ((sprite_index == spr_pizzano_kungfu2) ? true : ((sprite_index == spr_pizzano_kungfu3) ? true : ((sprite_index == spr_pizzano_kungfu4) ? true : (sprite_index == spr_pizzano_kungfu5)))))
                var nopizzanodash = ((sprite_index != spr_pizzano_kungfu1) && (sprite_index != spr_pizzano_kungfu2) && (sprite_index != spr_pizzano_kungfu3) && (sprite_index != spr_pizzano_kungfu4) && (sprite_index != spr_pizzano_kungfu5))
                var _kungfuground = ((sprite_index == spr_player_kungfu1) ? true : ((sprite_index == spr_player_kungfu2) ? true : ((sprite_index == spr_player_kungfu3) ? true : (sprite_index == spr_shotgunsuplexdash))))
                var _Sjumpcancel = ((sprite_index == spr_Sjumpcancel) ? true : ((sprite_index == spr_Sjumpcancelland) ? true : (sprite_index == spr_Sjumpcancelslide)))
                if (_kungfuground && (image_index > 7) && (!key_attack) && (movespeed > 0))
                    movespeed -= 0.5
                if ((floor(image_index) == (image_number - 1)))
                {
                    switch sprite_index
                    {
                        case spr_player_kungfu1:
                        case spr_fakepeppino_land:
                        case spr_player_lunge:
                        case spr_shotgunsuplexdash:
                            state = (0 << 0)
                            if ((move != xscale) && (move != 0))
                                movespeed = 2
                            break
                        case spr_fakepeppino_grabattack:
                            sprite_index = spr_player_kungfuair1
                            break
                        case spr_alien:
                            sprite_index = spr_player_kungfuair2
                            break
                        case tile_factory2424:
                            sprite_index = spr_player_kungfuair3
                            break
                        case spr_Sjumpcancelland:
                            sprite_index = spr_Sjumpcancelslide
                            break
                    }

                }
                if ((!_kungfuground) && (!_Sjumpcancel) && (!pizzanodash))
                {
                    if (grounded && (vsp >= 0))
                        state = (0 << 0)
                }
                if _Sjumpcancel
                {
                    if ((character != "PI"))
                    {
                        if (grounded && (vsp > 0))
                        {
                            if ((sprite_index == spr_player_Sjumpcancel))
                            {
                                sprite_index = spr_player_Sjumpcancelland
                                image_index = 0
                            }
                            if key_attack
                            {
                                if ((movespeed >= 12))
                                    state = (121 << 0)
                                else
                                    state = (104 << 0)
                                sprite_index = spr_rollgetup
                                image_index = 0
                            }
                            else if ((movespeed > 6))
                            {
                                state = (105 << 0)
                                sprite_index = spr_machslidestart
                                image_index = 0
                            }
                            else
                                state = (0 << 0)
                        }
                        if ((sprite_index == spr_Sjumpcancelslide))
                            image_speed = (abs(movespeed) / 15)
                    }
                }
                if ((character == "PI"))
                {
                    if ((sprite_index == spr_pizzano_sjumpside) && (!grounded) && nopizzanodash)
                    {
                        movespeed = 12
                        vspspeed = 8
                        hsp = (xscale * movespeed)
                        vsp = (-(((key_up - key_down) * vspspeed)))
                        if ((hsp <= 14))
                            hsp += 0.3
                        else
                            hsp += 0.4
                    }
                    if (key_jump2 && (!grounded) && (sprite_index == spr_pizzano_sjumpside) && nopizzanodash && (sprite_index != spr_pizzano_kungfu1))
                    {
                        vsp = -6
                        movespeed = 12
                        sprite_index = spr_mach4
                        state = (121 << 0)
                    }
                    if (key_attack && grounded && (sprite_index != spr_pizzano_mach3slam) && nopizzanodash && (sprite_index != spr_pizzano_kungfu1))
                    {
                        if ((hsp >= 14))
                        {
                            movespeed = 16
                            state = (121 << 0)
                            sprite_index = spr_pizzano_sjumpsidemach4grounded
                            image_index = 0
                        }
                        else
                        {
                            movespeed = 12
                            state = (121 << 0)
                            sprite_index = spr_mach4
                            image_index = 0
                        }
                    }
                    else if ((!key_attack) && grounded && nopizzanodash && (sprite_index != spr_pizzano_kungfu1))
                    {
                        sprite_index = spr_machslidestart
                        scr_soundeffect(sfx_break)
                        state = (105 << 0)
                        image_index = 0
                        launched = 0
                    }
                    if (key_attack && grounded && (sprite_index == spr_pizzano_mach3slam) && nopizzanodash && (sprite_index != spr_pizzano_kungfu1))
                    {
                        movespeed = 8
                        state = (104 << 0)
                        image_index = 0
                    }
                }
                if ((sprite_index != spr_player_kungfujump) && place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + xscale), y, obj_destructibles))) && (!(place_meeting((x + xscale), y, obj_slope))))
                {
                    if ((character != "PI"))
                    {
                        vsp = -4
                        sprite_index = spr_player_kungfujump
                        image_index = 0
                        state = (80 << 0)
                        movespeed = -6
                    }
                    if ((punch_afterimage > 0))
                        punch_afterimage--
                    else
                    {
                        punch_afterimage = 5
                        create_blue_afterimage(x, y, sprite_index, image_index, xscale)
                    }
                    if ((!instance_exists(obj_dashcloud2)) && grounded && (movespeed > 5))
                    {
                        with (instance_create(x, y, obj_dashcloud2))
                            image_xscale = other.xscale
                    }
                    if ((character == "PI") && nopizzanodash && (sprite_index != spr_pizzano_kungfu1))
                    {
                        vsp = -4
                        sprite_index = spr_pizzano_mach3slam
                        image_index = 0
                        if (!audio_is_playing(sfx_groundpound))
                            scr_soundeffect(sfx_groundpound)
                        state = (80 << 0)
                        movespeed = -6
                    }
                    if ((sprite_index == spr_pizzano_mach3slam) && (!grounded) && nopizzanodash)
                    {
                        if ((floor(image_index) == (image_number - 1)))
                        {
                            sprite_index = spr_pizzano_crouchfall
                            state = (101 << 0)
                        }
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
                                instance_create((x + 10), (y + 10), obj_bumpeffect)
                            }
                            if ((!instance_exists(obj_dashcloud2)) && grounded && (movespeed > 5))
                            {
                                with (instance_create(x, y, obj_dashcloud2))
                                    image_xscale = other.xscale
                            }
                        }
                    }
                }
                if (((sprite_index == spr_pizzano_kungfu1) || (sprite_index == spr_pizzano_kungfu2) || (sprite_index == spr_pizzano_kungfu3) || (sprite_index == spr_pizzano_kungfu4) || (sprite_index == spr_pizzano_kungfu5)) && (character == "PI"))
                {
                    if ((sprite_index == spr_pizzano_kungfu1) || (sprite_index == spr_pizzano_kungfu2) || (sprite_index == spr_pizzano_kungfu3) || (sprite_index == spr_pizzano_kungfu4) || (sprite_index == spr_pizzano_kungfu5))
                    {
                        if ((punch_afterimage > 0))
                            punch_afterimage--
                        else
                        {
                            punch_afterimage = 10
                            create_blue_afterimage(x, y, sprite_index, image_index, xscale)
                        }
                        if ((movespeed <= 10))
                        {
                            movespeed = 10
                            state = (80 << 0)
                        }
                        else
                        {
                            hsp = (movespeed * xscale)
                            state = (80 << 0)
                        }
                    }
                    if ((floor(image_index) == (image_number - 1)) && ((sprite_index == spr_pizzano_kungfu1) || (sprite_index == spr_pizzano_kungfu2) || (sprite_index == spr_pizzano_kungfu3) || (sprite_index == spr_pizzano_kungfu4) || (sprite_index == spr_pizzano_kungfu5)) && grounded && (!key_attack))
                        state = (0 << 0)
                    if ((floor(image_index) == (image_number - 1)) && ((sprite_index == spr_pizzano_kungfu1) || (sprite_index == spr_pizzano_kungfu2) || (sprite_index == spr_pizzano_kungfu3) || (sprite_index == spr_pizzano_kungfu4) || (sprite_index == spr_pizzano_kungfu5)) && (!grounded) && (!key_attack))
                        state = (0 << 0)
                    if ((floor(image_index) == (image_number - 1)) && ((sprite_index == spr_pizzano_kungfu1) || (sprite_index == spr_pizzano_kungfu2) || (sprite_index == spr_pizzano_kungfu3) || (sprite_index == spr_pizzano_kungfu4) || (sprite_index == spr_pizzano_kungfu5)) && (!grounded) && key_attack)
                        image_speed = 0
                    if ((floor(image_index) == (image_number - 1)) && ((sprite_index == spr_pizzano_kungfu1) || (sprite_index == spr_pizzano_kungfu2) || (sprite_index == spr_pizzano_kungfu3) || (sprite_index == spr_pizzano_kungfu4) || (sprite_index == spr_pizzano_kungfu5)) && grounded && key_attack)
                    {
                        if ((movespeed <= 10))
                        {
                            state = (121 << 0)
                            movespeed = 12
                            sprite_index = spr_mach4
                        }
                        else
                        {
                            hsp = (movespeed * xscale)
                            state = (121 << 0)
                            sprite_index = spr_mach4
                        }
                    }
                    if ((sprite_index == spr_pizzano_kungfu1) || (sprite_index == spr_pizzano_kungfu2) || (sprite_index == spr_pizzano_kungfu3) || (sprite_index == spr_pizzano_kungfu4) || (sprite_index == spr_pizzano_kungfu5))
                    {
                        if ((grounded || (!key_attack)) && scr_solid((x + xscale), y) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)))
                        {
                            _bump = ledge_bump(((vsp >= 0) ? 32 : 22))
                            if _bump
                            {
                                jumpstop = 1
                                state = (92 << 0)
                                vsp = -2
                                sprite_index = spr_suplexbump
                                instance_create((x + (xscale * 10)), (y + 10), obj_bumpeffect)
                            }
                        }
                    }
                    if (key_jump && grounded && ((sprite_index == spr_pizzano_kungfu1) || (sprite_index == spr_pizzano_kungfu2) || (sprite_index == spr_pizzano_kungfu3) || (sprite_index == spr_pizzano_kungfu4) || (sprite_index == spr_pizzano_kungfu5)) && (character == "PI"))
                    {
                        jumpstop = 0
                        image_index = 0
                        vsp = -13
                        state = (104 << 0)
                        sprite_index = choose(spr_pizzano_kungfuair1start, spr_pizzano_kungfuair2start, spr_pizzano_kungfuair3start)
                    }
                    if (key_down && grounded && ((sprite_index == spr_pizzano_kungfu1) || (sprite_index == spr_pizzano_kungfu2) || (sprite_index == spr_pizzano_kungfu3) || (sprite_index == spr_pizzano_kungfu4) || (sprite_index == spr_pizzano_kungfu5)) && (character == "PI"))
                    {
                        image_index = 0
                        state = (5 << 0)
                        if ((movespeed <= 12))
                            movespeed = 12
                        sprite_index = spr_crouchslip
                    }
                }
                break
        }

    }
    return;
}

