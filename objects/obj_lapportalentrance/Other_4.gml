var p = 0
with (obj_player)
{
    if ((targetDoor == "LAP"))
    {
        p = 1
        state = (146 << 0)
        x = other.x
        y = other.y
        roomstartx = x
        roomstarty = y
        visible = false
        with (obj_pizzaface)
        {
            x = other.x
            y = other.y
        }
    }
}
if p
{
    if ((global.laps >= 1))
    {
        ds_list_copy(global.checkpointsaveroom, global.saveroom)
        ds_list_copy(global.checkpointbaddieroom, global.baddieroom)
        ds_list_copy(global.checkpointescaperoom, global.escaperoom)
        ds_list_copy(global.checkpointlap4rooms, global.lap4rooms)
    }
}
if (!p)
    instance_destroy()
else
    active = 1
