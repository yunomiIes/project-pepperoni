if ((global.levelcompletename == "SPACE"))
{
    if (global.levelcomplete && (!global.spacecutscene) && (global.levelcompletename == "SPACE"))
    {
        currentroom = room
        scene_info = [[gml_Script_cutscene_entrance_start], [gml_Script_cutscene_waitfor_sprite, 349], [gml_Script_cutscene_player_idleanim], [gml_Script_cutscene_change_room, 634], [gml_Script_cutscene_set_player_visible, 0], [gml_Script_cutscene_player_float, 1], [gml_Script_cutscene_set_player_pos, 1152, 238], [gml_Script_cutscene_wait, 39], [gml_Script_cutscene_space_middle], [gml_Script_cutscene_wait, 150], [gml_Script_cutscene_change_room, currentroom], [gml_Script_cutscene_player_float, 0], [gml_Script_cutscene_set_player_visible, 1], [gml_Script_cutscene_space_end], [gml_Script_cutscene_save_game]]
    }
    else if global.levelcomplete
    {
        global.levelcomplete = 0
        scene_info = [[gml_Script_cutscene_save_game]]
    }
    else
        scene_info = [[gml_Script_cutscene_wait, 20]]
}
else if (global.levelcomplete && (!global.farmcutscene))
{
    currentroom = room
    scene_info = [[gml_Script_cutscene_entrance_start], [gml_Script_cutscene_waitfor_sprite, 349], [gml_Script_cutscene_player_idleanim], [gml_Script_cutscene_change_room, 646], [gml_Script_cutscene_set_player_visible, 0], [gml_Script_cutscene_player_float, 1], [gml_Script_cutscene_set_player_pos, 966, 274], [gml_Script_cutscene_wait, 10], [gml_Script_cutscene_farm_middle], [gml_Script_cutscene_change_room, 658], [gml_Script_cutscene_player_float, 1], [gml_Script_cutscene_set_player_pos, 555, 370], [gml_Script_cutscene_wait, 10], [gml_Script_cutscene_farm_middle], [gml_Script_cutscene_change_room, currentroom], [gml_Script_cutscene_player_float, 0], [gml_Script_cutscene_set_player_visible, 1], [gml_Script_cutscene_farm_end], [gml_Script_cutscene_save_game]]
}
else if global.levelcomplete
{
    global.levelcomplete = 0
    scene_info = [[gml_Script_cutscene_save_game]]
}
else
    scene_info = [[gml_Script_cutscene_wait, 20]]
