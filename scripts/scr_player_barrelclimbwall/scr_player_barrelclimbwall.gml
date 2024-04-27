function scr_player_barrelclimbwall() //scr_player_barrelclimbwall
{
    if ((character == "NTV"))
    {
        move = (key_left + key_right)
        vsp = (-wallspeed)
        sprite_index = spr_playerN_barrelclimbwall
        if ((!key_attack) && (!(place_meeting(x, (y + 1), obj_current))) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
        {
            mask_index = spr_player_mask
            if (!(place_meeting(x, y, obj_solid)))
            {
                movespeed = 0
                state = (114 << 0)
                sprite_index = spr_player_barrelfall
            }
        }
        if scr_solid(x, (y - 1))
        {
            movespeed = 0
            state = (114 << 0)
            sprite_index = spr_player_barrelfall
            mask_index = spr_player_mask
            while place_meeting(x, y, obj_solid)
                y++
        }
        if (!(scr_solid((x + xscale), y)))
        {
            ledge_bump(32)
            state = (116 << 0)
            vsp = 0
            if ((wallspeed < 6))
                wallspeed = 6
            movespeed = wallspeed
            sprite_index = spr_player_barrelroll
        }
        if ((input_buffer_jump < 8))
        {
            scr_soundeffect(sfx_jumpN)
            input_buffer_jump = 8
            state = (116 << 0)
            vsp = -11.5
            jumpstop = 0
            movespeed = 10
            xscale *= -1
            hsp = (xscale * movespeed)
            sprite_index = spr_player_barrelroll
        }
        with (instance_place(x, (y + vsp), obj_destructibles))
            instance_destroy()
        return;
    }
    move = (key_left + key_right)
    hsp = 0
    if ((sprite_index == spr_player_barrelslipnslide) && (floor(image_index) == (image_number - 1)))
        sprite_index = spr_player_barrelroll
    if ((!key_attack) && (!(place_meeting(x, (y + 1), obj_current))) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
    {
        movespeed = 0
        state = (114 << 0)
        sprite_index = spr_player_barrelfall
    }
    if (grounded && (vsp > 0))
    {
        state = (116 << 0)
        if scr_solid((x + xscale), y)
            xscale *= -1
        movespeed = (xscale * 10)
    }
    with (instance_place(x, (y + vsp), obj_destructibles))
        instance_destroy()
    with (instance_place(x, (y + vsp), obj_baddie))
    {
        if destroyable
            instance_destroy()
    }
    return;
}

