ds_list_add(global.saveroom, id)
repeat (5)
{
    with (create_debris((x + random_range(0, 64)), (y + random_range(0, 64)), 2105, 0))
    {
        hsp = random_range(-5, 5)
        vsp = random_range(-10, 10)
        image_speed = 0
        image_index = random_range(0, (image_number - 1))
    }
}
with (obj_pumpkincounter)
    counter -= 1
with (obj_music)
{
    audio_sound_gain(mu_pumpkin, 0, 2000)
    audio_sound_gain(musicID, (0.6 * global.option_music_volume), 2000)
}
scr_soundeffect(sfx_breakblock1, 46)
