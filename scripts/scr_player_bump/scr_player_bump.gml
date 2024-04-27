function scr_player_bump() //scr_player_bump
{
    if ((sprite_index != spr_wallsplat))
    {
        movespeed = 0
        mach2 = 0
        start_running = 1
        alarm[4] = 14
        if (grounded && (vsp > 0))
            hsp = 0
        var can_end = 1
        if ((sprite_index == spr_tumbleend))
            can_end = (!(place_meeting(x, y, obj_pepgoblin_kickhitbox)))
        if ((sprite_index == spr_tumbleend) && ((!grounded) || (!can_end)))
            image_speed = 0
        else
            image_speed = 0.35
        if ((sprite_index == spr_tumbleend) && (floor(image_index) >= 3) && (!grounded))
            image_index = 3
        if ((sprite_index == spr_rockethitwall) && grounded)
            image_index = (image_number - 1)
        if ((floor(image_index) == (image_number - 1)) && (sprite_index != spr_player_catched) && (sprite_index != spr_boxxedpep_air))
        {
            if (!skateboarding)
            {
                if ((sprite_index != spr_rockethitwall) || grounded)
                {
                    if (!isgustavo)
                        state = (0 << 0)
                    else
                        state = (191 << 0)
                }
            }
            else
                state = (104 << 0)
        }
        if ((sprite_index != spr_player_catched) && (sprite_index != spr_boxxedpep_air) && (sprite_index != spr_rockethitwall) && (sprite_index != spr_tumbleend) && (sprite_index != spr_hitwall))
            sprite_index = ((!skateboarding) ? spr_bump : spr_clownbump)
    }
    else
    {
        movespeed = 0
        hsp = 0
        vsp = 0
        if ((floor(image_index) == (image_number - 1)))
            state = (0 << 0)
        image_speed = 0.35
    }
    return;
}

