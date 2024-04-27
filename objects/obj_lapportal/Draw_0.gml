if ((sprite_index != spr_pizzaportal))
    draw_self()
else
{
    draw_self()
    if (!global.oldsprites)
        draw_sprite(spr_lap2warning, global.laps, x, (y + Wave(-5, 5, 0.5, 5)))
}
