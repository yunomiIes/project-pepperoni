trigger = 7
func = function(argument0) //anon_gml_RoomCC_rm_testing_20_Create_19_gml_RoomCC_rm_testing_20_Create
{
    if (!active)
    {
        if ((following_count(252) >= 3))
        {
            active = 1
            instance_destroy(obj_chickenfollow)
        }
    }
    return;
}

