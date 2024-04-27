if ((playerid != noone))
{
    with (playerid)
    {
        hsp = 0
        vsp = 0
    }
    x = playerid.x
    y = (playerid.y - 35)
    if ((playerid.state != (46 << 0)))
        instance_destroy()
}
if (!got)
{
    var num = instance_place_list(x, y, obj_player, global.instancelist, false)
    for (var i = 0; i < num; i++)
    {
        var _player = ds_list_find_value(global.instancelist, i)
        with (_player)
        {
            if ((state != (186 << 0)))
            {
                if grounded
                {
                    hsp = 0
                    vsp = 0
                    state = (46 << 0)
                    scr_soundeffect(sfx_secretfound)
                    with (other)
                    {
                        got = 1
                        if ((got_func != -4))
                            self.got_func()
                        alarm[0] = 150
                        sprite_index = spr_got
                        playerid = other.id
                    }
                }
            }
        }
    }
    ds_list_clear(global.instancelist)
}
