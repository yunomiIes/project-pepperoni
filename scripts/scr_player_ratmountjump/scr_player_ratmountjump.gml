function scr_player_ratmountjump() //gml_Script_scr_player_ratmountjump
{
    move = (key_left + key_right)
    if ((sprite_index == spr_lonegustavo_dashjump))
        image_speed = 0.6
    else
        image_speed = 0.35
    if ((!jumpstop) && (vsp < 0.5) && (!key_jump2))
    {
        vsp /= 10
        jumpstop = 1
    }
    hsp = movespeed
    if ((place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || ((abs(movespeed) < 8) && (move != xscale)) || (abs(movespeed) <= 6))
    {
        gustavodash = 0
        ratmount_movespeed = 8
    }
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (gustavodash != 51))
    {
        movespeed = 0
        if ((ratmount_movespeed >= 12))
        {
            var _bump = ledge_bump(((vsp >= 0) ? 32 : 22))
            if _bump
            {
                scr_soundeffect(sfx_groundpound)
                state = (106 << 0)
                if brick
                    sprite_index = spr_player_ratmountbump
                else
                    sprite_index = spr_playerN_bump
                image_index = 0
                hsp = ((-xscale) * 4)
                vsp = -5
                with (obj_camera)
                {
                    shake_mag = 4
                    shake_mag_acc = (5 / room_speed)
                }
                return;
            }
        }
    }
    if ((move != 0))
    {
        if ((move == xscale))
            movespeed = Approach(movespeed, (xscale * ratmount_movespeed), 0.5)
        else if ((gustavodash == 51))
            movespeed = Approach(movespeed, 0, 0.5)
        else
            movespeed = Approach(movespeed, 0, 0.5)
    }
    else if ((gustavodash == 51))
        movespeed = Approach(movespeed, 0, 0.5)
    else
        movespeed = Approach(movespeed, 0, 0.5)
    if ((move != xscale) && (move != 0))
    {
        ratmount_movespeed = 8
        xscale = move
    }
    if (jumpAnim && (floor(image_index) == (image_number - 1)))
    {
        jumpAnim = 0
        switch sprite_index
        {
            case spr_lonegustavo_jumpstart:
                sprite_index = spr_lonegustavo_jump
                break
            case spr_lonegustavo_dashjump:
                sprite_index = spr_lonegustavo_dashjump
                break
            case spr_player_ratmountgroundpound:
                sprite_index = spr_player_ratmountgroundpoundfall
                break
            case spr_player_ratmountjump:
                sprite_index = spr_player_ratmountfall
                break
            case spr_player_ratmountjump2:
                sprite_index = spr_player_ratmountfall2
                break
            case spr_player_ratmountballoonend2:
                sprite_index = spr_player_ratmountballoonend3
                break
            case spr_player_ratmountmushroombounce:
                jumpAnim = 1
                image_index = (image_number - 1)
                break
            case spr_player_ratmountballoonend1:
                if ((vsp > 0))
                {
                    jumpAnim = 1
                    sprite_index = spr_player_ratmountballoonend2
                }
                else
                    jumpAnim = 1
                break
        }

    }
    if key_down2
    {
        if brick
        {
            with (instance_create(x, y, obj_brickcomeback))
            {
                wait = 1
                instance_create(x, y, obj_genericpoofeffect)
            }
        }
        brick = 0
        movespeed = hsp
        state = (197 << 0)
        image_index = 0
        sprite_index = spr_lonegustavo_groundpoundstart
    }
    if ((key_slap2 && key_up && brick) || (key_shoot2 && brick))
        ratmount_kickbrick()
    if (key_slap2 && (!key_up))
    {
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        if ((brick == 1))
        {
            with (instance_create(x, y, obj_brickcomeback))
                wait = 1
        }
        state = (259 << 0)
        ratmountpunchtimer = 25
        image_index = 0
        if ((move != 0))
            xscale = move
        movespeed = (xscale * 12)
        sprite_index = spr_lonegustavo_punch
    }
    var bounce = 1
    if (key_jump && brick)
    {
        state = (198 << 0)
        instance_create(x, y, obj_highjumpcloud2)
        scr_soundeffect(sfx_jump)
        sprite_index = spr_player_ratmountwalljump
        image_index = 0
        vsp = -16
    }
    if (grounded && (vsp > 0) && (sprite_index != spr_lonegustavo_kick))
    {
        doublejump = 0
        create_particle(x, y, (12 << 0), 0)
        state = (191 << 0)
        landAnim = 1
        jumpstop = 0
        if (brick && (!key_attack))
            sprite_index = spr_player_ratmountland
        else
            landAnim = 0
        image_index = 0
    }
    if ((sprite_index == spr_player_ratmountdashjump))
    {
        if (!instance_exists(chargeeffectid))
        {
            with (instance_create(x, y, obj_chargeeffect))
            {
                playerid = other.object_index
                other.chargeeffectid = id
            }
        }
    }
    with (ratgrabbedID)
        scr_enemy_ratgrabbed()
    ratmount_shootpowerup()
    ratmount_dotaunt()
    return;
}

