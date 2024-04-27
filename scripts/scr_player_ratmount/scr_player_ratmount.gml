function scr_player_ratmount() //gml_Script_scr_player_ratmount
{
    move = (key_left + key_right)
    doublejump = 0
    if ((ratgrabbedID != noone) && (!instance_exists(ratgrabbedID)))
        ratgrabbedID = noone
    hsp = movespeed
    if key_jump
        input_buffer_jump = 0
    if ((place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || ((abs(movespeed) < 8) && (move != xscale)) || (!key_attack) || (abs(movespeed) <= 6))
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
                    sprite_index = spr_lonegustavo_bump
                image_index = 0
                instance_create((x + (xscale * 15)), (y + 10), obj_bumpeffect)
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
    if ((ratmount_movespeed >= 12) && (gustavodash != 51))
    {
        instance_create(x, y, obj_jumpdust)
        gustavodash = 51
    }
    if ((ratmount_movespeed >= 12))
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
    if ((sprite_index != spr_player_ratmountmach3) && (sprite_index != spr_lonegustavo_mach3))
    {
        if instance_exists(chargeeffectid)
            instance_destroy(obj_chargeeffect)
    }
    if ((move != xscale) && (move != 0) && (sprite_index != spr_lonegustavo_kick))
    {
        xscale = move
        if ((abs(movespeed) > 2) && (abs(hsp) > 2) && grounded)
        {
            scr_soundeffect(sfx_slideground)
            state = (204 << 0)
            movespeed = abs(movespeed)
        }
    }
    if ((move != 0))
    {
        if ((move == xscale))
            movespeed = Approach(movespeed, (xscale * ratmount_movespeed), 0.5)
        else
            movespeed = Approach(movespeed, 0, 0.5)
    }
    else
        movespeed = Approach(movespeed, 0, 0.5)
    if ((abs(movespeed) > 2))
        image_speed = (abs(movespeed) / 12)
    else
        image_speed = 0.35
    if ((sprite_index == spr_player_ratmountmach3) || (sprite_index == spr_lonegustavo_mach3))
        image_speed = 0.4
    var front = (scr_solid((x + sign(hsp)), y) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    if brick
    {
        if (!landAnim)
        {
            if ((hsp != 0) && (!front))
            {
                if ((ratmount_movespeed >= 12))
                    sprite_index = spr_player_ratmountmach3
                else if key_attack
                    sprite_index = spr_player_ratmountattack
                else
                    sprite_index = spr_player_ratmountmove
            }
            else
            {
                image_speed = 0.35
                if ((sprite_index != spr_player_ratmountidleanim))
                {
                    sprite_index = spr_player_ratmountidle
                    if ((ratgrabbedID == noone))
                    {
                        if ((idle < 400))
                            idle++
                        if ((idle >= 150))
                        {
                            sprite_index = spr_player_ratmountidleanim
                            image_index = 0
                            if ((irandom(100) <= 35))
                                scr_soundeffect(sfx_Voice02, 218, 221)
                        }
                    }
                }
                else if ((floor(image_index) == (image_number - 1)))
                {
                    idle = 0
                    sprite_index = spr_player_ratmountidle
                }
            }
        }
        if ((floor(image_index) == (image_number - 1)))
        {
            landAnim = 0
            if ((sprite_index == spr_player_ratmountland))
                sprite_index = spr_player_ratmountidle
        }
        if ((sprite_index == spr_player_ratmountland))
            image_speed = 0.35
    }
    else
    {
        if ((hsp != 0) && (!front))
        {
            if ((ratmount_movespeed >= 12))
                sprite_index = spr_lonegustavo_mach3
            else if key_attack
                sprite_index = spr_lonegustavo_dash
            else
                sprite_index = spr_lonegustavo_walk
        }
        else
            sprite_index = spr_lonegustavo_idle
        image_speed = 0.35
    }
    if ((hsp != 0) && grounded && (vsp > 0) && (!front))
    {
        if ((steppybuffer > 0))
            steppybuffer--
        else
        {
            create_particle(x, (y + 43), (1 << 0), 0)
            steppybuffer = 18
            if ((sprite_index != spr_player_ratmountattack) && (!brick))
                scr_soundeffect(sfx_step)
        }
    }
    if ((input_buffer_jump < 8) && grounded && (sprite_index != spr_player_ratmountswallow))
    {
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
        scr_soundeffect(sfx_jump)
        if brick
        {
            if ((movespeed >= 12) && key_attack)
                sprite_index = spr_player_ratmountdashjump
            else
                sprite_index = spr_player_ratmountjump
        }
        else if ((ratmount_movespeed >= 12) && key_attack)
            sprite_index = spr_lonegustavo_dashjump
        else
            sprite_index = spr_player_ratmountgroundpound
        image_index = 0
        jumpAnim = 1
        state = (192 << 0)
        vsp = -11
        jumpstop = 0
    }
    if ((!grounded) && (sprite_index != spr_player_ratmountswallow))
    {
        state = (192 << 0)
        jumpAnim = 0
        if ((ratmount_movespeed >= 12))
        {
            if brick
                sprite_index = spr_player_ratmountdashjump
            else
                sprite_index = spr_lonegustavo_dashjump
        }
        else if brick
            sprite_index = spr_player_ratmountfall
        else
            sprite_index = spr_player_ratmountgroundpoundfall
    }
    if (key_attack && grounded && (!(place_meeting((x + xscale), y, obj_solid))))
    {
        move = xscale
        if ((ratmount_movespeed < 12))
            ratmount_movespeed = Approach(ratmount_movespeed, 12, 0.15)
    }
    if (((key_slap2 && key_up) || key_shoot2) && brick)
    {
        ratmount_kickbrick()
        if ((state == (204 << 0)))
        {
            movespeed = (-movespeed)
            hsp = movespeed
        }
    }
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
        ratmountpunchtimer = 25
        state = (259 << 0)
        image_index = 0
        if ((move != 0))
            xscale = move
        movespeed = (xscale * 12)
        sprite_index = spr_lonegustavo_punch
    }
    if ((!instance_exists(dashcloudid)) && grounded && (ratmount_movespeed >= 12))
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    if ((key_down && grounded && (vsp > 0)) || scr_solid(x, y))
    {
        state = (260 << 0)
        if ((brick == 1))
        {
            with (instance_create(x, y, obj_brickcomeback))
                wait = 1
        }
        brick = 0
    }
    if ((brickcomebackbuffer > 0))
        brickcomebackbuffer--
    if ((!brick) && (brickcomebackbuffer == 0) && (!instance_exists(obj_brickcomeback)) && (!instance_exists(obj_brickball)))
        instance_create(x, y, obj_brickcomeback)
    with (ratgrabbedID)
        scr_enemy_ratgrabbed()
    ratmount_shootpowerup()
    ratmount_dotaunt()
    return;
}

function ratmount_dotaunt() //gml_Script_ratmount_dotaunt
{
    if (key_taunt2 && (state != (84 << 0)) && brick)
    {
        scr_soundeffect(sfx_taunt)
        tauntstoredisgustavo = 1
        taunttimer = 20
        tauntstoredmovespeed = movespeed
        tauntstoredsprite = sprite_index
        tauntstoredstate = state
        tauntstoredvsp = vsp
        state = (84 << 0)
        sprite_index = spr_player_ratmounttaunt
        with (instance_create(x, y, obj_taunteffect))
            player = other.id
    }
    return;
}

function ratmount_kickbrick() //gml_Script_ratmount_kickbrick
{
    var _pad = 32
    scr_soundeffect(sfx_killingblow)
    with (instance_create((x + (image_xscale * _pad)), y, obj_brickball))
    {
        if ((other.state == (192 << 0)) || (other.state == (198 << 0)))
            up = 1
        image_xscale = other.xscale
        xoffset = _pad
    }
    state = (197 << 0)
    sprite_index = spr_lonegustavo_kick
    image_index = 0
    image_speed = 0.35
    gustavokicktimer = 5
    brick = 0
    return;
}

function ratmount_shootpowerup() //gml_Script_ratmount_shootpowerup
{
    if (key_shoot2 && (ratpowerup != -4) && (ratshootbuffer <= 0))
    {
        switch ratpowerup
        {
            case 445:
                with (instance_create((x + (20 * xscale)), y, obj_playernoisearrow))
                    direction = point_direction(x, y, (x + (other.xscale * 4)), y)
                break
            case 222:
                with (instance_create((x + (20 * xscale)), (y + 20), obj_playersmokehitbox))
                {
                    spd += (other.movespeed / 2)
                    image_xscale = other.xscale
                }
                break
            case 460:
                with (instance_create((x + (20 * xscale)), y, obj_playerspikecheese))
                {
                    spd += other.movespeed
                    image_xscale = other.xscale
                }
                break
        }

        ratshootbuffer = 30
    }
    return;
}

