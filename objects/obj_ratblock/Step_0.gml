image_speed = 0.35
if (place_meeting((x + 1), y, obj_sucroseboulder) || place_meeting((x - 1), y, obj_sucroseboulder) || place_meeting(x, (y - 1), obj_sucroseboulder) || place_meeting(x, (y + 1), obj_sucroseboulder))
    instance_destroy()
if ((obj_player1.character == "M") && ((obj_player1.sprite_index == spr_pepperman_shoulderloop) || (obj_player1.state == (5 << 0))) && (place_meeting((x + 1), y, obj_player1) || place_meeting((x - 1), y, obj_player1)))
    instance_destroy()
if ((obj_player1.character == "M") && (obj_player1.state == (108 << 0)) && (place_meeting(x, (y + 1), obj_player1) || place_meeting(x, (y - 1), obj_player1)))
    instance_destroy()
if ((obj_player1.state == (34 << 0)) && (place_meeting((x + 1), y, obj_player1) || place_meeting((x - 1), y, obj_player1)))
    instance_destroy()
if ((sprite_index != spr_rattumbleblock) && (sprite_index != spr_rattumbleblock_big) && (sprite_index != spr_ratblock6))
    mask_index = spr_ratblock1
else
    mask_index = sprite_index
if anim
    animy = Approach(animy, -10, 1.5)
else
    animy = Approach(animy, 0, 1.5)
if ((animy == -10))
    anim = 0
if ((distance_to_object(obj_player1) <= 320))
{
    if (!audio_is_playing(sfx_RatSniff))
        scr_soundeffect(sfx_RatSniff)
    audio_sound_gain(sfx_RatSniff, (1 * global.option_sfx_volume), 720)
}
else
    audio_sound_gain(sfx_RatSniff, 0, 750)
if ((audio_sound_get_gain(sfx_RatSniff) <= 0))
    audio_stop_sound(sfx_RatSniff)
