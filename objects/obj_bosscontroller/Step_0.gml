if (!round_timer_init)
{
    round_timer = round_timermax
    round_timer_init = 1
}
round_timer--
if ((round_timer <= 0))
{
    round_timer = 0
    if ((bell_sprite != spr_bosstimer_hitbell))
    {
        bell_sprite = spr_bosstimer_hitbell
        bell_index = 0
    }
    else if ((floor(bell_index) == (sprite_get_number(spr_bosstimer_hitbell) - 1)) && (!instance_exists(obj_fadeout)))
    {
        with (obj_player1)
        {
            targetDoor = "A"
            room = timesuproom
            state = (64 << 0)
            sprite_index = spr_Timesup
            image_index = 0
            audio_stop_all()
            if ((global.oldsprites == 1))
                scr_soundeffect(mu_Your_Fat_Ass_Slows_You_Down)
            else
                scr_soundeffect(mu_Your_Fat_Ass_Slows_You_Down)
        }
    }
}
bell_index += 0.35
if ((!instance_exists(bossID)) && (!bossdead))
{
    bossdead = 1
    audio_stop_all()
    scr_soundeffect(sfx_bossbeatenjingle)
    alarm[0] = 410
    with (obj_player1)
    {
        sprite_index = spr_player_levelcomplete
        image_speed = 0.35
        image_index = 0
        state = (144 << 0)
    }
}
