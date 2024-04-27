use_static = 1
static_index = (sprite_get_number(spr_tvstatic) - 1)
static_dir = -1
scr_soundeffect(sfx_tvswitchback)
with (playerid)
{
    if (!isgustavo)
        state = (0 << 0)
    else
        state = (191 << 0)
    visible = true
    x = roomstartx
    y = roomstarty
    landAnim = 0
}
with (obj_ghostfollow)
{
    x = xstart
    y = ystart
}
