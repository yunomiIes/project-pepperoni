global.roommessage = "PIZZA TOWER OF HELL!"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_dungeon_1_Create_159_gml_Room_dungeon_1_Create
    {
        secret_open_portal(0)
        return;
    }
)
    secret_add(-4, function() //anon_gml_Room_dungeon_1_Create_226_gml_Room_dungeon_1_Create
    {
        secret_open_portal(1)
        return;
    }
)
    secret_add(-4, function() //anon_gml_Room_dungeon_1_Create_293_gml_Room_dungeon_1_Create
    {
        secret_open_portal(2)
        return;
    }
)
}
