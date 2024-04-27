function scr_player_ratmountbounce() //scr_player_ratmountbounce
{
    if ((character == "NTV"))
    {
        isgustavo = 0
        scr_player_crusherpound()
        return;
    }
    if ((sprite_index == spr_player_ratmountwalljump) && (vsp > 0))
    {
        vsp += 0.5
        image_speed = (abs(vsp) / 10)
        if (!instance_exists(superslameffectid))
        {
            with (instance_create(x, y, obj_superslameffect))
            {
                playerid = other.object_index
                other.superslameffectid = id
            }
        }
    }
    else
        image_speed = 0.35
    if ((sprite_index == spr_player_ratmountwalljump) && (vsp < 0))
    {
        if instance_exists(superslameffectid)
            instance_destroy(obj_superslameffect)
    }
    if ((sprite_index == spr_player_ratmountbounce))
    {
        move = (key_left + key_right)
        hsp = movespeed
        movespeed = Approach(movespeed, 0, 1)
        if ((floor(image_index) == (image_number - 1)))
        {
            if ((hsp != 0))
                xscale = sign(hsp)
            state = (191 << 0)
        }
    }
    else
    {
        hsp = movespeed
        move = (key_left + key_right)
        if ((move != 0))
            movespeed = Approach(movespeed, (move * 8), 0.5)
        else
            movespeed = Approach(movespeed, 0, 0.5)
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
            brick = 0
            state = (259 << 0)
            ratmountpunchtimer = 25
            image_index = 0
            if ((move != 0))
                xscale = move
            movespeed = (xscale * 12)
            sprite_index = spr_lonegustavo_punch
        }
        ratmount_fallingspeed += 0.5
        if key_jump
            input_buffer_jump = 0
        if (brick && scr_solid((x + sign(hsp)), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)))
        {
            if ((move != 0) && (move == sign(hsp)) && key_jump2)
            {
                state = (195 << 0)
                sticktime = 15
                xscale = sign(hsp)
                landAnim = 0
            }
        }
        if (grounded && (vsp > 0) && (!(place_meeting(x, (y + vsp), obj_destructibles))) && (!(place_meeting(x, (y + 15), obj_destructibles))) && (!(place_meeting(x, (y + 15), obj_metalblock))) && (!(place_meeting(x, (y + 15), obj_grindrail))) && brick)
        {
            with (instance_create((x - 10), y, obj_parryeffect))
            {
                sprite_index = spr_ratdust
                hspeed = -5
            }
            with (instance_create((x + 10), y, obj_parryeffect))
            {
                image_xscale = -1
                sprite_index = spr_ratdust
                hspeed = 5
            }
            with (obj_baddie)
            {
                if (shakestun && grounded && point_in_camera(x, y, view_camera[0]) && grounded && (vsp > 0) && (!invincible) && groundpound)
                {
                    state = (138 << 0)
                    if ((stunned < 60))
                        stunned = 60
                    vsp = -11
                    image_xscale *= -1
                    hsp = 0
                    momentum = 0
                }
            }
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            scr_soundeffect(sfx_groundpound)
            sprite_index = spr_player_ratmountbounce
            image_index = 0
        }
    }
    ratmount_dotaunt()
    return;
}

