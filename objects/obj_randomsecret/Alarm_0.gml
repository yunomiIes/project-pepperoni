if (!start)
    return;
alarm[0] = 60
if (((!instance_exists(obj_secretportalstart)) || obj_secretportalstart.drop) && ((!instance_exists(obj_secretportal)) || (!obj_secretportal.touched)))
{
    seconds--
    if ((seconds < 0))
    {
        if ((minutes > 0))
        {
            minutes--
            seconds = 59
        }
        else if ((room != rank_room))
        {
            with (obj_player1)
            {
                instance_destroy(obj_fadeout)
                targetDoor = "A"
                state = (64 << 0)
                sprite_index = spr_Timesup
                image_index = 0
                visible = true
                image_blend = c_white
                audio_stop_all()
                scr_soundeffect(mu_Your_Fat_Ass_Slows_You_Down)
                room = timesuproom
            }
            instance_destroy()
        }
    }
}
