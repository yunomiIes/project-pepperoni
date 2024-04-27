if ((ds_list_find_index(global.baddieroom, id) == -1))
{
    ds_list_add(global.saveroom, other.id)
    scr_soundeffect(sfx_killenemy)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = other.spr_dead
    instance_create(obj_player1.x, obj_player1.y, obj_lemonface)
}
