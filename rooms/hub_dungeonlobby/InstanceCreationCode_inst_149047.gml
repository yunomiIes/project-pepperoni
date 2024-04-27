if ((global.dungeoncutscene == -4))
    global.dungeoncutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "jingle_dungeon", 0)
if (global.levelcomplete && (!global.dungeoncutscene))
{
    global.levelcomplete = 0
    currentroom = room
    scene_info = [[gml_Script_cutscene_entrance_start], [gml_Script_cutscene_waitfor_sprite, 349], [gml_Script_cutscene_player_idleanim], [gml_Script_cutscene_change_room, 639], [gml_Script_cutscene_set_player_visible, 0], [gml_Script_cutscene_player_float, 1], [gml_Script_cutscene_set_player_pos, 1696, 1600], [gml_Script_cutscene_wait, 40], [gml_Script_cutscene_dungeon_middle], [gml_Script_cutscene_wait, 200], [gml_Script_cutscene_change_room, currentroom], [gml_Script_cutscene_player_float, 0], [gml_Script_cutscene_set_player_visible, 1], [gml_Script_cutscene_dungeon_end], [gml_Script_cutscene_save_game]]
}
else if global.levelcomplete
{
    global.levelcomplete = 0
    scene_info = [[gml_Script_cutscene_save_game]]
}
else
    scene_info = [[gml_Script_cutscene_wait, 20]]
