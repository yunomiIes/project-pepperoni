func = function(argument0) //anon_gml_RoomCC_rm_testing_15_Create_7_gml_RoomCC_rm_testing_15_Create
{
    if ((!active) && (argument0.state == (84 << 0)))
    {
        active = 1
        obj_secretmanager.totems++
    }
    return;
}

stepfunc = function() //anon_gml_RoomCC_rm_testing_15_Create_155_gml_RoomCC_rm_testing_15_Create
{
    if active
    {
        with (instance_place(x, y, obj_totem))
            sprite_index = spr_totemcheese_pep
    }
    return;
}

visible = false
