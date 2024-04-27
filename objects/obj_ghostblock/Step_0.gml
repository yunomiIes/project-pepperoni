with (obj_player)
{
    if (ghostdash && (ghostpepper >= 3))
    {
        with (other)
        {
            if (place_meeting(x, (y + 1), -2) || place_meeting(x, (y - 1), -2) || place_meeting((x + 1), y, -2) || place_meeting((x - 1), y, -2))
                instance_destroy()
        }
    }
}
