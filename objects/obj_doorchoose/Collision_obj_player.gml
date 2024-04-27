if locked
    return;
var _actor = 0
with (obj_player)
{
    if ((state == (146 << 0)))
        _actor = 1
}
if _actor
    return;
if global.horse
    return;
if (john && global.panic)
    return;
if (!(place_meeting(x, y, obj_doorblocked)))
{
    with (other)
    {
        if (key_up && (!instance_exists(obj_jumpscare)) && grounded && (((state == (191 << 0)) && brick) || (state == (0 << 0)) || (state == (103 << 0)) || (state == (104 << 0)) || (state == (58 << 0)) || (state == (121 << 0)) || (state == (99 << 0))) && (y == (other.y + 50)) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && (state != (112 << 0)) && (state != (95 << 0)))
        {
            if ((other.wentin == 0))
            {
                other.theplayer = -1
                other.lemsg = get_string_async("Target Room?", "entrance_1")
                other.wentin = 1
            }
        }
    }
}
