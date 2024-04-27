if ((other.state != (61 << 0)) && (other.skateboarding == 0))
{
    instance_create(x, y, obj_genericpoofeffect)
    other.movespeed = 10
    other.state = (104 << 0)
    other.skateboarding = 1
}
