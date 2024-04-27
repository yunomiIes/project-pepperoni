function scr_separate_text2(argument0, argument1, argument2) //scr_separate_text2
{
    draw_set_font(argument1)
    while ((scr_string_width(argument0) > (argument2 - string_width("a"))))
    {
        var _pos = string_length(argument0)
        var _oldpos = _pos
        while ((string_char_at(argument0, _pos) != " "))
        {
            _pos--
            if ((_pos < 0))
                _pos = _oldpos
        }
        if ((string_char_at(argument0, _pos) == " "))
            argument0 = string_delete(argument0, _pos, 1)
        argument0 = string_insert("\n", argument0, _pos)
    }
    return argument0;
}

