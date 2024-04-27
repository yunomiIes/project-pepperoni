var playerid = obj_player1
if ((obj_player1.spotlight == 0))
    playerid = obj_player2
var _move = 1
with (obj_player)
{
    if ((state == (98 << 0)) || (state == (90 << 0)) || (state == (46 << 0)) || (state == (112 << 0)))
        _move = 0
}
if ((image_alpha >= 1))
{
    if ((!instance_exists(obj_fadeout)) && (!obj_player1.cutscene))
    {
        if _move
        {
            if ((sign(movespeed) != -1))
                movedir = point_direction(x, y, playerid.x, playerid.y)
            x += lengthdir_x(movespeed, movedir)
            y += lengthdir_y(movespeed, movedir)
        }
    }
}
else
    image_alpha += 0.01
if (!_move)
    image_alpha = Approach(image_alpha, 0, 0.1)
parryable = (_move && (!instance_exists(obj_fadeout)) && (!obj_player1.cutscene) && (image_alpha >= 1) && (sprite_index == spr_pizzaface_1))
switch global.elmdifficulty
{
    case 0:
        maxspeed = 6
        break
    case 1:
        maxspeed = 8
        break
    case 2:
        maxspeed = 8
        break
}

movespeed = Approach(movespeed, maxspeed, 0.1)
if (place_meeting(x, y, playerid) && (!playerid.cutscene) && (playerid.state != (146 << 0)) && (!instance_exists(obj_fadeout)) && (!instance_exists(obj_endlevelfade)) && (image_alpha >= 1))
{
    if instance_exists(obj_toppinwarrior)
    {
        if (variable_global_exists("toppinwarriorid1") && instance_exists(global.toppinwarriorid1))
            instance_destroy(global.toppinwarriorid1)
        else if (variable_global_exists("toppinwarriorid2") && instance_exists(global.toppinwarriorid2))
            instance_destroy(global.toppinwarriorid2)
        else if (variable_global_exists("toppinwarriorid3") && instance_exists(global.toppinwarriorid3))
            instance_destroy(global.toppinwarriorid3)
        else if (variable_global_exists("toppinwarriorid4") && instance_exists(global.toppinwarriorid4))
            instance_destroy(global.toppinwarriorid4)
        else if (variable_global_exists("toppinwarriorid5") && instance_exists(global.toppinwarriorid5))
            instance_destroy(global.toppinwarriorid5)
        instance_create(x, y, obj_flash)
        global.seconds = 59
        obj_camera.alarm[1] = 60
        obj_camera.ded = 0
        instance_destroy()
    }
    else if (!instance_exists(obj_toppinwarrior))
    {
        with (playerid)
        {
            instance_destroy(obj_fadeout)
            targetDoor = "A"
            room = timesuproom
            state = (64 << 0)
            sprite_index = spr_Timesup
            image_index = 0
            audio_stop_all()
            if ((global.oldsprites == 1))
                scr_soundeffect(mu_timesup)
            else
                scr_soundeffect(mu_Your_Fat_Ass_Slows_You_Down)
        }
    }
    instance_destroy()
}
