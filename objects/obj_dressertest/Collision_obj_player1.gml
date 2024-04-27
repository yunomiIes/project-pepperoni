with (other)
{
    if key_up2
    {
        if ((character == "P"))
        {
            character = "PZ"
            scr_characterspr()
            with (instance_create(x, y, obj_sausageman_dead))
            {
                hsp = irandom_range(-5, 5)
                vsp = (-(irandom_range(6, 11)))
                sprite_index = spr_player_deathend
            }
        }
        else if ((character == "PZ"))
        {
            character = "PI"
            scr_characterspr()
            with (instance_create(x, y, obj_sausageman_dead))
            {
                hsp = irandom_range(-5, 5)
                vsp = (-(irandom_range(6, 11)))
                sprite_index = spr_pizzelle_hurt
            }
        }
        else if ((character == "PI"))
        {
            character = "S"
            scr_characterspr()
            with (instance_create(x, y, obj_sausageman_dead))
            {
                hsp = irandom_range(-5, 5)
                vsp = (-(irandom_range(6, 11)))
                sprite_index = spr_pizzano_hurt
            }
        }
        else if ((character == "S"))
        {
            character = "V"
            scr_characterspr()
            with (instance_create(x, y, obj_sausageman_dead))
            {
                hsp = irandom_range(-5, 5)
                vsp = (-(irandom_range(6, 11)))
                sprite_index = spr_snick_hurt
            }
        }
        else if ((character == "V"))
        {
            character = "M"
            scr_characterspr()
            with (instance_create(x, y, obj_sausageman_dead))
            {
                hsp = irandom_range(-5, 5)
                vsp = (-(irandom_range(6, 11)))
                sprite_index = spr_playerV_hurt
            }
        }
        else if ((character == "M"))
        {
            character = "B"
            scr_characterspr()
            with (instance_create(x, y, obj_sausageman_dead))
            {
                hsp = irandom_range(-5, 5)
                vsp = (-(irandom_range(6, 11)))
                sprite_index = spr_pepperman_hurtplayer
            }
        }
        else if ((character == "B"))
        {
            character = "NTV"
            scr_characterspr()
            with (instance_create(x, y, obj_sausageman_dead))
            {
                hsp = irandom_range(-5, 5)
                vsp = (-(irandom_range(6, 11)))
                sprite_index = spr_player_hurt
            }
        }
    }
}
