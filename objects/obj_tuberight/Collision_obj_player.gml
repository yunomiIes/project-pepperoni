if ((other.tube_id == id))
    return;
if ((other.state == (107 << 0)))
    return;
if ((other.state == (186 << 0)))
    return;
var _offset_x = (32 * image_xscale)
var _offset_y = (14 * image_yscale)
with (other)
{
    if ((other.stored_spd == 0))
    {
    }
    hsp = 0
    vsp = 0
    movespeed = 0
    tube_vsp = 0
    state = (150 << 0)
    x = Approach(x, (other.x + _offset_x), other.approach_spd)
    y = Approach(y, (other.y + _offset_y), other.approach_spd)
}
if ((floor(other.x) == (x + _offset_x)) && (floor(other.y) == (y + _offset_y)))
{
    other.state = (150 << 0)
    other.tube_id = id
    var ms = movespeed
    if ((other.character == "NTV"))
        ms += 5
    other.hsp = (hsp * ms)
    other.vsp = (vsp * ms)
    other.tube_vsp = (vsp * ms)
    stored_spd = 0
    scr_soundeffect(sfx_pipebump1, 438, 439, 440)
    trace("hsp: ", other.hsp, " vsp: ", other.vsp)
}
