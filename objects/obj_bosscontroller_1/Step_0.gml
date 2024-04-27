switch state
{
    case (144 << 0):
        scr_bosscontroller_intro()
        break
    case (0 << 0):
        scr_bosscontroller_normal()
        break
    case (98 << 0):
        scr_bosscontroller_victory()
        break
}

if (!round_timer_init)
{
    round_timer = round_timermax
    round_timer_init = true
}
player_index += 0.35
boss_index += 0.35
player_index = wrap(player_index, 0, sprite_get_number(spr_bossfight_playerhp))
boss_index = wrap(boss_index, 0, sprite_get_number(boss_hpsprite))
if ((room == boss_vigilante))
{
    if (instance_exists(obj_vigilanteboss) && (obj_vigilanteboss.state == (276 << 0)))
        image_alpha = 0
    else
        image_alpha = Approach(image_alpha, 1, 0.1)
}
