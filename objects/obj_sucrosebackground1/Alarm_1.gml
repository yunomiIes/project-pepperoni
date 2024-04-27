var lay_id = layer_get_id("Backgrounds_still1")
var back_id = layer_background_get_id(lay_id)
if ((layer_background_get_sprite(back_id) == 3513))
    layer_background_sprite(back_id, bg_sucrose_skyActive)
lay_id = layer_get_id("Backgrounds_scroll")
back_id = layer_background_get_id(lay_id)
if ((layer_background_get_sprite(back_id) == 3500))
    layer_background_sprite(back_id, bg_sucrosebgDebris)
instance_create(x, y, obj_sucrosebackground2)
instance_create(x, y, obj_sucroseskyflash)
instance_create_unique(0, 0, 927)
with (obj_sucrosetimer)
{
    minutes = 0
    seconds = 30
}
warbg_init()
