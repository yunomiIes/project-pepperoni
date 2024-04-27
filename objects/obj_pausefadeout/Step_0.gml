if ((fadealpha > 1) && (!fadein))
{
    if obj_pause.pause
    {
        instance_activate_all()
        scr_deactivate_escape()
        alarm[0] = 1
        audio_resume_all()
        if (!global.deathmode)
            instance_deactivate_object(obj_clockcollectible2)
        if (!global.panic)
        {
            instance_deactivate_object(obj_destroyableescape)
            instance_deactivate_object(obj_destroyable2escape)
            instance_deactivate_object(obj_destroyable2_bigescape)
            instance_deactivate_object(obj_destroyable3escape)
            instance_deactivate_object(obj_metalblockescape)
        }
    }
    else if (!obj_pause.pause)
    {
        audio_pause_all()
        instance_deactivate_all(true)
        instance_activate_object(obj_pause)
        instance_activate_object(obj_inputAssigner)
        instance_activate_object(obj_virtual_controller)
        scr_sound(mu_editor)
    }
    obj_pause.pause = (!obj_pause.pause)
    fadein = 1
}
fadealpha += ((!fadein) ? 0.1 : -0.1)
if (fadein && (fadealpha < 0))
    instance_destroy()
