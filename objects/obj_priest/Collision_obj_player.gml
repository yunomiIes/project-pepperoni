var _transfo = 0
with (other)
{
    if (!scr_transformationcheck())
    {
        if ((state == (11 << 0)) || (state == (12 << 0)) || (state == (14 << 0)) || (state == (16 << 0)) || (state == (33 << 0)) || (state == (35 << 0)) || (state == (34 << 0)))
        {
            if ((hsp != 0))
                xscale = sign(hsp)
            movespeed = abs(hsp)
        }
        if ((state == (16 << 0)))
            create_debris((x + random_range(0, 64)), (y + random_range(0, 64)), 4097, 0)
        state = (0 << 0)
        dir = xscale
        _transfo = 1
        create_particle(x, y, (9 << 0))
    }
}
if _transfo
{
    var p = other.id
    with (instance_create((other.x - 540), (camera_get_view_y(view_camera[0]) - 100), obj_priestangel))
    {
        priestID = other.id
        playerid = p
    }
    if ((sprite_index != spr_angelpriest))
        sprite_index = spr_priest_pray
    scr_soundeffect(sfx_pray)
    with (obj_player)
    {
        ghostpepper = 0
        ghostdash = 0
    }
    if (collect && (ds_list_find_index(global.saveroom, id) == -1))
    {
        ds_list_add(global.saveroom, id)
        var val = 500
        global.collect += val
        global.combotime = 60
        with (instance_create((x + 16), y, obj_smallnumber))
            number = string(val)
        scr_soundeffect(sfx_collecttopping)
        for (var i = 0; i < val; i += round((val / 16)))
            create_collect((other.x + irandom_range(-60, 60)), (other.y + irandom_range(-60, 60)), choose(1597, 1599, 1600, 1602, 1598))
    }
}
