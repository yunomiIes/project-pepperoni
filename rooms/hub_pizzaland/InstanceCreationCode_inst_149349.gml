sprite_index = spr_canongoblin_walk
ag_dialog[0] = [dialog_create("I need a burger if you wanna blow up the factory wall")]
ag_dialog[1] = [dialog_create("Meet me outside the factory wall", -4, function() //gml_Script_anon_gml_RoomCC_hub_pizzaland_4_Create_194_gml_RoomCC_hub_pizzaland_4_Create
{
    global.anarchistcutscene1 = 1
    quick_ini_write_real(get_savefile_ini(), "cutscene", "anarchist1", 1)
    return;
}
)]
dialog_func = function() //gml_Script_anon_gml_RoomCC_hub_pizzaland_4_Create_335_gml_RoomCC_hub_pizzaland_4_Create
{
    if global.burgercutscene
        do_dialog(ag_dialog[1])
    else
        do_dialog(ag_dialog[0])
    return;
}

if ((global.anarchistcutscene1 == -4))
    global.anarchistcutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "anarchist1", 0)
if global.anarchistcutscene1
    instance_destroy()
