if ((string_copy(room_get_name(room), 1, 10) == "strongcold"))
{
    if ((visible == true) && (obj_player.state != (7 << 0)))
    {
        if place_meeting(x, (y - 1), obj_player1)
        {
            with (obj_player1)
            {
                if ((state == (47 << 0)))
                    state = (38 << 0)
                else if ((state != (38 << 0)))
                {
                    state = (94 << 0)
                    sprite_index = spr_slipnslide
                }
                if ((movespeed < 12))
                    movespeed = 12
            }
        }
        if place_meeting(x, (y - 1), obj_player2)
        {
            with (obj_player2)
            {
                if ((state == (47 << 0)))
                    state = (38 << 0)
                else if ((state != (38 << 0)))
                {
                    state = (94 << 0)
                    sprite_index = spr_slipnslide
                }
                if ((movespeed < 12))
                    movespeed = 12
            }
        }
    }
}
