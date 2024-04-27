if ((obj_player1.character == "P") || (obj_player1.character == "PZ") || (obj_player1.character == "B") || (obj_player1.character == "N") || (obj_player1.character == "NTV"))
    sprite_index = choose(spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5)
if ((obj_player1.character == "B"))
    sprite_index = choose(spr_bocollect1, spr_bocollect2, spr_bocollect3)
if ((obj_player1.character == "PI"))
    sprite_index = choose(spr_bigcollect1NSP, spr_bigcollect2NSP, spr_bigcollect3NSP)
image_speed = 0.35
if ((obj_player.character == "S"))
    sprite_index = spr_snickcollectible2
depth = 11
