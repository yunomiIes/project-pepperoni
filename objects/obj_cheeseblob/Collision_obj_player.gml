if ((other.state != (61 << 0)))
{
    repeat (8)
    {
        with (create_debris(x, y, 1165))
        {
            vsp = random_range(-5, 0)
            hsp = random_range(-3, 3)
        }
    }
    other.state = (24 << 0)
    other.movespeed = 0
    other.sprite_index = other.spr_cheesepepintro
    instance_destroy()
}
