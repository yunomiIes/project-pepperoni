if ((state != (8 << 0)) && (state != (146 << 0)))
    draw_self()
else if ((state == (8 << 0)))
{
    draw_set_alpha(orangealpha)
    with (playerid)
        draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha)
    draw_set_alpha(1)
    with (obj_firemouthflame)
        draw_self()
}
else if ((state == (8 << 0)))
{
    draw_rectangle_color(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (camera_get_view_x(view_camera[0]) + obj_camera.original_cam_width), (camera_get_view_y(view_camera[0]) + obj_camera.original_cam_height), c_white, c_white, c_white, c_white, 0)
    with (playerid)
    {
        draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha)
        if global.noisejetpack
            draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha)
    }
    with (obj_firemouthflame)
        draw_self()
}
