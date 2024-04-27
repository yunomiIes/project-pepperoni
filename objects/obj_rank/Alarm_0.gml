global.levelcomplete = 1
scr_playerreset()
with (obj_player)
{
    targetDoor = "HUB"
    targetRoom = backtohubroom
    room = backtohubroom
    x = backtohubstartx
    y = backtohubstarty
    sprite_index = spr_player_walkfront
    state = (95 << 0)
    image_blend = c_white
}
