if ((room == rm_editor))
    return;
if ((distance_to_object(obj_player1) <= 375) && ((obj_player1.state == (121 << 0)) || (obj_player1.state == (80 << 0)) || (obj_player1.state == (208 << 0)) || (obj_player1.state == (42 << 0))))
    sprite_index = spr_hungrypillar_angry
else
    sprite_index = spr_hungrypillar
