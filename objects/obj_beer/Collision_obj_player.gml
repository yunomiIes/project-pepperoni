if ((cooldown == 0))
{
    instance_create(x, y, obj_bangeffect)
    scr_soundeffect(sfx_beerhit)
    cooldown = 30
    hit = 1
    vsp = random_range(-7, -10)
    hsp = (random_range(5, 10) * other.xscale)
    spinspeed = (random_range(5, 10) * other.xscale)
}
