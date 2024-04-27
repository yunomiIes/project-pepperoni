function scr_player_shoulderbash() //gml_Script_scr_player_shoulderbash
{
    switch character
    {
        case "M":
            movespeed = 10
            hsp = (xscale * movespeed)
            if (!instance_exists(chargeeffectid))
            {
                with (instance_create((x + 5), (y - 5), obj_chargeeffect))
                {
                    playerid = other.object_index
                    other.chargeeffectid = id
                    depth = (other.depth - 1)
                }
            }
            if ((sprite_index == spr_pepperman_shoulderstart))
                image_speed = 0.35
            if ((sprite_index == spr_pepperman_shoulderstart) && (floor(image_index) == (image_number - 1)))
            {
                sprite_index = spr_pepperman_shoulderloop
                movespeed += 0.5
            }
            if ((sprite_index == spr_pepperman_shoulderloop))
            {
                image_speed = 0.35
                hsp += 0.1
            }
            if ((sprite_index == spr_pepperman_shoulderloop) && (!key_attack) && obj_player.grounded)
            {
                sprite_index = spr_machslidestart
                scr_soundeffect(sfx_break)
                state = (105 << 0)
                image_index = 0
                obj_player.launched = 0
            }
            if (key_down && (!obj_player.grounded))
            {
                particle_set_scale((5 << 0), xscale, 1)
                create_particle(x, y, (5 << 0), 0)
                flash = 0
                state = (5 << 0)
                image_index = 0
                vsp = 10
                sprite_index = spr_dive
            }
            if key_jump
                input_buffer_jump = 0
            if grounded
                jumpstop = 0
            if ((!key_jump2) && (jumpstop == 0) && (vsp < 0.5))
            {
                vsp /= 20
                jumpstop = 1
            }
            if ((input_buffer_jump < 8) && grounded)
            {
                vsp = (-shoulderbash_jumpspeed)
                scr_soundeffect(sfx_jump)
            }
            if ((!instance_exists(dashcloudid)) && grounded)
            {
                with (instance_create(x, (y - 5), obj_dashcloud))
                {
                    image_xscale = other.xscale
                    other.dashcloudid = id
                }
            }
            if (key_up && obj_player.grounded && (sprite_index != spr_dashpadmach) && (!(place_meeting(x, y, obj_dashpad))))
            {
                sprite_index = spr_superjumpprep
                state = (99 << 0)
                hsp = 0
                image_index = 0
            }
            if (key_left && obj_player.grounded && (sprite_index == spr_pepperman_shoulderloop) && (sprite_index != spr_dashpadmach))
            {
                scr_soundeffect(sfx_machslideboost)
                sprite_index = spr_mach3boost
                image_xscale = -1
                state = (105 << 0)
                image_index = 0
            }
            if place_meeting((x + xscale), y, obj_solid)
                state = (0 << 0)
            if (((!obj_player.grounded) && (place_meeting((x + hsp), y, obj_solid) || scr_solid_slope((x + hsp), y)) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock)))) || (obj_player.grounded && (place_meeting((x + sign(hsp)), (y - 16), obj_solid) || scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting(x, (y + 1), obj_slope)))
            {
                wallspeed = movespeed
                grabclimbbuffer = 0
                state = (37 << 0)
            }
            break
        case "B":
        case "N":
        case "V":
        case "S":
        case "P":
            movespeed = ((sprite_index == spr_pepperman_shoulderstart) ? shoulderbash_mspeed_start : Approach(movespeed, shoulderbash_mspeed_loop, 0.5))
            hsp = (xscale * movespeed)
            if (!instance_exists(chargeeffectid))
            {
                with (instance_create((x + 5), (y - 5), obj_chargeeffect))
                {
                    playerid = other.object_index
                    other.chargeeffectid = id
                    depth = (other.depth - 1)
                }
            }
            if ((sprite_index == spr_pepperman_shoulderstart) && (floor(image_index) == (image_number - 1)))
                sprite_index = spr_pepperman_shoulderloop
            if ((sprite_index == spr_pepperman_shoulderloop) && (!key_attack))
            {
                state = (0 << 0)
                image_index = 0
            }
            if key_jump
                input_buffer_jump = 0
            if grounded
                jumpstop = 0
            if ((!key_jump2) && (jumpstop == 0) && (vsp < 0.5))
            {
                vsp /= 20
                jumpstop = 1
            }
            if ((input_buffer_jump < 8) && grounded)
            {
                vsp = (-shoulderbash_jumpspeed)
                scr_soundeffect(sfx_jump)
            }
            if ((!instance_exists(dashcloudid)) && grounded)
            {
                with (instance_create(x, (y - 5), obj_dashcloud))
                {
                    image_xscale = other.xscale
                    other.dashcloudid = id
                }
            }
            if place_meeting((x + xscale), y, obj_solid)
                state = (0 << 0)
            break
    }

    return;
}

