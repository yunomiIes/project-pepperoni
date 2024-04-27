if ((ds_list_find_index(global.saveroom, id) == -1))
{
    if ((sprite_index == spr_bigbeer))
    {
        repeat (6)
            create_debris((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), 4082)
    }
    else
    {
        repeat (3)
            create_debris((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), 4082)
    }
    scr_soundeffect(sfx_beerbreak)
    global.heattime += 10
    global.heattime = clamp(global.heattime, 0, 60)
    global.combotime += 10
    global.combotime = clamp(global.combotime, 0, 60)
    var val = 10
    global.collect += val
    create_collect(x, y, 4080, val)
    with (instance_create((x + 16), y, obj_smallnumber))
        number = string(val)
    ds_list_add(global.saveroom, id)
}
