if (((other.y > other.yprevious) || ((other.xscale == sign(image_xscale)) && (other.y < bbox_bottom))) && (other.state != (106 << 0)))
{
    with (other)
    {
        while place_meeting(x, y, obj_platformslope)
            y--
    }
    other.y = (y + 8)
    other.state = (202 << 0)
}
