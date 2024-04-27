if ((state == 0))
{
    var dir = point_direction(xstart, ystart, targetx, targety)
    hsp = lengthdir_x(movespeed, dir)
    vsp = lengthdir_y(movespeed, dir)
    x += hsp
    y += vsp
    if ((target == -4))
    {
        if ((distance_to_object(obj_player1) >= distance))
            state++
    }
    else if ((distance_to_point(targetx, targety) <= movespeed))
        state++
}
else if ((state == 1))
{
    x += hsp
    y += vsp
    hsp = Approach(hsp, 0, deccel)
    vsp = Approach(vsp, 0, deccel)
    if ((hsp == 0) && (vsp == 0))
        state++
}
else
{
    dir = point_direction(x, y, obj_player1.x, obj_player1.y)
    hsp = Approach(hsp, lengthdir_x(movespeed, dir), accel)
    vsp = Approach(vsp, lengthdir_y(movespeed, dir), accel)
    x += hsp
    y += vsp
    if ((distance_to_object(obj_player1) <= 16))
        instance_destroy()
}
