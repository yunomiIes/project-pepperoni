function cutscene_dungeon_end() //gml_Script_cutscene_dungeon_end
{
    with (obj_player)
    {
        state = (0 << 0)
        x = backtohubstartx
        y = backtohubstarty
    }
    global.levelcomplete = 0
    global.dungeoncutscene = 1
    quick_ini_write_real(get_savefile_ini(), "cutscene", "jingle_dungeon", 1)
    cutscene_end_action()
}

