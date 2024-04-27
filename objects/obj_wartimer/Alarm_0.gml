seconds--
if ((object_index != obj_sucrosetimer) && (object_index != obj_deathmodetimer))
    scr_soundeffect(sfx_WarTimer)
alarm[0] = 60
if ((seconds < 0))
{
    if ((minutes > 0))
    {
        minutes--
        seconds = 59
    }
    else
    {
        seconds = 0
        if ((room != rank_room))
        {
            alarm[1] = 60
            alarm[0] = -1
        }
    }
}
