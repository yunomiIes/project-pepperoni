function scr_player_breakdanceC() //gml_Script_scr_player_breakdanceC
{
    hsp = (xscale * movespeed)
    move = (key_left + key_right)
    jumpstop = 0
    if ((movespeed > 0) && (sprite_index == spr_breakdance) && grounded)
        movespeed -= 0.5
    if (place_meeting((x + xscale), y, obj_solid) && ((sprite_index == spr_player_breakdancestart) || (sprite_index == spr_breakdance)))
        movespeed = 0
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_player_breakdancestart))
        sprite_index = spr_breakdance
    if (key_shoot2 && (sprite_index == spr_breakdance))
    {
        image_index = 0
        sprite_index = spr_player_buttattackstart
        movespeed = 16
        vsp = -3
        if (!instance_exists(crazyruneffectid))
        {
            with (instance_create(x, y, obj_crazyrunothereffect))
            {
                playerid = other.object_index
                other.crazyruneffectid = id
            }
        }
    }
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_player_buttattackstart))
        sprite_index = spr_player_buttattack
    if (grounded && (sprite_index == spr_player_buttattack))
        sprite_index = spr_player_buttattackend
    if ((sprite_index == spr_player_buttattackend))
        movespeed -= 0.45
    if ((sprite_index == spr_player_buttattack))
    {
        if key_attack
        {
            movespeed = 17
            sprite_index = spr_mach4
            state = (121 << 0)
        }
    }
    if ((breakdance > 0))
        breakdance--
    landAnim = 0
    if ((movespeed <= 0) && ((sprite_index == spr_player_breakdancesuper) || (sprite_index == spr_player_buttattackend)))
        state = (0 << 0)
    if ((breakdance <= 0) && (sprite_index == spr_breakdance))
        state = (0 << 0)
    if ((sprite_index == spr_player_buttattack) || (sprite_index == spr_player_buttattackstart) || (sprite_index == spr_player_buttattackend))
    {
        if (scr_solid((x + 1), y) && (xscale == 1) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
        {
            grav = 0.5
            movespeed = 0
            state = (106 << 0)
            hsp = -2.5
            vsp = -3
            mach2 = 0
            image_index = 0
            machslideAnim = 1
            machhitAnim = 0
            instance_create((x + 10), (y + 10), obj_bumpeffect)
        }
        if (scr_solid((x - 1), y) && (xscale == -1) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
        {
            grav = 0.5
            movespeed = 0
            state = (106 << 0)
            hsp = 2.5
            vsp = -3
            mach2 = 0
            image_index = 0
            machslideAnim = 1
            machhitAnim = 0
            instance_create((x - 10), (y + 10), obj_bumpeffect)
        }
    }
    if ((breakdance_afterimage > 0))
        breakdance_afterimage--
    else
    {
        breakdance_afterimage = 5
        create_blue_afterimage(x, y, sprite_index, image_index, xscale)
    }
    if ((movespeed <= 0))
        image_speed = 0.4
    else
        image_speed = (abs(movespeed) / 20)
    return;
}

