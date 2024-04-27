prevpillar_on_camera = pillar_on_camera
if instance_exists(obj_hungrypillar)
{
    var p = 0
    with (obj_hungrypillar)
    {
        if bbox_in_camera(view_camera[0], 0)
            p = 1
    }
    if ((p != pillar_on_camera))
        pillar_on_camera = p
}
else
    pillar_on_camera = 0
if ((prevpillar_on_camera != pillar_on_camera))
{
    if (pillar_on_camera && (!global.death_mode))
    {
        audio_sound_gain(pillarmusicID, (0.6 * global.option_music_volume), 2000)
        audio_sound_gain(musicID, 0, 2000)
    }
    else
    {
        audio_sound_gain(pillarmusicID, 0, 2000)
        audio_sound_gain(musicID, (0.6 * global.option_music_volume), 2000)
    }
}
if (global.panic && (!global.death_mode))
{
    if (!panicstart)
    {
        panicstart = 1
        if ((music != panicmusID) && (music != 32) && (music != lap2musID) && (music != lap3musID) && (music != lap4musID))
        {
            music = escapemusicID
            audio_stop_sound(musicID)
            musicID = scr_music(music)
            if ((pillarmusicID != -4))
                audio_stop_sound(pillarmusicID)
            pillarmusicID = -4
        }
    }
    if (!global.death_mode)
    {
        if (audio_is_playing(panicmusID) && (global.laps > 0) && (!global.greglap2))
        {
            audio_stop_sound(panicmusID)
            escapemusicID = lap2musID
            music = escapemusicID
            musicID = scr_music(music)
        }
    }
    else if (audio_is_playing(lap2musID) && (global.laps > 0))
    {
        audio_stop_sound(lap2musID)
        escapemusicID = panicmusID
        music = escapemusicID
        musicID = scr_music(music)
    }
    if (audio_is_playing(lap2musID) && (global.laps > 1))
    {
        audio_stop_sound(lap2musID)
        escapemusicID = lap3musID
        music = escapemusicID
        musicID = scr_music(music)
    }
    if (audio_is_playing(lap3musID) && (global.laps > 2))
    {
        audio_stop_sound(lap3musID)
        escapemusicID = lap4musID
        music = escapemusicID
        musicID = scr_music(music)
    }
    if (audio_is_playing(lap4musID) && (global.laps > 3))
    {
        audio_stop_sound(lap4musID)
        escapemusicID = lap5musID
        music = escapemusicID
        musicID = scr_music(music)
    }
}
else
{
    panicstart = 0
    escapemusicID = panicmusID
    audio_stop_sound(escapemusicID)
}
if ((obj_player1.character == "P") || (obj_player1.character == "NTV") || (obj_player1.character == "N") || (obj_player1.character == "S") || (obj_player1.character == "B") || (obj_player1.character == "V") || (obj_player1.character == "M"))
{
    if ((obj_player1.character == "NTV"))
        lap2musID = 507
    else
        lap2musID = 141
    lap3musID = 196
    lap4musID = 356
    lap5musID = 502
}
else
{
    lap2musID = 499
    lap3musID = 500
    lap4musID = 501
    lap5musID = 503
}
if ((obj_player1.character == "P") && obj_player1.ispeppino)
    panicmusID = 136
else if ((obj_player1.character == "NTV") || (obj_player1.character == "N") || ((obj_player1.character == "P") && (!obj_player1.ispeppino)))
    panicmusID = 506
else if ((obj_player1.character == "S"))
    panicmusID = 349
else if ((obj_player1.character == "PI") || global.pizzanoescape)
    panicmusID = 292
else if ((obj_player1.character == "PZ") || global.pizzeleescape)
    panicmusID = 306
else if ((obj_player1.character == "B"))
    panicmusID = 360
else if global.gregescape
    panicmusID = 374
