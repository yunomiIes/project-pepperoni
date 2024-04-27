function scr_player_slipbanan() //gml_Script_scr_player_slipbanan
{
    hsp = (xscale * movespeed)
    if grounded
        movespeed = Approach(movespeed, 0, 0.5)
    if ((floor(image_index) == (image_number - 1)) && (sprite_index != spr_rockethitwall))
        image_speed = 0
    else
        image_speed = 0.35
    if ((sprite_index == spr_slipbanan2))
        scr_player_addslopemomentum(0.25, 0.75)
    if (grounded && (vsp > -1) && (sprite_index != spr_slipbanan2) && (!(place_meeting(x, (y + 1), obj_metalblock))) && (!(place_meeting(x, (y + 1), obj_destructibles))))
    {
        if ((sprite_index == spr_rockethitwall))
        {
            sprite_index = spr_slipbanan2
            image_index = 0
            image_speed = 0.35
            scr_soundeffect(sfx_slipnslideend, 326, 327)
        }
        else
        {
            vsp = -6
            movespeed = Approach(movespeed, 0, 3)
            sprite_index = spr_rockethitwall
            instance_create(x, (y + 43), obj_bangeffect)
            scr_soundeffect(sfx_slipnslide1, 318, 319, 320, 321, 322, 323, 324)
        }
    }
    if ((sprite_index == spr_slipbanan2))
    {
        if ((floor(image_index) == (image_number - 1)) && (abs(hsp) <= 2))
            state = (0 << 0)
    }
    if (scr_solid((x + xscale), y) && (!scr_slope()) && (scr_solid_slope((x + sign(hsp)), y) || place_meeting((x + sign(hsp)), y, obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        if ((sprite_index == spr_slipbanan1))
            movespeed = Approach(movespeed, 0, 3)
        sprite_index = spr_rockethitwall
        instance_create((x + 30), y, obj_bangeffect)
        scr_soundeffect(sfx_slipnslide1, 318, 319, 320, 321, 322, 323, 324)
        xscale *= -1
        scr_sleep(1)
    }
    return;
}

