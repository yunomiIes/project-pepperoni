if (global.levelcomplete && (!global.desertcutscene))
{
    currentroom = room
    global.desertcutscene = 1
    scene_info = [[gml_Script_cutscene_entrance_start], [gml_Script_cutscene_waitfor_sprite, 349], [gml_Script_cutscene_player_idleanim], [gml_Script_cutscene_change_room, 642], [gml_Script_cutscene_set_player_visible, 0], [gml_Script_cutscene_set_player_pos, 1152, 384], [gml_Script_cutscene_wait, 100], [gml_Script_cutscene_entrance_middle], [gml_Script_cutscene_wait, 100], [gml_Script_cutscene_change_room, currentroom], [gml_Script_cutscene_set_player_visible, 1], [gml_Script_cutscene_desert_end], [gml_Script_cutscene_save_game]]
}
else if global.levelcomplete
{
    global.levelcomplete = 0
    scene_info = [[gml_Script_cutscene_save_game]]
}
else
    scene_info = [[gml_Script_cutscene_wait, 20]]
