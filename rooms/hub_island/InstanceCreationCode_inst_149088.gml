if ((global.levelcompletename == "FOREST"))
{
    if (global.levelcomplete && (!global.forestcutscene))
    {
        currentroom = room
        global.forestcutscene = 1
        scene_info = [[gml_Script_cutscene_entrance_start], [gml_Script_cutscene_waitfor_sprite, 349], [gml_Script_cutscene_player_idleanim], [gml_Script_cutscene_change_room, 631], [gml_Script_cutscene_set_player_visible, 0], [gml_Script_cutscene_player_float, 1], [gml_Script_cutscene_set_player_pos, 836, 434], [gml_Script_cutscene_wait, 150], [gml_Script_cutscene_change_room, currentroom], [gml_Script_cutscene_player_float, 0], [gml_Script_cutscene_set_player_visible, 1], [gml_Script_cutscene_forest_end]]
    }
    else
        scene_info = [[gml_Script_cutscene_wait, 20]]
}
else if (global.levelcomplete && (!global.beachcutscene) && (global.levelcompletename != "FOREST"))
{
    currentroom = room
    peppermanactorID = noone
    boatactorID = noone
    scene_info = [[gml_Script_cutscene_entrance_start], [gml_Script_cutscene_waitfor_sprite, 349], [gml_Script_cutscene_player_idleanim], [gml_Script_cutscene_change_room, 665], [gml_Script_cutscene_set_player_visible, 0], [gml_Script_cutscene_player_float, 1], [gml_Script_cutscene_set_player_pos, 923, 281], [gml_Script_cutscene_wait, 60], [function() //gml_Script_anon_gml_RoomCC_hub_island_4_Create_1020_gml_RoomCC_hub_island_4_Create
    {
        boatactorID = instance_create(632, 32, obj_actor)
        boatactorID.sprite_index = spr_cheeseboat
        boatactorID.vsp = 0
        boatactorID.hsp = 0
        peppermanactorID = instance_create((boatactorID.x + (boatactorID.sprite_width / 2)), (boatactorID.y - 48), obj_actor)
        peppermanactorID.sprite_index = spr_pepperman_idle
        cutscene_end_action()
        return;
    }
], [function() //gml_Script_anon_gml_RoomCC_hub_island_4_Create_1386_gml_RoomCC_hub_island_4_Create
    {
        var _finish = 0
        with (boatactorID)
        {
            y += vsp
            if ((vsp < 20))
                vsp += 0.5
            if ((y > 448))
            {
                y = 448
                vsp = 0
                _finish = 1
            }
        }
        peppermanactorID.y = (boatactorID.y - 48)
        if _finish
            cutscene_end_action()
        return;
    }
], [function() //gml_Script_anon_gml_RoomCC_hub_island_4_Create_1654_gml_RoomCC_hub_island_4_Create
    {
        _finish = 0
        with (boatactorID)
        {
            x += hsp
            hsp += 0.5
            if place_meeting((x + sign(hsp)), y, obj_solid)
            {
                _finish = 1
                hsp = 0
            }
        }
        peppermanactorID.x = (boatactorID.x + (boatactorID.sprite_width / 2))
        if _finish
            cutscene_end_action()
        global.beachcutscene = 1
        return;
    }
], [gml_Script_cutscene_camera_shake, 4, (3 / room_speed)], [gml_Script_cutscene_soundeffect, 57], [gml_Script_cutscene_wait, 60], [gml_Script_cutscene_change_room, currentroom], [gml_Script_cutscene_player_float, 0], [gml_Script_cutscene_set_player_visible, 1], [gml_Script_cutscene_beach_end]]
}
else
    scene_info = [[gml_Script_cutscene_wait, 20]]
