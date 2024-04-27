global.roommessage = "WELCOME TO PIZZA TOWER"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //gml_Script_anon_gml_Room_industrial_1_Create_161_gml_Room_industrial_1_Create
    {
        secret_open_portal(0)
        return;
    }
)
    secret_add(-4, function() //gml_Script_anon_gml_Room_industrial_1_Create_228_gml_Room_industrial_1_Create
    {
        secret_open_portal(1)
        return;
    }
)
}
