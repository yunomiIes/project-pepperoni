if ((ds_list_find_index(global.saveroom, id) == -1))
{
    if bird
        instance_create((x + 32), (y + 32), obj_burd)
    repeat (6)
        create_debris((x + 32), (y + 32), 2589)
    instance_create((x + 32), (y + 32), obj_parryeffect)
    var val = 10
    if ((other.object_index == obj_player1))
        global.collect += val
    else
        global.collectN += val
    with (instance_create((x + 16), y, obj_smallnumber))
        number = string(val)
    global.heattime += 10
    global.heattime = clamp(global.heattime, 0, 60)
    global.combotime += 10
    global.combotime = clamp(global.combotime, 0, 60)
    if (!audio_is_playing(sfx_icebreakbig))
        scr_soundeffect(sfx_icebreak1, 427, 428)
    ds_list_add(global.saveroom, id)
}
scr_destroy_tiles(32, "Tiles_1")
scr_destroy_tiles(32, "Tiles_2")
scr_destroy_tiles(32, "Tiles_3")
