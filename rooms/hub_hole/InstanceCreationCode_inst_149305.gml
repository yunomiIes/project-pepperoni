if (global.levelcomplete && (!global.graveyardcutscene))
{
    with (obj_player1)
    {
        other.backx = backtohubstartx
        other.backy = backtohubstarty
    }
    scene_info = [[gml_Script_cutscene_graveyard_end], [gml_Script_cutscene_save_game]]
}
else if global.levelcomplete
{
    global.levelcomplete = 0
    scene_info = [[gml_Script_cutscene_save_game]]
}
else
    scene_info = [[gml_Script_cutscene_wait, 20]]
