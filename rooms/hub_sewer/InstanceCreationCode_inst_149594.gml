if (global.levelcomplete && (!global.sewercutscene))
{
    currentroom = room
    scene_info = [[gml_Script_cutscene_entrance_start], [gml_Script_cutscene_waitfor_sprite, 349], [gml_Script_cutscene_player_idleanim], [gml_Script_cutscene_change_room, 653], [gml_Script_cutscene_set_player_visible, 0], [gml_Script_cutscene_player_float, 1], [gml_Script_cutscene_set_player_pos, 320, 288], [gml_Script_cutscene_wait, 39], [function() //gml_Script_anon_gml_RoomCC_hub_sewer_3_Create_347_gml_RoomCC_hub_sewer_3_Create
    {
        with (obj_hubwater)
        {
            y++
            if ((y > (ystart + 32)))
            {
                with (other)
                    cutscene_end_action()
            }
        }
        return;
    }
], [gml_Script_cutscene_wait, 150], [gml_Script_cutscene_change_room, currentroom], [gml_Script_cutscene_player_float, 0], [gml_Script_cutscene_set_player_visible, 1], [gml_Script_cutscene_sewer_end], [gml_Script_cutscene_save_game]]
}
else if global.levelcomplete
{
    global.levelcomplete = 0
    scene_info = [[gml_Script_cutscene_save_game]]
}
else
    scene_info = [[gml_Script_cutscene_wait, 20]]
