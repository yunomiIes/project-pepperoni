function scr_player_tackle() //gml_Script_scr_player_tackle
{
    combo = 0
    mach2 = 0
    hsp = ((-xscale) * movespeed)
    start_running = 1
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    if ((sprite_index != spr_golfswing))
    {
        if (grounded && (vsp > 0.5))
            state = (0 << 0)
    }
    else if ((floor(image_index) == (image_number - 1)))
        state = (0 << 0)
    if ((floor(image_index) != (image_number - 1)))
        image_speed = 0.35
    else
        image_speed = 0
    return;
}

