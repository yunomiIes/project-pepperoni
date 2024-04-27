if ((count > 0))
{
    count--
    if audio_is_playing(sfx_collecttopping)
        audio_stop_sound(sfx_collecttopping)
    scr_soundeffect(sfx_collecttopping)
    global.heattime += 10
    global.heattime = clamp(global.heattime, 0, 60)
    global.combotime += 10
    global.combotime = clamp(global.combotime, 0, 60)
    with (obj_camera)
        healthshaketime = 30
    global.collect += val
    create_collect(obj_player1.x, obj_player1.y, spr, val)
    with (instance_create(obj_player1.x, obj_player1.y, obj_smallnumber))
        number = string(other.val)
    alarm[0] = timer
}
else
    instance_destroy()
