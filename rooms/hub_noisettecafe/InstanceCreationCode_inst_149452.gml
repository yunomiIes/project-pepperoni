if ((global.vigilantecutscene3 == -4))
    global.vigilantecutscene3 = quick_ini_read_real(get_savefile_ini(), "cutscene", "vigilante3", 0)
if (!global.vigilantecutscene3)
    instance_destroy()
if ((global.hatcutscene1 == -4))
    global.hatcutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "hat1", 0)
if ((global.hatcutscene2 == -4))
    global.hatcutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "hat2", 0)
if ((global.hatcutscene3 == -4))
    global.hatcutscene3 = quick_ini_read_real(get_savefile_ini(), "cutscene", "hat3", 0)
sprite_index = spr_playerV_idle
v_dialog[0] = [dialog_create("wash my darn hat", -4, function() //gml_Script_anon_gml_RoomCC_hub_noisettecafe_2_Create_623_gml_RoomCC_hub_noisettecafe_2_Create
{
    if ((global.hatcutscene1 == -4) || (!global.hatcutscene1))
    {
        global.hatcutscene1 = 1
        quick_ini_write_real(get_savefile_ini(), "cutscene", "hat1", 1)
    }
    return;
}
)]
v_dialog[1] = [[gml_Script_cutscene_do_dialog, [dialog_create("there you go, a jetpack")]], [function() //gml_Script_anon_gml_RoomCC_hub_noisettecafe_2_Create_886_gml_RoomCC_hub_noisettecafe_2_Create
{
    if (!instance_exists(obj_noisejetpack))
        instance_create(498, 952, obj_noisejetpack)
    return;
}
]]
v_dialog[2] = [dialog_create("you washed my darn hat")]
dialog_func = function() //gml_Script_anon_gml_RoomCC_hub_noisettecafe_2_Create_1068_gml_RoomCC_hub_noisettecafe_2_Create
{
    if ((!global.hatcutscene1) || (!global.hatcutscene3))
        do_dialog(v_dialog[0])
    else if global.hatcutscene3
        do_dialog_cutscene(v_dialog[1])
    return;
}

