function scr_player_ratmountclimbwall() //scr_player_ratmountclimbwall
{
    image_speed = 0.5
    hsp = 0
    vsp = 0
    if ((sprite_index != spr_player_ratmountbounceside))
    {
        sprite_index = spr_player_ratmountbounceside
        image_index = 0
    }
    else if ((floor(image_index) == (image_number - 1)))
        image_index = (image_number - 1)
    if ((!grounded) && (!(place_meeting((x + 1), y, obj_solid))) && (!(place_meeting((x - 1), y, obj_solid))))
    {
        state = (192 << 0)
        jumpAnim = 0
        sprite_index = spr_player_ratmountfall
    }
    if ((floor(image_index) == (image_number - 1)))
    {
        if key_jump2
        {
            state = (198 << 0)
            xscale *= -1
            vsp = -14
            ratmount_fallingspeed = 0
            movespeed = (xscale * 10)
            sprite_index = spr_player_ratmountwalljump
            scr_soundeffect(sfx_guswalljump2)
            audio_stop_sound(sfx_guswalljump1)
        }
        else
        {
            state = (192 << 0)
            sprite_index = spr_player_ratmountfall
        }
    }
    if ((sprite_index == spr_player_ratmountbounceside) && (image_index < 1) && (!audio_is_playing(sfx_guswalljump1)))
        scr_soundeffect(sfx_guswalljump1)
    return;
}

