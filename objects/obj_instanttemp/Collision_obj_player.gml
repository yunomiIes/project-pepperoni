instance_destroy(obj_iceblock)
instance_destroy(obj_iceblockslope)
if ((sprite_index != spr_heater2))
{
    sprite_index = spr_heater2
    if (!audio_is_playing(sfx_icebreakbig))
        scr_soundeffect(sfx_icebreakbig)
}
