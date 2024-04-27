if (!instance_exists(obj_sucrosebackground2))
    alarm[0] = 465
if (!instance_exists(obj_sucrosebackground2))
    alarm[1] = 560
else if instance_exists(obj_sucrosebackground2)
    alarm[2] = 1
if ((room == Realtitlescreen) || (room == rm_eggplantdisclaimer) || (room == rank_room) || (room == rm_levelselect) || (room == timesuproom) || (room == characterselect) || (room == hub_loadingscreen) || (room == longintroopening) || (room == introfinalcutscene) || (room == menudark) || (string_copy(room_get_name(room), 1, 4) == "boss") || (string_copy(room_get_name(room), 1, 5) == "tower") || (string_copy(room_get_name(room), 1, 3) == "hub") || (string_copy(room_get_name(room), 1, 11) == "trickytreat"))
    instance_destroy()
