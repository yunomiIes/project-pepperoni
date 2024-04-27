global.roommessage = "PIZZA TOWER ISLAND"
global.pizzadelivery = 1
global.hp = 8
global.use_temperature = 1
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //anon_gml_Room_rm_testing_Create_219_gml_Room_rm_testing_Create
    {
        touchedtriggers = 0
        return;
    }
, function() //anon_gml_Room_rm_testing_Create_268_gml_Room_rm_testing_Create
    {
        if ((touchedtriggers >= 2))
            secret_open_portal(0)
        return;
    }
)
    secret_add(function() //anon_gml_Room_rm_testing_Create_360_gml_Room_rm_testing_Create
    {
        hittriggers = 0
        return;
    }
, function() //anon_gml_Room_rm_testing_Create_405_gml_Room_rm_testing_Create
    {
        if ((hittriggers >= 2))
            secret_open_portal(4)
        return;
    }
)
    secret_add(-4, function() //anon_gml_Room_rm_testing_Create_497_gml_Room_rm_testing_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
        return;
    }
)
    secret_add(-4, function() //anon_gml_Room_rm_testing_Create_594_gml_Room_rm_testing_Create
    {
        secret_open_portal(2)
        return;
    }
)
    secret_add(-4, function() //anon_gml_Room_rm_testing_Create_661_gml_Room_rm_testing_Create
    {
        if secret_check_trigger(3)
            secret_open_portal(3)
        else
            secret_close_portal(3)
        return;
    }
)
    secret_add(function() //anon_gml_Room_rm_testing_Create_787_gml_Room_rm_testing_Create
    {
        totems = 0
        return;
    }
, function() //anon_gml_Room_rm_testing_Create_827_gml_Room_rm_testing_Create
    {
        if ((totems >= 3))
            secret_open_portal(5)
        return;
    }
)
    secret_add(-4, function() //anon_gml_Room_rm_testing_Create_914_gml_Room_rm_testing_Create
    {
        if secret_check_trigger(6)
            secret_open_portal(6)
        return;
    }
)
    secret_add(-4, function() //anon_gml_Room_rm_testing_Create_1011_gml_Room_rm_testing_Create
    {
        if secret_check_trigger(7)
            secret_open_portal(7)
        return;
    }
)
}
