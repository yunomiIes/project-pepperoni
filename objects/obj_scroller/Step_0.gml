var range = 50
with (obj_player1)
{
    if ((x < (-range)))
        x = (room_width + range)
    if ((x > (room_width + range)))
        x = (-range)
    if ((y < (-range)))
        y = (room_height + range)
    if ((y > (room_height + range)) && (room != LongintroREAL))
        y = (-range)
}
with (obj_baddie)
{
    if ((x < (-range)))
    {
        if thrown
        {
            if ((object_index != obj_boulder))
                instance_destroy()
            else
                thrown = 0
        }
        x = (room_width + range)
    }
    if ((x > (room_width + range)))
    {
        if thrown
        {
            if ((object_index != obj_boulder))
                instance_destroy()
            else
                thrown = 0
        }
        x = (-range)
    }
    if ((object_index != obj_boulder))
    {
        if ((y < (-range)))
            y = (room_height + range)
        if ((y > (room_height + range)))
            y = (-range)
    }
}
