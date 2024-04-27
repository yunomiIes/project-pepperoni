with (obj_player)
{
    if (place_meeting((x + 1), y, other) || place_meeting((x - 1), y, other) || place_meeting(x, (y + 1), other) || place_meeting(x, (y - 1), other))
    {
        with (other)
        {
            if ((other.state != (113 << 0)))
            {
                var h = other.hurted
                scr_hurtplayer(other)
                if ((h != other.hurted) && other.hurted)
                    self.fmod_event_one_shot_3d("event:/sfx/enemies/pizzardelectricity", x, y)
                if fake
                    instance_destroy()
            }
            else
            {
                with (other)
                {
                    state = (106 << 0)
                    sprite_index = spr_bump
                    image_index = 0
                    hsp = (-6 * xscale)
                    vsp = -4
                    self.fmod_event_one_shot_3d("event:/sfx/knight/lose", x, y)
                    repeat (3)
                        create_debris(x, y, 1158)
                }
            }
        }
    }
}
