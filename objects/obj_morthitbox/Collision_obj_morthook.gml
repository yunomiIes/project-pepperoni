var mh_id = other.id
other.projectilebuffer = 20
if instance_exists(obj_parryeffect)
{
    with (obj_parryeffect)
    {
        if ((follow == 1))
            instance_destroy()
    }
}
with (playerid)
{
    if ((state != (14 << 0)))
    {
        state = (14 << 0)
        morthookID = mh_id
        tauntstoredmovespeed = movespeed
        movespeed = 12
        if ((character == "NTV"))
            movespeed = 20
        jumpstop = 0
        instance_destroy(-2)
    }
}
with (instance_create(other.x, (other.y + 10), obj_parryeffect))
    sprite_index = spr_morthookgrabeffect
instance_destroy()
