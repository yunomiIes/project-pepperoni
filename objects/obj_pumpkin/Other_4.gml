if ((ds_list_find_index(global.saveroom, id) != -1))
    instance_deactivate_object(obj_pumpkin)
if ((string_copy(room_get_name(room), 1, 11) != "trickytreat") && (!global.halloweenpumpkins))
    instance_deactivate_object(obj_pumpkin)
