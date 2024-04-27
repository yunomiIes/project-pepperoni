global.roommessage = "WELCOME TO PIZZA TOWER"
if (!obj_secretmanager.init)
{
    trace("secret init")
    obj_secretmanager.init = 1
    secret_add(function() //anon_gml_Room_entrance_1_Create_179_gml_Room_entrance_1_Create
    {
        touchedtriggers = 0
        return;
    }
, function() //anon_gml_Room_entrance_1_Create_228_gml_Room_entrance_1_Create
    {
        if ((touchedtriggers >= 4))
            secret_open_portal(0)
        return;
    }
)
    secret_add(-4, function() //anon_gml_Room_entrance_1_Create_324_gml_Room_entrance_1_Create
    {
        secret_open_portal(1)
        return;
    }
)
    secret_add(-4, function() //anon_gml_Room_entrance_1_Create_391_gml_Room_entrance_1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
        return;
    }
)
}
