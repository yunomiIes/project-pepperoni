global.roommessage = "PIZZA TOWER OF THE WEST"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //gml_Script_anon_gml_Room_desert_1_Create_158_gml_Room_desert_1_Create
    {
        touchedtriggers = 0
        return;
    }
, function() //gml_Script_anon_gml_Room_desert_1_Create_207_gml_Room_desert_1_Create
    {
        if ((touchedtriggers >= 6))
            secret_open_portal(0)
        return;
    }
)
    secret_add(-4, function() //gml_Script_anon_gml_Room_desert_1_Create_303_gml_Room_desert_1_Create
    {
        secret_open_portal(1)
        return;
    }
)
    secret_add(-4, function() //gml_Script_anon_gml_Room_desert_1_Create_370_gml_Room_desert_1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
        return;
    }
)
}
