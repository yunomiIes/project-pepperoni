var playerid = obj_player1
if ((obj_player1.spotlight == 0))
    playerid = obj_player2
var _dir = point_direction(x, y, playerid.x, playerid.y)
var _dist = point_distance(x, y, playerid.x, playerid.y)
if ((playerid.sprite_index != spr_knightpep_start) && (playerid.sprite_index != spr_knightpep_thunder) && (playerid.sprite_index != spr_bombpep_intro) && (playerid.sprite_index != spr_bombpep_end) && (playerid.state != (90 << 0)) && (playerid.state != (95 << 0)) && (playerid.state != (112 << 0)) && (playerid.state != (150 << 0)) && (!instance_exists(obj_fadeout)))
{
    if ((_dist < 300))
        movespeed = maxspeed
    if ((_dist >= 300))
        movespeed = (maxspeed * 1.35)
    if ((_dist >= 600))
        movespeed = (maxspeed * 3.4)
    if ((_dist >= 800))
        movespeed = (maxspeed * 7.5)
    x += lengthdir_x(movespeed, _dir)
    y += lengthdir_y(movespeed, _dir)
}
if ((x != obj_player.x))
    image_xscale = (-(sign((x - obj_player.x))))
if ((room == rank_room) || (room == timesuproom))
    instance_destroy()
if ((hitboxcreate == 0) && (obj_player1.instakillmove == 0) && (obj_player1.state != (42 << 0)))
{
    hitboxcreate = 1
    with (instance_create(x, y, obj_forkhitbox))
    {
        sprite_index = other.sprite_index
        ID = other.id
    }
}
if (place_meeting(x, y, obj_player1) && ((obj_player1.instakillmove == 1) || (obj_player1.state == (42 << 0))))
{
    repeat (6)
    {
        with (instance_create((x + random_range(-100, 100)), (y + random_range(-100, 100)), obj_balloonpop))
            sprite_index = spr_shotgunimpact
    }
    x = (room_width / 2)
    y = -100
}
