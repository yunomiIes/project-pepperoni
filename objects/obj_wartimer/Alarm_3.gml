if audio_is_playing(sfx_WarTimerUp)
    audio_stop_sound(sfx_WarTimer)
if (!audio_is_playing(sfx_WarTimer))
    audio_stop_sound(sfx_WarTimer)
alarm[3] = 60
