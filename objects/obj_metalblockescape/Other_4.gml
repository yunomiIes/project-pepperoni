if ((ds_list_find_index(global.saveroom, id) != -1))
    instance_destroy()
if (!global.panic)
    instance_deactivate_object(obj_metalblockescape)
if global.panic
    instance_activate_object(obj_metalblockescape)
