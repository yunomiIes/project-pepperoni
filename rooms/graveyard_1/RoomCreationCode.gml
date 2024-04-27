global.roommessage = "PIZZA TOWER WITH THE DEAD"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //gml_Script_anon_gml_Room_graveyard_1_Create_164_gml_Room_graveyard_1_Create
    {
        if secret_check_trigger(0)
            secret_open_portal(0)
        return;
    }
)
    secret_add(-4, function() //gml_Script_anon_gml_Room_graveyard_1_Create_261_gml_Room_graveyard_1_Create
    {
        secret_open_portal(1)
        return;
    }
)
    secret_add(-4, function() //gml_Script_anon_gml_Room_graveyard_1_Create_328_gml_Room_graveyard_1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
        return;
    }
)
}
