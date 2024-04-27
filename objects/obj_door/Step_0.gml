if (john && global.panic && (string_copy(room_get_name(room), 1, 6) != "saloon"))
    sprite_index = spr_doorblocked
else if (john && global.panic && (string_copy(room_get_name(room), 1, 6) == "saloon"))
    sprite_index = spr_doorblockedsaloon
