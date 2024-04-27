var playerid = obj_player1
if ((obj_player1.spotlight == 0))
    playerid = obj_player2
if ((image_alpha >= 1) && (room != tower_lemonfacejumpscare))
{
    var dir = point_direction(x, y, playerid.x, playerid.y)
    var _xdistance = abs((x - playerid.x))
    var _ydistance = abs((y - playerid.y))
    if (((lastframexdistance + 8) <= _xdistance))
        hsp = lerp(hsp, lengthdir_x(((16 * movespeed) * parryspeed), dir), 0.02)
    else
        hsp = lerp(hsp, lengthdir_x(((10 * movespeed) * parryspeed), dir), 0.02)
    if (((lastframeydistance + 8) <= _ydistance))
        vsp = lerp(vsp, lengthdir_y(((16 * movespeed) * parryspeed), dir), 0.02)
    else
        vsp = lerp(vsp, lengthdir_y(((10 * movespeed) * parryspeed), dir), 0.02)
    lastframexdistance = _xdistance
    lastframeydistance = _ydistance
    x += hsp
    y += vsp
}
else
    image_alpha += 0.01
if ((room == tower_lemonfacejumpscare))
{
    visible = false
    alarm[0] = -1
}
if (place_meeting(x, y, playerid) && (!playerid.cutscene) && (playerid.state != (146 << 0)) && (!instance_exists(obj_fadeout)) && (!instance_exists(obj_endlevelfade)) && (image_alpha >= 1) && (room != tower_lemonfacejumpscare))
{
    with (playerid)
    {
        instance_destroy(obj_fadeout)
        targetDoor = "A"
        room = tower_lemonfacejumpscare
        state = (18 << 0)
        audio_stop_all()
        audio_stop_sound(sfx_lemonface1)
        scr_soundeffect(sfx_lemonface2)
    }
}
if (!audio_is_playing(sfx_lemonface1))
    scr_soundeffect(sfx_lemonface1)
if point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
    audio_sound_gain(sfx_lemonface1, 0.1, 875)
else
    audio_sound_gain(sfx_lemonface1, 0.03, 1055)
