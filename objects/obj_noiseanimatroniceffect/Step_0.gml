vsp += 0.5
if ((vsp > 20))
    vsp = 20
y += vsp
if ((y >= ystart))
{
    depth = 0
    y = ystart
    if ((sprite_index != spr_playerN_animatronic))
    {
        sprite_index = spr_playerN_animatronic
        with (obj_player1)
        {
            state = (0 << 0)
            landAnim = 1
            sprite_index = spr_land
            image_index = 0
        }
    }
}
