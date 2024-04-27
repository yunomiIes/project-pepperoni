function scr_player_crusherpound() //gml_Script_scr_player_crusherpound
{
    image_speed = 0.35
    if ((sprite_index == spr_playerN_noisecrusherland))
    {
        hsp = 0
        vsp = 0
        movespeed = 0
        if ((floor(image_index) == (image_number - 1)))
            state = (0 << 0)
        return;
    }
    if ((vsp > 0))
        vsp += 0.5
    hsp = movespeed
    move = (key_left + key_right)
    if ((move != 0))
        movespeed = Approach(movespeed, (move * 8), 0.5)
    else
        movespeed = Approach(movespeed, 0, 0.5)
    if ((sprite_index != spr_playerN_noisecrusherstart) && (sprite_index != spr_playerN_noisecrusherland) && (sprite_index != spr_playerN_noisecrusherfall))
    {
        sprite_index = spr_playerN_noisecrusherstart
        image_index = 0
    }
    if ((sprite_index == spr_playerN_noisecrusherstart) && (floor(image_index) == (image_number - 1)))
        sprite_index = spr_playerN_noisecrusherfall
    if ((key_attack2 || key_slap2) && (!grounded))
    {
        image_speed = 0.5
        if ((move != 0))
            xscale = move
        jumpstop = 1
        vsp = -5
        state = (104 << 0)
        movespeed = 12
        sprite_index = spr_playerN_sidewayspin
        image_index = 0
        with (instance_create(x, y, obj_crazyrunothereffect))
            image_xscale = other.xscale
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        return 1;
    }
    if (grounded && (vsp > 0) && (!(place_meeting(x, (y + vsp), obj_destructibles))) && (!(place_meeting(x, (y + 15), obj_destructibles))) && (!(place_meeting(x, (y + 15), obj_metalblock))) && (!(place_meeting(x, (y + 15), obj_grindrail))))
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
        sprite_index = spr_playerN_noisecrusherland
        image_index = 0
    }
    scr_dotaunt()
}

function scr_player_do_noisecrusher() //gml_Script_scr_player_do_noisecrusher
{
    movespeed = hsp
    state = (198 << 0)
    sprite_index = spr_playerN_noisecrusherstart
    image_index = 0
    vsp = -16
    scr_soundeffect(sfx_doublejump2N)
    particle_set_scale((5 << 0), xscale, 1)
    create_particle(x, y, (5 << 0), 0)
}

