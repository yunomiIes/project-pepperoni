trigger = 3
stepfunc = function() //anon_gml_RoomCC_rm_testing_8_Create_23_gml_RoomCC_rm_testing_8_Create
{
    active = 0
    if place_meeting(x, y, obj_baddie)
        active = 1
    with (obj_player)
    {
        if ((state == (55 << 0)) && place_meeting(x, y, other))
            other.active = 1
    }
    return;
}

