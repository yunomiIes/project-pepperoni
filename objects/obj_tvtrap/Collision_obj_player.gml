if (other.instakillmove || (other.state == (42 << 0)))
{
    scr_soundeffect(sfx_beerbreak)
    with (other)
    {
        scr_pummel()
        instance_destroy(-2)
    }
}
