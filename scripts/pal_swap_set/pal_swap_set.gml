function pal_swap_set() //pal_swap_set
{
    var _pal_sprite = argument[0]
    var _pal_index = argument[1]
    if (!argument[2])
    {
        var tex = sprite_get_texture(_pal_sprite, 0)
        var UVs = sprite_get_uvs(_pal_sprite, 0)
        var texel_x = texture_get_texel_width(tex)
        var texel_y = texture_get_texel_height(tex)
        var texel_hx = (texel_x * 0.5)
        var texel_hy = (texel_y * 0.5)
    }
    else
    {
        tex = surface_get_texture(_pal_sprite)
        texel_x = texture_get_texel_width(tex)
        texel_y = texture_get_texel_height(tex)
        texel_hx = (texel_x * 0.5)
        texel_hy = (texel_y * 0.5)
    }
    return;
}

