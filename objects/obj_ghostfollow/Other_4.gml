if ((!global.panic) && (!instance_exists(obj_randomsecret)) && (!lap5))
{
    audio_stop_sound(sfx_johnghostnearby)
    instance_destroy()
}
else
{
    with (instance_create(x, y, obj_objecticontracker))
    {
        objectID = other.id
        sprite_index = spr_icon_ghostjohn
        image_speed = 0.18
    }
}
if ((room == timesuproom))
    instance_destroy(id, false)
if lap5
{
    x = (room_width / 2)
    y = -10
}
if (((!global.laps) && lap5) || (room == rank_room))
    instance_destroy()
