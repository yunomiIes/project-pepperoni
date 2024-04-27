if ((ds_list_find_index(global.saveroom, id) != -1))
{
    instance_destroy()
    audio_stop_sound(sfx_ufobye)
}
