if ((room == rm_editor))
    return;
with (other)
{
    if ((obj_player1.character == "P") || (obj_player1.character == "N") || (obj_player1.character == "NTV") || (obj_player1.character == "PI"))
        sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect)
    if ((obj_player1.character == "B"))
        sprite_index = choose(spr_bocollectibles1, spr_bocollectibles2, spr_bocollectibles3, spr_bocollectibles4, spr_bocollectibles5)
    if ((obj_player1.character == "PZ"))
        sprite_index = choose(spr_collect1SP, spr_collect2SP, spr_collect3SP, spr_collect4SP, spr_collect5SP)
    image_speed = 0.35
    global.collected = 0
    global.collectsound = 0
}
if ((obj_player.character == "S"))
    sprite_index = spr_snickcollectible1
depth = 11
gotowardsplayer = 0
movespeed = 5
