function cutscene_entrance_end() //gml_Script_cutscene_entrance_end
{
    with (obj_player)
    {
        state = (0 << 0)
        x = backtohubstartx
        y = backtohubstarty
    }
    global.levelcomplete = 0
    global.entrancecutscene = 1
    quick_ini_write_real(get_savefile_ini(), "cutscene", "jingle_entrance", 1)
    cutscene_end_action()
    return;
}

function cutscene_factory_end() //gml_Script_cutscene_factory_end
{
    with (obj_player)
    {
        state = (0 << 0)
        x = backtohubstartx
        y = backtohubstarty
    }
    global.levelcomplete = 0
    global.factorycutscene = 1
    quick_ini_write_real(get_savefile_ini(), "cutscene", "jingle_factory", 1)
    cutscene_end_action()
    return;
}

function cutscene_save_game() //gml_Script_cutscene_save_game
{
    gamesave_async_save()
    cutscene_end_action()
    return;
}

