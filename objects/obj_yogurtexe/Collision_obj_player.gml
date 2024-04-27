if ((aggro == 1))
    aggro = 2
if ((aggro == 2))
    return;
if ((other.state == (42 << 0)) || (other.state == (104 << 0)) || other.Instakill)
{
    repeat (3)
        instance_create(x, y, obj_slapstar)
    x = (room_width / 2)
    y = -60
}
else
    scr_hurtplayer(-2)
