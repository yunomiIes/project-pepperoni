function scr_player_lungeattack() //gml_Script_scr_player_lungeattack
{
    if ((sprite_index != spr_player_backflip))
    {
        image_speed = 0.35
        hsp = (xscale * movespeed)
        if hit_connected
        {
            movespeed = 6
            vsp = 0
        }
    }
    else
    {
        image_speed = 0.35
        movespeed = Approach(movespeed, 0, 0.1)
    }
    if (key_slap2 && (!supercharged))
        input_attack_buffer = 60
    if (hit_connected && (input_attack_buffer > 0) && (input_finisher_buffer <= 0))
        input_attack_buffer = 60
    if (key_slap2 && supercharged)
    {
        suplexmove = 1
        suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
        sfx_gain(suplexdashsnd)
        state = (42 << 0)
        movespeed = 5
        image_index = 0
        flash = 1
        sprite_index = spr_player_lunge
    }
    var cancelindex = 4
    if ((floor(image_index) > (image_number - 2)) && (!hit_connected))
    {
        if ((state != (80 << 0)) && (input_attack_buffer > 0))
        {
            ds_list_clear(hitlist)
            hit_connected = 0
            uplaunch = 0
            downlaunch = 0
            if ((input_attack_buffer > 0))
            {
                if finisher
                    finisher_buffer += 15
                input_attack_buffer = 0
                state = (43 << 0)
                randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 557, 556, 555, spr_punch])
                image_index = 0
            }
        }
    }
    if ((floor(image_index) == (image_number - 1)))
    {
        state = (0 << 0)
        ds_list_clear(hitlist)
        hit_connected = 0
    }
    if ((floor(image_index) > (image_number - cancelindex)) && hit_connected)
    {
        if finisher
        {
            if ((input_finisher_buffer > 0))
                DoFinisher()
        }
        if ((state != (80 << 0)) && (input_attack_buffer > 0))
        {
            ds_list_clear(hitlist)
            hit_connected = 0
            uplaunch = 0
            downlaunch = 0
            if ((input_attack_buffer > 0))
            {
                if finisher
                    finisher_buffer += 15
                input_attack_buffer = 0
                state = (43 << 0)
                randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 557, 556, 555, spr_punch])
                image_index = 0
            }
        }
    }
    if (!instance_exists(lungeattackID))
    {
        with (instance_create(x, y, obj_lungehitbox))
        {
            playerid = other.id
            other.lungeattackID = id
        }
    }
    return;
}

function randomize_animations(argument0) //gml_Script_randomize_animations
{
    if ((ds_list_size(animlist) >= array_length(argument0)))
        ds_list_clear(animlist)
    sprite_index = argument0[irandom((array_length(argument0) - 1))]
    while ((ds_list_find_index(animlist, sprite_index) != -1))
        sprite_index = argument0[irandom((array_length(argument0) - 1))]
    ds_list_add(animlist, sprite_index)
    return;
}

function DoFinisher() //gml_Script_DoFinisher
{
    ds_list_clear(hitlist)
    input_finisher_buffer = 0
    input_up_buffer = 0
    input_down_buffer = 0
    hit_connected = 0
    if key_up
    {
        state = (80 << 0)
        movespeed = 6
        image_index = 0
        sprite_index = spr_breakdanceuppercut
        vsp = -16
        hsp = (xscale * movespeed)
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
    }
    else if (((key_left + key_right) == xscale))
    {
        state = (80 << 0)
        sprite_index = spr_player_lungehit
        image_index = 0
        movespeed = 14
        with (instance_create(x, y, obj_superdashcloud))
            image_xscale = other.xscale
        particle_set_scale((2 << 0), xscale, 1)
        create_particle(x, y, (2 << 0), 0)
    }
    else if key_down
    {
        sprite_index = spr_breakdance
        image_index = 0
        machhitAnim = 0
        state = (5 << 0)
        movespeed = 4
        state = (5 << 0)
        vsp = 10
    }
    else
    {
        state = (80 << 0)
        sprite_index = spr_player_lungehit
        image_index = 0
        movespeed = 14
        with (instance_create(x, y, obj_superdashcloud))
            image_xscale = other.xscale
        particle_set_scale((2 << 0), xscale, 1)
        create_particle(x, y, (2 << 0), 0)
    }
    return;
}

