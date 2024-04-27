if ((buffer <= 0) && (other.state != (16 << 0)) && other.grounded)
{
    buffer = 50
    with (other)
    {
        vsp = -11
        movespeed = abs(movespeed)
        dir = xscale
        movespeed = 13
        instance_create(x, y, obj_jumpdust)
        sprite_index = spr_player_corpsestart
        image_index = 0
        if audio_is_playing(sfx_gravecorpsestart)
            audio_stop_sound(sfx_gravecorpsestart)
        scr_soundeffect(sfx_gravecorpsestart)
        with (obj_gravecorpse)
        {
            if ((playerid == other.id))
                instance_destroy()
        }
        with (instance_create(x, y, obj_gravecorpse))
            playerid = other.id
        state = (211 << 0)
    }
}
