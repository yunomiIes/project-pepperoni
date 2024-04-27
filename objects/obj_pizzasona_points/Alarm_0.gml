collect -= 10
global.collect += 10
if audio_is_playing(sfx_collecttopping)
    audio_stop_sound(sfx_collecttopping)
scr_soundeffect(sfx_collecttopping)
create_collect((x + irandom_range(-40, 40)), (y + irandom_range(-40, 40)), choose(1602, 1600, 1599, 1597, 1598))
if ((collect > 0))
    alarm[0] = 5
else
    instance_destroy()
