function scr_text_arr_size(argument0) //scr_text_arr_size
{
    var w = 0
    var newline = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    var h = newline
    for (var i = 0; i < array_length(argument0); i++)
    {
        var b = argument0[i]
        var cx = b[0]
        var cy = b[1]
        var t = b[2]
        var val = b[3]
        switch t
        {
            case (1 << 0):
                if (((cx + 32) > w))
                    w += 32
                break
            case (2 << 0):
                var val2 = b[4]
                var q = scr_text_arr_size(val2)
                if (((cy + q[1]) > h))
                    h += (q[1] - newline)
                else if (((cx + q[0]) > w))
                    w += q[0]
                break
            case (0 << 0):
                if ((cy > h))
                    h += newline
                else
                {
                    var sw = string_width(val)
                    if (((cx + sw) > w))
                        w += string_width(val)
                }
                break
        }

    }
    return [w, h];
}

