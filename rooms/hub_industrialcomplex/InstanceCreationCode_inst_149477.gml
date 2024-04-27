sprite_index = spr_canongoblin_walk
scene_info = [[gml_Script_cutscene_do_dialog, [dialog_create("Lets blow this thing then")]], [gml_Script_cutscene_waitfor_dialog], [gml_Script_cutscene_set_player_actor], [gml_Script_cutscene_wait, 20], [function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_196_gml_RoomCC_hub_industrialcomplex_2_Create
{
    anarchist = 128596
    with (anarchist)
    {
        with (instance_create(x, y, obj_pizzagoblinbomb))
        {
            defused = 1
            state = (0 << 0)
            movespeed = 7
            vsp = -8
        }
    }
    cutscene_end_action()
    return;
}
], [function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_418_gml_RoomCC_hub_industrialcomplex_2_Create
{
    if (!instance_exists(obj_pizzagoblinbomb))
        cutscene_end_action()
    return;
}
], [gml_Script_cutscene_wait, 10], [gml_Script_cutscene_do_dialog, [dialog_create("Let's go fella", -4, function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_590_gml_RoomCC_hub_industrialcomplex_2_Create
{
    global.anarchistcutscene2 = 1
    quick_ini_write_real(get_savefile_ini(), "cutscene", "anarchist2", 1)
    return;
}
)]], [gml_Script_cutscene_waitfor_dialog], [gml_Script_cutscene_set_player_actor], [function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_776_gml_RoomCC_hub_industrialcomplex_2_Create
{
    with (anarchist)
    {
        x += 8
        if ((x >= room_width))
        {
            instance_destroy()
            with (other)
                cutscene_end_action()
        }
    }
    return;
}
], [gml_Script_cutscene_set_player_normal]]
dialog_func = function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_973_gml_RoomCC_hub_industrialcomplex_2_Create
{
    do_dialog_cutscene(scene_info)
    return;
}

if ((global.anarchistcutscene1 == -4))
    global.anarchistcutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "anarchist1", 0)
if (!global.anarchistcutscene1)
    instance_destroy()
if ((global.anarchistcutscene2 == -4))
    global.anarchistcutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "anarchist2", 0)
if global.anarchistcutscene2
    instance_destroy()
