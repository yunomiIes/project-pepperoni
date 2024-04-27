combo = 0
comboscore = 0
combominus = 0
timer_max = 1
timer = 0
title_index = 0
very = 0
depth = (obj_particlesystem.depth - 1)
alarm[0] = 1
with (obj_player)
{
    if (!(place_meeting(x, y, obj_exitgate)))
        global.combodropped = 1
}
if (!global.oldsprites)
{
    depth = -100
    x = 832
    y = 290
}
if (((obj_player1.character == "PZ") || (obj_player1.character == "PI")) && (!audio_is_playing(sfx_comboend)))
    scr_soundeffect(sfx_comboend)
if ((obj_player1.character == "PZ") || (obj_player1.character == "PI"))
    scr_soundeffect(sfx_combovoice1p, 385, 386, 387, 388, 389, 390, 391)
