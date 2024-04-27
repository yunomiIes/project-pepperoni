depth = 0
target = -4
state = 0
targetx = x
targety = y
distance = 220
movespeed = 25
deccel = 2
accel = 3
playerid = obj_player1.id
var objs = [164, 184, 294, 434]
var closestID = noone
var closestdis = (room_width * room_height)
for (var i = 0; i < array_length(objs); i++)
{
    with (objs[i])
    {
        var dis = distance_to_object(-2)
        if ((sign((x - obj_player1.x)) == obj_player1.xscale) && ((object_index != obj_morthook) || (projectilebuffer <= 0)) && (dis <= closestdis) && bbox_in_camera(view_camera[0], 16))
        {
            closestID = id
            closestdis = dis
        }
    }
}
if ((closestID != noone))
    target = closestID
if ((target == -4))
{
    targetx = (x + (distance * obj_player1.xscale))
    image_xscale = obj_player1.xscale
}
else
{
    targetx = closestID.x
    targety = closestID.y
    if ((targetx != playerid.x))
        playerid.xscale = sign((targetx - playerid.x))
}
