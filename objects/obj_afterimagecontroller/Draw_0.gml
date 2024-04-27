for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    var b = ds_list_find_value(global.afterimage_list, i)
    with (b)
    {
        if visible
        {
            var a = other.alpha[identifier]
            if ((identifier == (3 << 0)))
                a = alpha
            else if ((identifier == (4 << 0)))
                a = alpha
            else if ((identifier == (5 << 0)))
            {
                a = alpha
                if instance_exists(playerid)
                {
                    if ((playerid != noone) && (playerid.object_index != obj_pepgoblin))
                    {
                    }
                }
            }
            draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, image_blend, a)
        }
    }
}
