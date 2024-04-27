global.roommessage = "PIZZA TOWER ISLAND"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_plage_cavern1_Create_157_gml_Room_plage_cavern1_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
        else
            secret_close_portal(1)
        return;
    }
)
    secret_add(function() //anon_gml_Room_plage_cavern1_Create_283_gml_Room_plage_cavern1_Create
    {
        touchedtriggers = 0
        return;
    }
, function() //anon_gml_Room_plage_cavern1_Create_332_gml_Room_plage_cavern1_Create
    {
        if ((touchedtriggers >= 6))
            secret_open_portal(0)
        return;
    }
)
}
