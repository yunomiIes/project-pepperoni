var _move = 1
with (obj_player1)
{
    if ((state == (119 << 0)) || (state == (98 << 0)) || (state == (90 << 0)) || (state == (46 << 0)) || (state == (112 << 0)) || (state == (292 << 0)))
        _move = 0
}
switch state
{
    case (200 << 0):
        image_xscale = ((obj_player1.x != x) ? sign((obj_player1.x - x)) : image_xscale)
        image_alpha = Approach(image_alpha, targetalpha, 0.01)
        if (!_move)
            state = (400 << 0)
        if ((image_alpha == 0.75))
            state = (0 << 0)
        break
    case (400 << 0):
        image_xscale = ((obj_player1.x != x) ? sign((obj_player1.x - x)) : image_xscale)
        image_alpha = Approach(image_alpha, 0.06, 0.1)
        if _move
            state = (200 << 0)
        break
    case (0 << 0):
        var _g = distance_to_point(obj_player1.x, obj_player1.y)
        if ((_g < 150))
            movespeed = 2
        else if ((_g < 300))
            movespeed = 3
        else if ((_g < 450))
            movespeed = 7
        else
            movespeed = 11
        var _d = point_direction(x, y, obj_player1.x, obj_player1.y)
        hsp = lengthdir_x(movespeed, _d)
        vsp = lengthdir_y(movespeed, _d)
        image_xscale = ((obj_player1.x != x) ? sign((obj_player1.x - x)) : image_xscale)
        if ((!instance_exists(obj_fadeout)) && (!obj_player1.cutscene))
        {
            x += hsp
            y += vsp
            if place_meeting(x, y, obj_player1)
            {
                if ((state != (291 << 0)) && (state != (200 << 0)) && (state != (400 << 0)) && (obj_player1.state != (112 << 0)) && (obj_player1.state != (146 << 0)) && (obj_player1.state != (95 << 0)))
                {
                    with (obj_player1)
                    {
                        hitX = x
                        hitY = y
                        state = (291 << 0)
                        sprite_index = spr_hurt
                        image_speed = 0.35
                    }
                    scr_soundeffect(sfx_johnghost)
                    state = (291 << 0)
                    playerid = other.id
                }
            }
        }
        if (!_move)
            state = (400 << 0)
        image_alpha = targetalpha
        if ((blur_effect > 0))
            blur_effect--
        else
        {
            blur_effect = 2
            with (create_blur_afterimage(x, y, sprite_index, (image_index - 1), image_xscale))
                playerid = other.id
        }
        break
    case (291 << 0):
        var acc = 0.05
        image_alpha = Approach(image_alpha, 0, acc)
        with (obj_player1)
        {
            hsp = 0
            vsp = 0
            movespeed = 0
            x = hitX
            y = hitY
            image_alpha = other.image_alpha
        }
        if ((image_alpha <= 0))
        {
            with (obj_player1)
            {
                x = roomstartx
                y = roomstarty
                state = (0 << 0)
                ghostdash = 0
                ghostpepper = 0
                other.x = x
                other.y = y
                other.state = (200 << 0)
            }
        }
        break
}

