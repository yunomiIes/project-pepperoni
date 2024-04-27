function scr_compile_icon_text(argument0, argument1, argument2) //gml_Script_scr_compile_icon_text
{
    if ((argument1 == undefined))
        argument1 = 1
    if ((argument2 == undefined))
        argument2 = false
    var arr = []
    var len = string_length(argument0)
    var newline = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    var char_x = 0
    var char_y = 0
    var saved_pos = 1
    while ((argument1 <= len))
    {
        var start = argument1
        var char = string_ord_at(argument0, argument1)
        switch char
        {
            case 10:
                char_y += newline
                char_x = 0
                break
            case 123:
                var effect = string_copy(argument0, argument1, 3)
                var te = 1
                argument1 += 3
                var n = scr_compile_icon_text(argument0, argument1, true)
                switch effect
                {
                    case "{s}":
                        te = 1
                        break
                    case "{u}":
                        te = 2
                        break
                }

                array_push(arr, [char_x, char_y, 2, te, n[0]])
                argument1 = n[1]
                char_x = n[2]
                char_y = n[3]
                break
            case 91:
                var button = string_copy(argument0, argument1, 3)
                var t = 1
                var b = 0
                switch button
                {
                    case "[D]":
                        b = 3
                        break
                    case "[U]":
                        b = 0
                        break
                    case "[M]":
                        b = 7
                        break
                    case "[J]":
                        b = 8
                        break
                    case "[G]":
                        b = 6
                        break
                    case "[F]":
                        b = 4
                        break
                    case "[B]":
                        b = 5
                        break
                    case "[L]":
                        b = 1
                        break
                    case "[R]":
                        b = 2
                        break
                    case "[S]":
                        b = 9
                        break
                    case "[T]":
                        b = 10
                        break
                    case "[g]":
                        b = 11
                        break
                    case "[s]":
                        b = 12
                        break
                }

                array_push(arr, [char_x, char_y, t, b])
                char_x += 32
                argument1 += 2
                break
            case 47:
                if argument2
                {
                    saved_pos = argument1
                    argument1 = (len + 1)
                }
                break
            default:
                while (((argument1 + 1) <= len))
                {
                    char = string_ord_at(argument0, (argument1 + 1))
                    if ((char != 91) && (char != 10) && (char != 123) && (char != 47))
                        argument1 += 1
                    else
                        break
                }
                n = string_copy(argument0, start, ((argument1 - start) + 1))
                array_push(arr, [char_x, char_y, 0, n])
                char_x += string_width(n)
                break
        }

        argument1 += 1
    }
    if argument2
        return [arr, saved_pos, char_x, char_y];
    return arr;
}

