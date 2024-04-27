warbg_init()
with (obj_escapecollect)
    image_alpha = 1
with (obj_escapecollectbig)
    image_alpha = 1
if ((room == timesuproom))
    instance_destroy()
if ((global.laps >= 3) && global.elmlapping)
{
    if ((ds_list_find_index(global.lap4rooms, room) == -1))
    {
        addseconds += 10
        alarm[0] = -1
        alarm[2] = 1
        ds_list_add(global.lap4rooms, room)
    }
}
