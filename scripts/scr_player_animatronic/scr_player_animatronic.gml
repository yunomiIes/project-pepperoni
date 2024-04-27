function scr_player_animatronic() //gml_Script_scr_player_animatronic
{
    if ((character == "NTV"))
    {
        xscale = 1
        sprite_index = spr_playerN_animatronic
        if (!grounded)
            sprite_index = spr_doise_deadair
        image_speed = 0.35
        if ((animatronic_buffer > 0))
            animatronic_buffer--
        else if grounded
            instance_create_unique(x, y, 1004)
        return;
    }
    sprite_index = spr_pepanimatronic
    move = (key_left + key_right)
    hsp = (move * movespeed)
    if ((vsp < 0) && (!key_jump2) && (!jumpstop))
    {
        jumpstop = 1
        vsp /= 10
    }
    if key_jump
        input_buffer_jump = 0
    if ((move != 0))
    {
        xscale = move
        movespeed = 4
    }
    else
        movespeed = 0
    if ((animatronic_buffer > 0))
        animatronic_buffer--
    else
    {
        repeat (3)
            create_debris(x, y, 1510)
        state = (0 << 0)
    }
    if ((animatronic_collect_buffer > 0))
        animatronic_collect_buffer--
    else
    {
        animatronic_collect_buffer = 30
        if ((global.collect > 0))
        {
            global.collect -= 5
            repeat (10)
                create_debris(x, y, choose(1597, 1600, 1599, 1598, 1602), 1)
        }
    }
    if (grounded && (vsp > 0) && (input_buffer_jump < 8))
    {
        input_buffer_jump = 8
        vsp = -11
        jumpstop = 0
    }
    if ((move != 0) && grounded && (vsp > 0))
    {
        if ((steppybuffer > 0))
            steppybuffer--
        else
        {
            create_particle(x, (y + 43), (1 << 0), 0)
            steppybuffer = 12
        }
    }
}

