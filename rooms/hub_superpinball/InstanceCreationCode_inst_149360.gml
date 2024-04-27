sprite_index = spr_ufogrounded_walk
dialog[0] = dialog_create("Go ahead!", -4, function() //gml_Script_anon_gml_RoomCC_hub_superpinball_3_Create_79_gml_RoomCC_hub_superpinball_3_Create
{
    if ((global.superpinballcutscene == -4) || (!global.superpinballcutscene))
    {
        global.superpinballcutscene = 1
        quick_ini_write_real(get_savefile_ini(), "cutscene", "superpinball", 1)
        with (obj_door)
            locked = 0
    }
    return;
}
)
