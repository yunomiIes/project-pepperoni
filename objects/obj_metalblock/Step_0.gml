with (obj_player1)
{
    if ((place_meeting((x + hsp), y, -2) || place_meeting((x + xscale), y, -2)) && ((obj_player1.state == (121 << 0)) || (obj_player1.state == (184 << 0)) || (obj_player1.state == (38 << 0)) || (obj_player1.state == (153 << 0)) || (obj_player1.sprite_index == spr_player_ratmountmach3) || ((obj_player1.state == (5 << 0)) && (obj_player1.character == "PI") && (obj_player1.movespeed >= 12) && (obj_player1.sprite_index == spr_pizzano_crouchslide))))
    {
        playerindex = 0
        instance_destroy(-2)
    }
}
if (place_meeting(x, (y + 1), obj_player1) || place_meeting(x, (y - 1), obj_player1) || place_meeting((x - 1), y, obj_player1) || place_meeting((x + 1), y, obj_player1))
{
    if ((place_meeting(x, (y - 1), obj_player1) && (((obj_player1.state == (108 << 0)) && (obj_player1.freefallsmash >= 10)) || (obj_player1.sprite_index == spr_playerN_noisecrusherfall))) || (place_meeting(x, (y - 1), obj_player1) && (obj_player1.sprite_index == spr_player_ratmountwalljump)))
    {
        with (instance_place(x, (y - 1), obj_player1))
        {
            if ((character == "M"))
            {
                state = (92 << 0)
                vsp = -8
                sprite_index = spr_pepperman_rolling
            }
        }
        playerindex = 0
        instance_destroy()
    }
    if (place_meeting(x, (y - 1), obj_player1) && ((obj_player1.state == (47 << 0)) || (obj_player1.state == (19 << 0))))
    {
        playerindex = 0
        instance_destroy()
        tile_layer_delete_at(1, x, y)
    }
    if (place_meeting(x, (y + 1), obj_player1) && (obj_player1.state == (97 << 0)) && ((obj_player1.character == "PI") || (obj_player1.character == "PZ") || (obj_player1.character == "S")))
    {
        playerindex = 0
        instance_destroy()
        tile_layer_delete_at(1, x, y)
    }
}
with (obj_player2)
{
    if ((place_meeting((x + hsp), y, -2) || place_meeting((x + xscale), y, -2)) && ((obj_player2.state == (121 << 0)) || (obj_player2.state == (38 << 0)) || (obj_player2.state == (153 << 0)) || ((obj_player2.state == (5 << 0)) && (obj_player2.character == "PI") && (obj_player2.sprite_index == spr_pizzano_crouchslide))))
    {
        playerindex = 1
        instance_destroy(-2)
    }
}
if (place_meeting(x, (y + 1), obj_player2) || place_meeting(x, (y - 1), obj_player2) || place_meeting((x - 1), y, obj_player2) || place_meeting((x + 1), y, obj_player2))
{
    if (place_meeting(x, (y - 1), obj_player2) && (obj_player2.state == (108 << 0)) && (obj_player2.freefallsmash >= 10))
    {
        playerindex = 1
        instance_destroy()
    }
    if (place_meeting(x, (y - 1), obj_player2) && ((obj_player2.state == (47 << 0)) || (obj_player2.state == (19 << 0))))
    {
        playerindex = 1
        instance_destroy()
        tile_layer_delete_at(1, x, y)
    }
    if (place_meeting(x, (y + 1), obj_player2) && (obj_player2.state == (97 << 0)) && ((obj_player2.character == "PI") || (obj_player2.character == "PZ") || (obj_player2.character == "S")))
    {
        playerindex = 0
        instance_destroy()
        tile_layer_delete_at(1, x, y)
    }
}
