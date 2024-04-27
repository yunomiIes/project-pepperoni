if (!touched)
{
    var xx = obj_player1.x
    var yy = obj_player1.y
    var ixs = obj_player1.xscale
    var v = obj_player1.vsp
    var msk = obj_player1.mask_index
    ds_queue_enqueue(followqueue, [xx, yy, ixs, v, msk])
    if ((ds_queue_size(followqueue) > LAG_STEPS))
    {
        var b = ds_queue_dequeue(followqueue)
        if ((state != (99 << 0)) && (state != (97 << 0)) && (state != (123 << 0)) && (state != (99 << 0)) && (state != (270 << 0)) && (state != (272 << 0)))
        {
            x = b[0]
            y = b[1]
            image_xscale = b[2]
            vsp = b[3]
        }
        mask_index = b[4]
    }
    image_speed = 0.35
    switch state
    {
        case (0 << 0):
            if ((sprite_index != spr_player_land))
            {
                if ((x != xprevious))
                    sprite_index = spr_player_move
                else
                    sprite_index = spr_player_idle
            }
            else if ((floor(image_index) == (image_number - 1)))
                sprite_index = spr_player_idle
            if ((sprite_index == spr_player_move))
            {
                if ((!steppy) && ((floor(image_index) == 2) || (floor(image_index) == 7)))
                {
                    steppy = 1
                    create_particle(x, (y + 38), (1 << 0), 0)
                }
                if (steppy && (floor(image_index) != 2) && (floor(image_index) != 7))
                    steppy = 0
            }
            if ((distance_to_object(obj_player1) <= 125) && (obj_player1.state == (0 << 0)))
            {
                scr_soundeffect(sfx_fakepepgrab)
                image_index = 0
                sprite_index = spr_player_suplexdash
                state = (42 << 0)
                movespeed = 16
            }
            if (!grounded)
            {
                state = (92 << 0)
                if ((vsp < 0))
                {
                    with (instance_create(x, y, obj_highjumpcloud1))
                    {
                        if scr_solid(x, (y + 64))
                        {
                            while (!(scr_solid(x, (y + 1))))
                                y++
                        }
                    }
                    sprite_index = spr_player_jump
                    image_index = 0
                }
                else
                {
                    sprite_index = spr_player_fall
                    image_index = 0
                }
            }
            if ((obj_player.state == (42 << 0)) && obj_player.key_slap2 && (!obj_player.key_up) && (sprite_index != spr_player_suplexdash))
            {
                scr_soundeffect(sfx_fakepepgrab)
                image_index = 0
                sprite_index = spr_player_suplexdash
                state = (42 << 0)
                movespeed = 14
            }
            if (obj_player.key_taunt2 && (taunttimer == 0) && (sprite_index != spr_player_taunt))
            {
                state = (272 << 0)
                taunttimer = 20
                image_index = random_range(0, 10)
                sprite_index = spr_player_taunt
                scr_soundeffect(sfx_fakepeptaunt)
                instance_create(x, y, obj_baddietaunteffect)
            }
            if ((distance_to_object(obj_player1) <= 245) && (obj_player1.state == (99 << 0)))
            {
                state = (99 << 0)
                image_index = 1
                sprite_index = spr_player_superjumpprep
                scr_soundeffect(sfx_superjumpprep)
            }
            break
        case (92 << 0):
            if ((floor(image_index) == (image_number - 1)))
            {
                if ((sprite_index == spr_player_jump))
                    sprite_index = spr_player_fall
            }
            if (grounded && (vsp > 0))
            {
                create_particle(x, y, (12 << 0), 0)
                sprite_index = spr_player_land
                image_index = 0
                state = (0 << 0)
            }
            break
        case (42 << 0):
            if ((punch_afterimage > 0))
                punch_afterimage--
            else
            {
                punch_afterimage = 4
                create_red_afterimage(x, y, sprite_index, (image_index - 1), image_xscale)
            }
            if ((floor(image_index) == (image_number - 1)))
            {
                if ((sprite_index == spr_player_suplexdash))
                    sprite_index = spr_player_suplexdash
            }
            if ((sprite_index == spr_player_suplexdash) && (floor(image_index) == (image_number - 1)))
            {
                sprite_index = spr_player_idle
                state = (0 << 0)
            }
            if ((sprite_index == spr_player_suplexdash))
            {
                movespeed = 16
                hsp = (image_xscale * movespeed)
            }
            break
        case (272 << 0):
            hsp = 0
            vsp = 0
            if ((taunttimer > 0))
                taunttimer--
            if ((taunttimer == 0))
            {
                sprite_index = spr_player_idle
                state = (0 << 0)
            }
            break
        case (270 << 0):
            if ((stunbuffer > 0))
                stunbuffer--
            if ((stunbuffer == 0))
            {
                sprite_index = spr_player_idle
                state = (0 << 0)
            }
            break
        case (99 << 0):
            if ((floor(image_index) == (image_number - 1)))
            {
                state = (97 << 0)
                sprite_index = spr_player_superjump
                scr_soundeffect(sfx_fakepepsuperjump2)
            }
            break
        case (97 << 0):
            vsp = -17
            hsp = 0
            if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))))
            {
                if ((sprite_index == spr_player_superjump))
                    sprite_index = spr_player_superjumpland
                scr_soundeffect(sfx_groundpound)
                image_index = 5
                state = (123 << 0)
            }
            break
        case (123 << 0):
            vsp = 0
            hsp = 0
            if ((floor(image_index) == (image_number - 1)))
            {
                sprite_index = spr_player_fall
                state = (92 << 0)
            }
            break
    }

    grounded = scr_solid(x, (y + 1))
}
