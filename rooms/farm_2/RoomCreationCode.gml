global.roommessage = "COW STACK"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_farm_2_Create_148_gml_Room_farm_2_Create
    {
        secret_open_portal(0)
        return;
    }
)
    secret_add(-4, function() //anon_gml_Room_farm_2_Create_215_gml_Room_farm_2_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
        return;
    }
)
}
