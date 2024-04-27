global.roommessage = "PIZZA TOWER ISLAND"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //gml_Script_anon_gml_Room_saloon_1_Create_153_gml_Room_saloon_1_Create
    {
        touchedtriggers = 0
        return;
    }
, function() //gml_Script_anon_gml_Room_saloon_1_Create_202_gml_Room_saloon_1_Create
    {
        if ((touchedtriggers >= 6))
            secret_open_portal(0)
        return;
    }
)
    secret_add(-4, function() //gml_Script_anon_gml_Room_saloon_1_Create_298_gml_Room_saloon_1_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
        return;
    }
)
}
