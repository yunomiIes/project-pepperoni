if ((room != rank_room) && (minutes <= 0) && (seconds <= 0) && (addseconds <= 0))
{
    instance_destroy(obj_fadeout)
    with (obj_player)
    {
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
    if ((global.laps < 1) && (!global.checkpoints))
        instance_create(0, 0, obj_timesupwar)
    instance_destroy()
}
