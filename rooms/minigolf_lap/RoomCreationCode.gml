global.roommessage = "PIZZA TOWER ISLAND"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_minigolf_lap_Create_157_gml_Room_minigolf_lap_Create
    {
        secret_open_portal(0)
        return;
    }
)
    secret_add(-4, function() //anon_gml_Room_minigolf_lap_Create_224_gml_Room_minigolf_lap_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
        return;
    }
)
}
