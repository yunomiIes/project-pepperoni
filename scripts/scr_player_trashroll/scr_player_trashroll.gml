function scr_player_trashroll() //scr_player_trashroll
{
    image_speed = 0.35
    hsp = (xscale * movespeed)
    if (scr_slope() && (hsp != 0) && (movespeed < 14))
        scr_player_addslopemomentum(0.25, 0.5)
    movespeed = max(3, movespeed)
    if ((sprite_index != spr_player_corpsestart) && (sprite_index != spr_player_corpsesurf))
    {
        if ((sprite_index != spr_player_trashjump) && (sprite_index != spr_player_trashjump2) && (sprite_index != spr_player_trashfall))
            sprite_index = spr_player_trashslide
        else
        {
            if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_player_trashjump2))
                sprite_index = spr_player_trashfall
            if ((vsp > 0) && (sprite_index == spr_player_trashjump))
            {
                sprite_index = spr_player_trashjump2
                image_index = 0
            }
            if (grounded && (vsp > 0))
                sprite_index = spr_player_trashslide
        }
    }
    else
    {
        image_speed = 0.35
        if ((sprite_index == spr_player_corpsestart) && (floor(image_index) == (image_number - 1)))
            sprite_index = spr_player_corpsesurf
    }
    if ((!instance_exists(obj_slidecloud)) && grounded)
    {
        if (!(place_meeting(x, (y + 1), obj_current)))
        {
            with (instance_create(x, y, obj_slidecloud))
                image_xscale = other.xscale
        }
    }
    if key_jump
    {
        dir = xscale
        state = (104 << 0)
        sprite_index = spr_mach2jump
        jumpstop = 0
        vsp = -11
        instance_create(x, y, obj_jumpdust)
    }
    if (((place_meeting((x + xscale), y, obj_solid) || place_meeting((x + xscale), y, obj_ghostwall)) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_rattumble)))) || place_meeting(x, y, obj_timedgate))
    {
        state = (106 << 0)
        hsp = ((-xscale) * 3)
        vsp = -3
    }
    return;
}

