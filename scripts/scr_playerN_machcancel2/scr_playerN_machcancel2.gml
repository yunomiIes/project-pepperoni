function scr_playerN_machcancelstart2() //gml_Script_scr_playerN_machcancelstart2
{
    hsp = 0
    vsp = 0
    movespeed = 0
    image_speed = 0.5
    if ((floor(image_index) == (image_number - 1)))
    {
        state = (306 << 0)
        sprite_index = spr_playerN_jetpackboost
        instance_create(x, y, obj_jumpdust)
        movespeed = 15
    }
}

function scr_playerN_machcancel2() //gml_Script_scr_playerN_machcancel2
{
    if ((tornadomaskbuffer > 0))
        tornadomaskbuffer--
    noisemachcancelbuffer = 10
    hsp = movespeed
    move = (key_right + key_left)
    if ((move != 0))
        savedmove = move
    if ((sprite_index == spr_playerN_divebomb) || (sprite_index == spr_playerN_divebombland) || (sprite_index == spr_playerN_divebombfall))
    {
        if ((move != 0))
        {
            if ((abs(movespeed) < 12))
                movespeed = Approach(movespeed, (move * 12), 1)
            else
                movespeed = Approach(movespeed, (move * abs(movespeed)), 1)
        }
        else
            movespeed = Approach(movespeed, 0, 0.25)
        var xx = movespeed
        if ((xx == 0))
            xx = xscale
        var yy = movespeed
        if ((yy == 0))
            yy = xscale
        if (((tornadomaskbuffer > 0) || (!grounded)) && ((sprite_index == spr_playerN_divebomb) || (sprite_index == spr_playerN_divebombfall) || (sprite_index == spr_playerN_divebombland)))
            mask_index = spr_crouchmask
        if (grounded && place_meeting((x + xx), y, obj_solid))
        {
            mask_index = spr_crouchmask
            if ((!(place_meeting((x + xx), y, obj_solid))) || place_meeting((x + xx), y, obj_destructibles))
            {
                if ((!(scr_solid_player(x, y))) || (tornadomaskbuffer <= 0))
                {
                    state = (5 << 0)
                    sprite_index = spr_machroll
                    image_index = 0
                    instance_destroy(instance_place((x + xx), y, obj_destructibles))
                    if ((movespeed != 0))
                        xscale = sign(movespeed)
                    movespeed = abs(movespeed)
                    if ((movespeed < 6))
                        movespeed = 6
                }
            }
        }
    }
    else if ((move != 0))
        movespeed = Approach(movespeed, (move * 8), 1)
    else
        movespeed = Approach(movespeed, 0, 0.5)
    if scr_noise_machcancel_grab2()
        return;
    if (key_down2 && (sprite_index != spr_playerN_divebombfall) && (!(place_meeting(x, y, obj_ventilator))) && (!grounded))
    {
        sprite_index = spr_playerN_divebombfall
        state = (306 << 0)
        vsp = 20
        image_index = 0
        return;
    }
    if (grounded && (sprite_index == spr_playerN_divebombfall))
    {
        image_index = 0
        sprite_index = spr_playerN_divebombland
    }
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_playerN_divebombland))
    {
        image_index = 0
        sprite_index = spr_playerN_divebomb
    }
    if (grounded && key_jump && (vsp >= 0) && (sprite_index != spr_playerN_wallbounce))
    {
        vsp = -7
        if ((move != 0))
            xscale = move
        instance_create((x + (sign(xscale) * 8)), y, obj_noiseparticle)
        sprite_index = spr_playerN_wallbounce
        var wallbounce_sfx = audio_play_sound(sfx_skateboardjump, 0, false)
        audio_sound_pitch(wallbounce_sfx, random_range(1.1, 1.26))
    }
    if (grounded && key_attack && (vsp >= 0) && (sprite_index == spr_playerN_wallbounce))
    {
        if ((move != 0))
            xscale = move
        else if ((savedmove != 0))
            xscale = savedmove
        jumpstop = 1
        state = (121 << 0)
        movespeed = 12
        sprite_index = spr_playerN_mach3
        scr_soundeffect(sfx_machcancelland)
        with (instance_create(x, y, obj_noiseparticle))
        {
            sprite_index = spr_noisegrounddasheffect
            image_xscale = other.xscale
        }
        image_index = 0
        with (instance_create(x, y, obj_crazyrunothereffect))
            image_xscale = other.xscale
    }
    noisedoublejump = 1
    if (key_slap2 && key_up && (character == "NTV"))
    {
        state = (80 << 0)
        image_index = 0
        sprite_index = spr_breakdanceuppercut
        vsp = -21
        movespeed = hsp
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
        repeat (4)
        {
            with (instance_create((x + irandom_range(-40, 40)), (y + irandom_range(-40, 40)), obj_explosioneffect))
            {
                sprite_index = spr_shineeffect
                image_speed = 0.35
            }
        }
    }
    if ((character == "NTV") && key_up && key_jump && (!key_down2))
    {
        freefallstart = 0
        railmomentum = 0
        if place_meeting(x, (y + 1), obj_railparent)
            railmomentum = 1
        scr_player_do_noisecrusher()
    }
    if (grounded && (!key_attack) && (vsp >= 0) && (sprite_index == spr_playerN_wallbounce))
    {
        state = (0 << 0)
        movespeed = abs(hsp)
    }
    if ((sprite_index == spr_playerN_divebomb) || (sprite_index == spr_playerN_divebombland) || (sprite_index == spr_playerN_divebombfall))
    {
        if ((!instance_exists(dashcloudid)) && grounded)
        {
            with (instance_create(x, y, obj_dashcloud))
            {
                image_xscale = other.move
                other.dashcloudid = id
            }
        }
        image_speed = ((abs(movespeed) / 40) + 0.4)
    }
    else
        image_speed = 0.5
    if ((punch_afterimage > 0))
        punch_afterimage--
    else
    {
        punch_afterimage = 18
        instance_create((x + random_range(5, -5)), (y + random_range(20, -20)), obj_tornadoeffect)
        if (grounded && ((sprite_index == spr_playerN_divebomb) || (sprite_index == spr_playerN_divebombland) || (sprite_index == spr_playerN_divebombfall)))
        {
            repeat (2)
            {
                with (instance_create((x + random_range(3, -3)), (y + 45), obj_noisedebris))
                    sprite_index = spr_noisedrilldebris
            }
        }
        create_red_afterimage(x, y, sprite_index, image_index, xscale)
    }
    scr_dotaunt()
}

function scr_noise_machcancel_grab2() //gml_Script_scr_noise_machcancel_grab2
{
    if ((character != "NTV"))
        return;
    image_speed = 0.5
    move = (key_left + key_right)
    if (key_slap2 && (!key_up))
    {
        if ((!shotgunAnim) || (move != 0))
        {
            if ((move != 0))
                xscale = move
            jumpstop = 1
            if ((vsp > -5))
                vsp = -5
            state = (104 << 0)
            movespeed = 12
            sprite_index = spr_playerN_sidewayspin
            with (instance_create(x, y, obj_crazyrunothereffect))
                image_xscale = other.xscale
            image_index = 0
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
        }
        else
        {
            if ((savedmove != 0))
                xscale = savedmove
            scr_shotgunshoot()
        }
        return 1;
    }
    return 0;
}

