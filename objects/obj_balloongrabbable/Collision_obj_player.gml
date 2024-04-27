if active
{
    if (other.isgustavo && other.brick)
    {
        other.state = (200 << 0)
        active = 0
        cooldown = 100
        other.balloonbuffer = 250
    }
    else if ((other.isgustavo == 0))
    {
        if audio_is_playing(sfx_ratgrab1)
            audio_stop_sound(sfx_ratgrab1)
        if audio_is_playing(sfx_ratgrab2)
            audio_stop_sound(sfx_ratgrab2)
        scr_soundeffect(sfx_ratgrab1, 279)
        other.state = (207 << 0)
        other.movespeed = other.hsp
        active = 0
        with (other)
        {
            if isgustavo
                vsp = -7
        }
        cooldown = 100
        other.balloonbuffer = 250
    }
}
