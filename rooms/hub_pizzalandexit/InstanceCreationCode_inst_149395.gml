dialog[0] = dialog_create("You gotta pay your fee!")
loop = 1
persistent = 0
scene_info = [[function() //gml_Script_anon_gml_RoomCC_hub_pizzalandexit_4_Create_92_gml_RoomCC_hub_pizzalandexit_4_Create
{
    if (!global.exitfeecutscene)
    {
        with (obj_player)
        {
            if ((x > other.x))
            {
                with (other)
                    cutscene_end_action()
            }
        }
    }
    return;
}
], [gml_Script_cutscene_set_player_actor], [gml_Script_cutscene_do_dialog, dialog], [gml_Script_cutscene_waitfor_dialog], [gml_Script_cutscene_set_player_actor], [gml_Script_cutscene_move_player, 322, (x - 200), 8, 12], [gml_Script_cutscene_set_player_normal]]
if ((global.exitfeecutscene == -4))
    global.exitfeecutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "exitfee", 0)
if global.exitfeecutscene
    instance_destroy()
