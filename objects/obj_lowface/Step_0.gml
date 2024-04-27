if ((image_alpha == 1))
{
    var dir = point_direction(x, y, obj_player1.x, obj_player1.y)
    var _xdistance = abs((x - obj_player1.x))
    var _ydistance = abs((y - obj_player1.y))
    if ((global.lowfacefill > 0))
    {
        if (((lastframexdistance + 8) <= _xdistance))
            hsp = lerp(hsp, lengthdir_x(((16 * coneballspeed) * parryspeed), dir), 0.02)
        else
            hsp = lerp(hsp, lengthdir_x(((10 * coneballspeed) * parryspeed), dir), 0.02)
        if (((lastframeydistance + 8) <= _ydistance))
            vsp = lerp(vsp, lengthdir_y(((16 * coneballspeed) * parryspeed), dir), 0.02)
        else
            vsp = lerp(vsp, lengthdir_y(((10 * coneballspeed) * parryspeed), dir), 0.02)
        x += hsp
        y += vsp
    }
    else
    {
        x = approachSP(x, obj_player1.x, lengthdir_x(((16 * coneballspeed) * parryspeed), dir))
        y = approachSP(y, obj_player1.y, lengthdir_y(((16 * coneballspeed) * parryspeed), dir))
    }
    lastframexdistance = _xdistance
    lastframeydistance = _ydistance
}
else
    image_alpha += 0.01
var pid = instance_place(x, y, obj_player1)
if ((!instance_exists(obj_fadeout)) && (!instance_exists(obj_endlevelfade)) && (image_alpha == 1))
{
    with (pid)
    {
        if ((state != (146 << 0)))
        {
            instance_destroy(obj_fadeout)
            targetDoor = "A"
            room = timesuproom
            state = (64 << 0)
            sprite_index = spr_Timesup
            image_index = 0
            audio_stop_all()
            scr_soundeffect(mu_timesup)
        }
    }
}
