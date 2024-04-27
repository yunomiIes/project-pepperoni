if active
{
    with (obj_player)
    {
        state = (146 << 0)
        hsp = 0
        vsp = 0
        visible = false
    }
}
if ((floor(image_index) == (image_number - 1)))
{
    switch sprite_index
    {
        case spr_pizzaportal_appear:
            sprite_index = spr_pizzaportalentrancestart
            if global.checkpoints
            {
                scr_checkpointstufftosave()
                scr_soundeffect(sfx_Checkpoint)
            }
            scr_soundeffect(sfx_lapexit)
            break
        case spr_pizzaportalentrancestart:
            sprite_index = spr_pizzaportal_disappear
            with (obj_player)
            {
                state = (0 << 0)
                visible = true
            }
            active = 0
            break
        case spr_pizzaportal_disappear:
            instance_create_unique(0, 0, 1)
            if ((global.laps >= 4))
            {
                if ((obj_player1.character != "PZ") && (obj_player1.character != "PI"))
                {
                    if (!global.elmlapping)
                    {
                        if (!instance_exists(obj_ghostfollow))
                        {
                            with (instance_create((x + (room_width / 2)), (y + -10), obj_ghostfollow))
                                lap5 = 1
                        }
                    }
                    else if (!instance_exists(obj_lapghost))
                        instance_create((x + (room_width / 2)), (y + -10), obj_lapghost)
                }
                else if (!instance_exists(obj_lowface))
                    instance_create(x, y, obj_lowface)
            }
            instance_destroy()
            break
    }

}
