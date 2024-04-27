function scr_player_freefallland() //gml_Script_scr_player_freefallland
{
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    movespeed = 0
    facehurt = 1
    start_running = 1
    alarm[4] = 14
    vsp = 0
    hsp = 0
    if (key_jump2 && groundpoundjumpTEST && (character == "P"))
    {
        vsp = -16
        state = (92 << 0)
        sprite_index = spr_player_groundpoundjump
    }
    if ((floor(image_index) == (image_number - 1)))
    {
        state = (0 << 0)
        jumpstop = 1
        facehurt = 1
        sprite_index = spr_facehurtup
        image_index = 0
    }
    image_speed = 0.35
    return;
}

