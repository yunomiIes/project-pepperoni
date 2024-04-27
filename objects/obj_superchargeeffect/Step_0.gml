if ((playerid.supercharged == 0))
{
    playerid.superchargedeffectid = -4
    instance_destroy()
}
if ((playerid.state != (95 << 0)) && (playerid.state != (112 << 0)))
    visible = playerid.visible
else
    visible = false
if ((global.combotime == 0) && (!playerid.finalmoveset))
{
    playerid.supercharged = 0
    playerid.supercharge = 0
    playerid.superchargedeffectid = -4
    instance_destroy()
}
