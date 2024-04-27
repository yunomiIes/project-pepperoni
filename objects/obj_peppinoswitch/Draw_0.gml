if ((sprite_index == spr_peppinoswitch2) && instance_exists(obj_charswitch_intro) && (obj_charswitch_intro.state != (135 << 0)))
    draw_sprite_ext(spr_peppinoswitch1, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
else if visible
    draw_self()
return;
