if ((!global.pizzadelivery) && (global.pizzasdelivered < 5) && (global.panic == 0))
{
    if (!global.failcutscene)
    {
        if ((global.pizzasdelivered <= 0))
            scene_info = [[gml_Script_cutscene_set_sprite, 822, 2317, 0.35, -1], [gml_Script_cutscene_gustavo_start], [gml_Script_cutscene_wait, 30], [gml_Script_cutscene_set_sprite, 822, 2246, 0.35, -1], [gml_Script_cutscene_wait, 10], [gml_Script_cutscene_move_player, 349, (obj_gustavo.x - 48), 6, 16], [gml_Script_cutscene_set_sprite, 349, 2297, 0.35, 1], [gml_Script_cutscene_set_sprite, 822, 2309, 0.35, -1], [gml_Script_cutscene_gustavo_end]]
        else
            scene_info = [[gml_Script_cutscene_set_sprite, 822, 2308, 0.35, -1]]
    }
    else
        scene_info = [[gml_Script_cutscene_gustavofail_start], [gml_Script_cutscene_wait, 20], [gml_Script_cutscene_set_sprite, 822, 2312, 0.35, -1], [gml_Script_cutscene_waitfor_sprite, 822], [gml_Script_cutscene_set_sprite, 822, 2313, 0.35, -1], [gml_Script_cutscene_wait, 50], [gml_Script_cutscene_set_sprite, 822, 2314, 0.35, -1], [gml_Script_cutscene_set_sprite, 349, 2300, 0.35, 1], [gml_Script_cutscene_waitfor_sprite, 822], [gml_Script_cutscene_set_sprite, 822, 2315, 0.35, -1], [gml_Script_cutscene_set_hsp, 822, -12], [gml_Script_cutscene_set_sprite, 349, 2304, 0.35, 1], [gml_Script_cutscene_waitfor_sprite, 349], [gml_Script_cutscene_set_sprite, 349, 2305, 0.35, 1], [gml_Script_cutscene_check_collision, 822, 349], [gml_Script_cutscene_set_hsp, 822, 0], [gml_Script_cutscene_gustavofail_end, 100], [gml_Script_cutscene_move_actor, 822, obj_gustavo.xstart, obj_gustavo.ystart, 0.05], [gml_Script_cutscene_set_sprite, 822, 2308, 0.35, -1]]
}
else
    scene_info = [[gml_Script_cutscene_wait, 2]]
