y = (-sprite_height)
down = 1
movespeed = 2
depth = -100
scr_soundeffect(sfx_lap2)
image_speed = 0
if ((obj_player1.character != "PZ") && (obj_player1.character != "PI"))
{
    if ((global.laps == 1))
        sprite_index = spr_lap2
    if ((global.laps >= 2))
    {
        sprite_index = spr_lapflag
        if ((global.laps == 2))
            image_index = 0
        else if ((global.laps == 3))
            image_index = 1
        else if ((global.laps == 4))
            image_index = 2
    }
}
else
{
    sprite_index = spr_lapvisualSP
    image_index = (global.laps - 0)
}
if ((global.laps > 4))
    visible = false
