playerid = instance_place(x, y, obj_player).id
xoffset = 0
yoffset = 0
image_speed = 0.35
sprite_index = choose(spr_supertaunteffect1, spr_supertaunteffect2, spr_supertaunteffect3, spr_supertaunteffect4, spr_supertaunteffect5)
image_index = 0
depth = -15
if (instance_exists(playerid) && (playerid.supercharged == 0))
{
    playerid.superchargedeffectid = -4
    instance_destroy()
}
if ((global.combotime == 0) && (!playerid.finalmoveset))
{
    playerid.supercharged = 0
    playerid.superchargedeffectid = -4
    instance_destroy()
}
