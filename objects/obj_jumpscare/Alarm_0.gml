state++
if ((state == 1))
{
    if ((oktoberfest == 1))
        scr_soundeffect(sfx_Voice06, 220)
    else
        scr_soundeffect(sfx_jumpscare)
    alarm[0] = 100
    if instance_exists(obj_jumpscare)
        audio_stop_sound(mu_alert)
    audio_stop_sound(sfx_alarm)
}
else if ((state == 2))
    alarm[1] = 30
