if ((state == (4 << 0)))
    scr_enemy_grabbed()
scr_squash()
if ((state != (138 << 0)) && (state != (137 << 0)))
    linethrown = 0
if ((shake_timer > 0))
    shake_timer--
if ((state == (138 << 0)) && (!thrown))
    linethrown = 0
if ((invtime > 0))
    invtime--
if ((dodgebuffer > 0))
    dodgebuffer--
with (instance_nearest(x, y, obj_player))
{
    if ((state == (84 << 0)))
    {
        other.stunned = 0
        if ((other.state != (129 << 0)) && (!other.provoked) && (other.bombreset > 0))
        {
            other.bombreset = 0
            other.provoked = 1
        }
        other.scaredbuffer = 0
    }
    else if ((other.state != (129 << 0)))
        other.provoked = 0
}
if (thrown && ((x > (room_width + 100)) || (x < -100) || (y < -100)))
{
    state = (141 << 0)
    sprite_index = spr_pizzaface_angry
    hsp = 0
    vsp = 0
}
