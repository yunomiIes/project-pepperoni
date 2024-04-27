if ((obj_player1.sprite_index != obj_player1.spr_breakdance))
{
    instance_create(x, y, obj_genericpoofeffect)
    instance_destroy()
}
scr_collide()
if (!audio_is_playing(sfx_breakdancemusic))
    scr_soundeffect(sfx_breakdancemusic)
if ((obj_player1.sprite_index != obj_player1.spr_breakdance))
    audio_stop_sound(sfx_breakdancemusic)
