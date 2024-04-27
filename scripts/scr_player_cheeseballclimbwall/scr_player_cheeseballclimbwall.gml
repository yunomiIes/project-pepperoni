function scr_player_cheeseballclimbwall() //scr_player_cheeseballclimbwall
{
    hsp = 0
    vsp = (-wallspeed)
    if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
    {
        scr_soundeffect(sfx_groundpound)
        image_index = 0
        movespeed = 0
        cheesepeptimer = 2
        state = (26 << 0)
        sprite_index = spr_cheesepepfall
        repeat (8)
            create_debris((x + random_range(-8, 8)), (y + random_range(-8, 8)), 2897)
    }
    wallspeed = Approach(wallspeed, 12, 1)
    if (!(scr_solid((x + xscale), y)))
    {
        if ((movespeed > 8))
            movespeed = 8
        instance_create(x, y, obj_jumpdust)
        vsp = 0
        state = (21 << 0)
        movespeed = wallspeed
        hsp = (xscale * movespeed)
    }
    if key_jump
    {
        vsp = -6
        movespeed = 6
        state = (21 << 0)
        repeat (4)
            create_debris((x + (xscale * 30)), (y + random_range(-8, 8)), 1165)
        xscale *= -1
    }
    if (grounded && ((floor(image_index) % 4) == 0))
        create_debris((x + (xscale * 30)), y, 1165)
    return;
}

