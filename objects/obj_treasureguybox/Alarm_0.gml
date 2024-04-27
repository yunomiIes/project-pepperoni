if ((current_arr > (array_length(content_arr) - 1)))
    return;
if audio_is_playing(sfx_collecttopping)
    audio_stop_sound(sfx_collecttopping)
scr_soundeffect(sfx_collecttopping)
global.heattime += 10
global.heattime = clamp(global.heattime, 0, 60)
global.combotime += 10
global.combotime = clamp(global.combotime, 0, 60)
with (obj_camera)
    healthshaketime = 30
var val = 10
global.collect += val
create_collect(x, y, choose(1597, 1599, 1600, 1602, 1598), val)
with (instance_create((x + 16), y, obj_smallnumber))
    number = string(val)
current_arr++
alarm[0] = count
