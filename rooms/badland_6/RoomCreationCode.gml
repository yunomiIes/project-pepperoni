global.roommessage = "PIZZA TOWER OF THE WEST"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //anon_gml_Room_badland_6_Create_158_gml_Room_badland_6_Create
    {
        touchedtriggers = 0
        return;
    }
, function() //anon_gml_Room_badland_6_Create_207_gml_Room_badland_6_Create
    {
        if ((touchedtriggers >= 6))
            secret_open_portal(0)
        return;
    }
)
    secret_add(-4, function() //anon_gml_Room_badland_6_Create_303_gml_Room_badland_6_Create
    {
        secret_open_portal(1)
        return;
    }
)
    secret_add(-4, function() //anon_gml_Room_badland_6_Create_370_gml_Room_badland_6_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
        return;
    }
)
}
