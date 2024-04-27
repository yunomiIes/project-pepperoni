if ((room != rank_room))
{
    instance_destroy(obj_fadeout)
    with (obj_player)
    {
        instance_create(0, 0, obj_pizzaface)
        scr_soundeffect(sfx_pizzafaceLaugh2)
    }
    with (obj_pizzaface)
        sprite_index = spr_coneball_new
    instance_destroy()
}
