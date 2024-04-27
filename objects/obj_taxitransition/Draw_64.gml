if start
{
    draw_sprite(bgsprite, bgindex, 0, 0)
    var cy = irandom_range((-shake_mag), shake_mag)
    draw_sprite(sprite_index, image_index, 0, cy)
}
draw_set_alpha(fade)
draw_rectangle_color(0, 0, obj_camera.original_cam_width, obj_camera.original_cam_height, c_black, c_black, c_black, c_black, 0)
draw_set_alpha(1)
