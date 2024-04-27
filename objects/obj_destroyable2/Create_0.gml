global.breaksound = 0
if ((room == midway_1) || (string_copy(room_get_name(room), 1, 6) == "midway") || (obj_player1.character == "B"))
    sprite_index = spr_destroyableBO2
else if ((obj_player1.character == "PZ") || (obj_player1.character == "PI"))
    sprite_index = spr_smallbreak2SP
else
    sprite_index = spr_destroyable2
depth = 1
