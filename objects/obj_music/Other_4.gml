if ((!global.panic) && (!global.snickchallenge) && (!global.death_mode) && (music != pizzapeppermusicID))
{
    var i = 0
    while ((i < array_length(room_arr)))
    {
        var b = room_arr[i]
        if ((room == b[0]))
        {
            var prevmusic = music
            music = b[1]
            secretmusic = b[2]
            if ((music != prevmusic))
            {
                var prevmuID = musicID
                musicID = scr_music(music)
                if b[3]
                    audio_sound_set_track_position(musicID, audio_sound_get_track_position(prevmuID))
                if global.finalgamemusicchange
                {
                    audio_sound_gain(prevmuID, 0, 1800)
                    if ((audio_sound_get_gain(prevmuID) <= 0))
                        audio_stop_sound(prevmuID)
                }
                else
                    audio_stop_sound(prevmuID)
            }
            audio_stop_sound(secretmusicID)
            audio_stop_sound(pillarmusicID)
            secretmusicID = -4
            break
        }
        else
            i++
    }
    if instance_exists(obj_hungrypillar)
    {
        pillarmusicID = scr_music(161)
        audio_sound_gain(pillarmusicID, 0, 0)
    }
}
if (!instance_exists(obj_randomsecret))
{
    if secret
    {
        secretmusicID = scr_music(secretmusic)
        audio_sound_set_track_position(secretmusicID, audio_sound_get_track_position(musicID))
        audio_pause_sound(musicID)
    }
    else if secretend
    {
        secretend = 0
        audio_resume_sound(musicID)
        audio_stop_sound(secretmusicID)
    }
}
if ((room == rank_room))
{
    audio_stop_sound(musicID)
    audio_stop_sound(secretmusicID)
    audio_stop_sound(pillarmusicID)
    audio_stop_sound(mu_deathmode)
    audio_stop_sound(mu_snickchallenge)
    musicID = -4
    secretmusicID = -4
    pillarmusicID = -4
}
if (global.death_mode || global.snickchallenge)
    audio_stop_sound(music)
scr_entrancemus()
