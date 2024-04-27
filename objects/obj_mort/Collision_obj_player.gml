if ((sprite_index != spr_mortspawn) && (sprite_index != spr_mortfall))
{
    with (other)
    {
        if ((state != (11 << 0)) && (state != (12 << 0)) && (state != (13 << 0)) && (state != (14 << 0)) && (state != (190 << 0)))
        {
            repeat (6)
                create_debris(x, y, 1178)
            mort = 1
            scr_soundeffect(sfx_mortpickup1)
            scr_soundeffect(sfx_Transfo)
            instance_create_unique(x, y, 40)
            movespeed = hsp
            state = (11 << 0)
            instance_destroy(-2)
        }
    }
}
