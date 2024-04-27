if ((sprite_index == spr_heater2))
{
    if point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
    {
        if (!audio_is_playing(sfx_instanttemp))
            scr_soundeffect(sfx_instanttemp)
    }
}
