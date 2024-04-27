function scr_playerN_freezerintro() //gml_Script_scr_playerN_freezerintro
{
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_playerN_freezerintro))
    {
        state = (0 << 0)
        sprite_index = spr_idle
        image_index = 0
        global.noisejetpack = 1
    }
    image_speed = 0.35
}

