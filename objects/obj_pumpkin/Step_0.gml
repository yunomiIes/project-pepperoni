image_alpha = 0
if ((distance_to_object(obj_player1) <= 400))
    image_alpha = (1 - (distance_to_object(obj_player1) / 400))
if ((distance_to_object(obj_player1) <= 400))
{
    if (!audio_is_playing(mu_pumpkin))
        scr_soundeffect(mu_pumpkin)
    with (obj_music)
    {
        audio_sound_gain(mu_pumpkin, (0.6 * global.option_music_volume), 2000)
        audio_sound_gain(musicID, 0, 2000)
    }
}
else if ((distance_to_object(obj_player1) <= 500))
{
    with (obj_music)
    {
        audio_sound_gain(mu_pumpkin, 0, 2000)
        audio_sound_gain(musicID, (0.6 * global.option_music_volume), 2000)
    }
}
