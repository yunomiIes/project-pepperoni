with (other)
{
    if ((state == (42 << 0)) || (state == (43 << 0)) || (state == (80 << 0)))
    {
        image_index = 0
        sprite_index = spr_shotgunpullout
        scr_soundeffect(sfx_shotgunload)
        instance_destroy(-2)
        shotgunAnim = 1
        state = (66 << 0)
        if ((room == war_1))
        {
            instance_create_unique(0, 0, 276)
            with (obj_wartimer)
            {
                minutes = 0
                seconds = 40
            }
            with (obj_escapecollect)
                image_alpha = 1
            with (obj_escapecollectbig)
                image_alpha = 1
            with (obj_music)
            {
                audio_stop_sound(sfx_nothing)
                music = 31
                musicID = scr_music(music)
            }
        }
        global.heattime = 60
    }
}
