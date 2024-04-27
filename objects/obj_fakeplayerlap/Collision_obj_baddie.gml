if other.thrown
{
    if audio_is_playing(sfx_beerhit)
        audio_stop_sound(sfx_beerhit)
    scr_soundeffect(sfx_beerhit)
    sprite_index = spr_player_hurt
    state = (270 << 0)
    stunbuffer = 40
    hsp = (-12 * other.image_xscale)
}
