function scr_player_hook() //gml_Script_scr_player_hook
{
    if key_jump
    {
        state = (92 << 0)
        sprite_index = spr_jump
        image_index = 0
        vsp = -11
        jumpstop = 0
    }
    return;
}

