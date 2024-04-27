global.pizzacoin += 1
if audio_is_playing(sfx_pizzacoin)
    audio_stop_sound(sfx_pizzacoin)
scr_soundeffect(sfx_pizzacoin)
instance_destroy()
