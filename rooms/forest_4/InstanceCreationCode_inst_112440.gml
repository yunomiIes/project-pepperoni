if ((!global.pizzadelivery) && (global.pizzasdelivered < 5) && (global.panic == 0))
{
    if (!global.failcutscene)
    {
        if ((global.pizzasdelivered <= 0))
            scene_info = [[cutscene_set_sprite, 822, 2317, 0.35, -1], [cutscene_gustavo_start], [cutscene_wait, 30], [cutscene_set_sprite, 822, 2246, 0.35, -1], [cutscene_wait, 10], [cutscene_move_player, 349, (obj_gustavo.x - 48), 6, 16], [cutscene_set_sprite, 349, 2297, 0.35, 1], [cutscene_set_sprite, 822, 2309, 0.35, -1], [cutscene_gustavo_end]]
        else
            scene_info = [[cutscene_set_sprite, 822, 2308, 0.35, -1]]
    }
    else
        scene_info = [[cutscene_gustavofail_start], [cutscene_wait, 20], [cutscene_set_sprite, 822, 2312, 0.35, -1], [cutscene_waitfor_sprite, 822], [cutscene_set_sprite, 822, 2313, 0.35, -1], [cutscene_wait, 50], [cutscene_set_sprite, 822, 2314, 0.35, -1], [cutscene_set_sprite, 349, 2300, 0.35, 1], [cutscene_waitfor_sprite, 822], [cutscene_set_sprite, 822, 2315, 0.35, -1], [cutscene_set_hsp, 822, -12], [cutscene_set_sprite, 349, 2304, 0.35, 1], [cutscene_waitfor_sprite, 349], [cutscene_set_sprite, 349, 2305, 0.35, 1], [cutscene_check_collision, 822, 349], [cutscene_set_hsp, 822, 0], [cutscene_gustavofail_end, 100], [cutscene_move_actor, 822, obj_gustavo.xstart, obj_gustavo.ystart, 0.05], [cutscene_set_sprite, 822, 2308, 0.35, -1]]
}
else
    scene_info = [[cutscene_wait, 2]]
