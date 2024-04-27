var p = other.id
with (other)
{
    if ((state != (265 << 0)) && (state != (84 << 0)) && (state != (61 << 0)) && (other.cooldown == 0))
    {
        if ((state == (184 << 0)) || (state == (185 << 0)))
        {
            with (instance_create(x, (y + 12), obj_rocketdead))
            {
                hsp = (p.xscale * 6)
                vsp = 5
                image_xscale = sign(hsp)
            }
        }
        target_vsp = 0
        state = (265 << 0)
        vsp = 0
        scr_soundeffect(sfx_antigravstart)
        scr_soundeffect(sfx_Bubblestation)
        with (obj_antigravbubble)
        {
            if ((playerid == other.id))
                instance_destroy()
        }
        with (instance_create(x, y, obj_antigravbubble))
            playerid = other.id
        other.cooldown = 50
        other.image_index = 0
        other.sprite_index = spr_antigrav_activate
    }
}
