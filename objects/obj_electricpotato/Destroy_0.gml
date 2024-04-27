if ((ds_list_find_index(global.baddieroom, id) == -1))
{
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = other.spr_dead
    instance_create(x, y, obj_bangeffect)
    ds_list_add(global.baddieroom, id)
    scr_soundeffect(sfx_killenemy)
    global.combo += 1
    global.combotime = 60
    global.collect += 10
    repeat (3)
    {
        with (create_debris(x, y, 1170))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
        }
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = (3 / room_speed)
        }
        if escape
            ds_list_add(global.escaperoom, id)
    }
}
