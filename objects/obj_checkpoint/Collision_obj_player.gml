if (!active)
{
    if (!audio_is_playing(sfx_Checkpoint))
        scr_soundeffect(sfx_Checkpoint)
    active = 1
    sprite_index = spr_checkpoint_activating
    image_index = 0
    with (obj_player)
    {
        roomstartx = (other.x + 6)
        roomstarty = (other.y - 46)
    }
}
