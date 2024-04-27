if ((state != (4 << 0)) && (state != (154 << 0)) && (state != (137 << 0)) && (state != (266 << 0)) && ((!(place_meeting(x, y, obj_destructibles))) || place_meeting(x, y, obj_onewaybigblock)))
{
    if elite
    {
        elitehit--
        if ((elitehit < 0))
            elitehit = 0
        if ((elitehit > 0))
        {
            event_perform(ev_destroy, 0)
            var b = ds_list_find_index(global.baddieroom, id)
            if ((b != -1))
                ds_list_delete(global.baddieroom, b)
            image_xscale *= -1
            hsp = (5 * (-image_xscale))
            flash = 0
        }
    }
    if ((elitehit <= 0) || (!elite))
        instance_destroy()
}
