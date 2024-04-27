function scr_player_mortattack() //gml_Script_scr_player_mortattack
{
    image_speed = 0.45
    hsp = movespeed
    if ((character == "NTV"))
    {
        if (instance_exists(mortprojectileID) && instance_exists(mortprojectileID.target) && (mortprojectileID.target.object_index == obj_morthook))
        {
            targethsp = Approach(targethsp, 0, 0.8)
            targetvsp = Approach(targetvsp, 0, 0.8)
            hsp = targethsp
            vsp = targetvsp
        }
        else
        {
            vsp -= 0.2
            move = (key_left + key_right)
            if ((move != 0))
                movespeed = Approach(movespeed, (move * 4), 0.1)
        }
        if ((floor(image_index) == (image_number - 1)))
            image_index = (image_number - 1)
    }
    if (((character != "NTV") && (floor(image_index) == (image_number - 1))) || ((character == "NTV") && (!instance_exists(mortprojectileID))))
    {
        if (grounded && (vsp > 0))
        {
            state = (11 << 0)
            sprite_index = spr_player_mortidle
            landAnim = 0
        }
        else
        {
            state = (12 << 0)
            sprite_index = spr_player_mortjump
        }
    }
    if ((punch_afterimage > 0))
        punch_afterimage--
    else
    {
        punch_afterimage = 5
        create_blur_afterimage(x, y, sprite_index, image_index, xscale)
    }
    return;
}

