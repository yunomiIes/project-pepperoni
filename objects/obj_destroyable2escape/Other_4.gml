if ((ds_list_find_index(global.saveroom, id) != -1))
    instance_destroy()
if (!global.panic)
    instance_deactivate_object(obj_destroyable2escape)
if global.panic
    instance_activate_object(obj_destroyable2escape)
