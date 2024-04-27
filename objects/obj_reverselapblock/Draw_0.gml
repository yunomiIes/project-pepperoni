for (var xx = 0; xx < abs(image_xscale); xx++)
{
    for (var yy = 0; yy < abs(image_yscale); yy++)
        draw_sprite(sprite_index, image_index, (xstart + (32 * xx)), (ystart + (32 * yy)))
}
