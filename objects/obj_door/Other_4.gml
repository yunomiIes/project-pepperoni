if (place_meeting(x, y, obj_player) && (!(ds_list_find_index(global.saveroom, id))))
    ds_list_add(global.saveroom, id)
if ds_list_find_index(global.saveroom, id)
    visited = 1
if (john && global.panic && (string_copy(room_get_name(room), 1, 6) != "saloon"))
    sprite_index = spr_doorblocked
else if (john && global.panic && (string_copy(room_get_name(room), 1, 6) == "saloon"))
    sprite_index = spr_doorblockedsaloon
