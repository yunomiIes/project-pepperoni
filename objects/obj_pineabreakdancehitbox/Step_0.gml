if (!instance_exists(ID))
{
    instance_destroy()
    return;
}
if ((ID.state != (80 << 0)))
{
    instance_destroy()
    ID.breakdanceinst = -4
    return;
}
x = ID.x
y = ID.y
image_xscale = ID.image_xscale
image_index = ID.image_index
