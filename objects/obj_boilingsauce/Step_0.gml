if ((room == rm_editor))
    return;
var playerid = instance_place(x, (y - 1), obj_player)
with (playerid)
{
    if ((character == "V"))
        scr_hurtplayer(id)
    else if ((state != (3 << 0)) && (state != (89 << 0)) && (state != (31 << 0)) && (state != (186 << 0)))
    {
        var _pindex = ((object_index == obj_player1) ? 0 : 1)
        GamepadSetVibration(_pindex, 1, 1, 0.85)
        state = (9 << 0)
        vsp = -20
        sprite_index = spr_fireass
        image_index = 0
        movespeed = hsp
        if (!audio_is_playing(sfx_pepscream))
        {
            scr_soundeffect(sfx_pepscream)
            scr_soundeffect(sfx_fireass)
        }
        audio_stop_sound(sfx_firesound)
        scr_soundeffect(sfx_firesound)
    }
}
