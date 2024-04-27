function scr_draw_text_arr(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //scr_draw_text_arr
{
    if ((argument3 == undefined))
        argument3 = c_white
    if ((argument4 == undefined))
        argument4 = 1
    if ((argument5 == undefined))
        argument5 = (0 << 0)
    if ((argument6 == undefined))
        argument6 = noone
    if ((argument2 == -4))
        return;
    for (var i = 0; i < array_length(argument2); i++)
    {
        var b = argument2[i]
        var cx = (argument0 + b[0])
        var cy = (argument1 + b[1])
        var t = b[2]
        var val = b[3]
        switch t
        {
            case 1:
                var spr = -4
                var ix = 0
                var txt = -4
                if ((obj_inputAssigner.player_input_device[0] >= 0))
                {
                    spr = spr_tutorialgamepad
                    switch val
                    {
                        case (3 << 0):
                            ix = scr_get_gamepadicon(global.key_downC)
                            break
                        case (0 << 0):
                            ix = scr_get_gamepadicon(global.key_upC)
                            break
                        case (7 << 0):
                            ix = scr_get_gamepadicon(global.key_attackC)
                            break
                        case (8 << 0):
                            ix = scr_get_gamepadicon(global.key_jumpC)
                            break
                        case (6 << 0):
                            ix = scr_get_gamepadicon(global.key_slapC)
                            break
                        case (4 << 0):
                            if (instance_exists(obj_player1) && (obj_player1.xscale > 0))
                                ix = scr_get_gamepadicon(global.key_rightC)
                            else
                                ix = scr_get_gamepadicon(global.key_leftC)
                            break
                        case (5 << 0):
                            if (instance_exists(obj_player1) && (obj_player1.xscale > 0))
                                ix = scr_get_gamepadicon(global.key_leftC)
                            else
                                ix = scr_get_gamepadicon(global.key_rightC)
                            break
                        case (1 << 0):
                            ix = scr_get_gamepadicon(global.key_leftC)
                            break
                        case (2 << 0):
                            ix = scr_get_gamepadicon(global.key_rightC)
                            break
                        case (9 << 0):
                            ix = scr_get_gamepadicon(global.key_shootC)
                            break
                        case (10 << 0):
                            ix = scr_get_gamepadicon(global.key_tauntC)
                            break
                        case (11 << 0):
                            if global.gamepad_groundpound
                                ix = scr_get_gamepadicon(global.key_downC)
                            else
                                ix = scr_get_gamepadicon(global.key_groundpoundC)
                            break
                        case (12 << 0):
                            if global.gamepad_superjump
                                ix = scr_get_gamepadicon(global.key_upC)
                            else
                                ix = scr_get_gamepadicon(global.key_superjumpC)
                            break
                    }

                }
                else
                {
                    spr = spr_tutorialkey
                    ix = 0
                    var arr = -4
                    switch val
                    {
                        case (3 << 0):
                            arr = scr_get_tutorial_key(global.key_down)
                            break
                        case (0 << 0):
                            arr = scr_get_tutorial_key(global.key_up)
                            break
                        case (7 << 0):
                            arr = scr_get_tutorial_key(global.key_attack)
                            break
                        case (8 << 0):
                            arr = scr_get_tutorial_key(global.key_jump)
                            break
                        case (6 << 0):
                            arr = scr_get_tutorial_key(global.key_slap)
                            break
                        case (4 << 0):
                            if (instance_exists(obj_player1) && (obj_player1.xscale > 0))
                                arr = scr_get_tutorial_key(global.key_right)
                            else
                                arr = scr_get_tutorial_key(global.key_left)
                            break
                        case (5 << 0):
                            if (instance_exists(obj_player1) && (obj_player1.xscale > 0))
                                arr = scr_get_tutorial_key(global.key_left)
                            else
                                arr = scr_get_tutorial_key(global.key_right)
                            break
                        case (1 << 0):
                            arr = scr_get_tutorial_key(global.key_left)
                            break
                        case (2 << 0):
                            arr = scr_get_tutorial_key(global.key_right)
                            break
                        case (9 << 0):
                            arr = scr_get_tutorial_key(global.key_shoot)
                            break
                        case (10 << 0):
                            arr = scr_get_tutorial_key(global.key_taunt)
                            break
                        case (11 << 0):
                            arr = scr_get_tutorial_key(global.key_down)
                            break
                        case (12 << 0):
                            arr = scr_get_tutorial_key(global.key_up)
                            break
                    }

                    if ((arr != -4))
                    {
                        spr = arr[0]
                        ix = arr[1]
                        txt = arr[2]
                    }
                }
                if ((argument5 != (0 << 0)))
                {
                    switch argument5
                    {
                        case (1 << 0):
                            cx += irandom_range(-2, 2)
                            cy += irandom_range(-2, 2)
                            break
                        case (2 << 0):
                            var o = 1
                            if ((argument6 != noone))
                                o = argument6.offset
                            var d = (((i % 2) == 0) ? -1 : 1)
                            var _dir = floor(Wave(-1, 1, 0.1, 0))
                            cy += ((_dir * d) * o)
                            break
                    }

                }
                if ((spr != -4))
                {
                    if ((ix != -4))
                        draw_sprite(spr, ix, cx, cy)
                    if ((txt != -4))
                    {
                        var f = draw_get_font()
                        draw_set_halign(fa_center)
                        draw_set_valign(fa_middle)
                        draw_set_font(global.tutorialfont)
                        draw_text_color((cx + 16), (cy + 14), txt, c_black, c_black, c_black, c_black, argument4)
                        draw_set_font(f)
                        draw_set_halign(fa_left)
                        draw_set_valign(fa_top)
                    }
                }
                break
            case (2 << 0):
                var val2 = b[4]
                scr_draw_text_arr(cx, cy, val2, argument3, argument4, val)
                break
            case (0 << 0):
                if ((argument5 == (0 << 0)))
                    draw_text_color(cx, cy, val, argument3, argument3, argument3, argument3, argument4)
                else
                {
                    var x2 = 0
                    switch argument5
                    {
                        case (1 << 0):
                            for (var j = 1; j <= string_length(val); j++)
                            {
                                var q = string_char_at(val, j)
                                var s1 = irandom_range(-1, 1)
                                var s2 = irandom_range(-1, 1)
                                draw_text_color(((cx + x2) + s1), (cy + s2), q, argument3, argument3, argument3, argument3, argument4)
                                x2 += string_width(q)
                            }
                            break
                        case (2 << 0):
                            for (j = 1; j <= string_length(val); j++)
                            {
                                q = string_char_at(val, j)
                                var s = 0
                                o = 1
                                if ((argument6 != noone))
                                    o = argument6.offset
                                d = (((j % 2) == 0) ? -1 : 1)
                                _dir = floor(Wave(-1, 1, 0.1, 0))
                                s += ((_dir * d) * o)
                                draw_text_color((cx + x2), (cy + s), q, argument3, argument3, argument3, argument3, argument4)
                                x2 += string_width(q)
                            }
                            break
                    }

                }
                break
        }

    }
}

