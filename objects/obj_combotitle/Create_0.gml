title_index = 0
title = 0
vsp = 0
alpha = 3
very = 0
depth = -10
alarm[0] = 3
image_speed = 0
if ((!global.oldsprites) && (obj_player1.character != "PZ") && (obj_player1.character != "PI"))
{
    scr_soundeffect(sfx_comboup1, 197, 198)
    depth = -100
    x = 832
    y = 290
    ystart = y
    alarm[1] = 120
}
else if ((obj_player1.character == "PZ") || (obj_player1.character == "PI"))
{
    scr_soundeffect(sfx_combotitle1, 382, 383)
    depth = -100
    x = 832
    y = 290
    ystart = y
    alarm[1] = 120
}
