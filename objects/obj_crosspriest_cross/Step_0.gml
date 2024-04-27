if ((!instance_exists(playerid)) || (playerid.holycross <= 0))
{
    instance_destroy()
    return;
}
var _x = xoffset
xoffset = Wave(-100, 100, 2, 10, timer)
yoffset = Wave(-20, 20, 1, 8, timer)
x = (playerid.x + xoffset)
y = (playerid.y + yoffset)
if ((sign((xoffset - _x)) < 0))
    depth = -5
else if ((sign((xoffset - _x)) > 0))
    depth = -12
timer += (current_time - last_current_time)
last_current_time = current_time
if ((playerid.holycross < 100) && (alarm[1] == -1))
    alarm[1] = 10
else if ((playerid.holycross >= 100))
    image_alpha = 1
if (!audio_is_playing(sfx_crossloop))
    scr_soundeffect(sfx_crossloop)
