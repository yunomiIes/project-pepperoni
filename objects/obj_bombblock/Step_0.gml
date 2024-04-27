if ((obj_player1.state == (51 << 0)) && (obj_player1.sprite_index != obj_player1.spr_bombpepend) && (place_meeting((x + 1), y, obj_player1) || place_meeting((x - 1), y, obj_player1) || place_meeting(x, (y - 1), obj_player1) || place_meeting(x, (y + 1), obj_player1)))
{
    with (obj_player1)
    {
        instance_create(x, y, obj_bombexplosion)
        GamepadSetVibration(0, 1, 1, 0.9)
        hurted = 1
        vsp = -4
        image_index = 0
        sprite_index = spr_bombpepend
        state = (51 << 0)
        bombpeptimer = 0
    }
}
if ((obj_player2.state == (51 << 0)) && (obj_player2.sprite_index != obj_player2.spr_bombpepend) && (place_meeting((x + 1), y, obj_player2) || place_meeting((x - 1), y, obj_player2) || place_meeting(x, (y - 1), obj_player2) || place_meeting(x, (y + 1), obj_player2)))
{
    with (obj_player2)
    {
        GamepadSetVibration(1, 1, 1, 0.9)
        instance_create(x, y, obj_bombexplosion)
        hurted = 1
        vsp = -4
        image_index = 0
        sprite_index = spr_bombpepend
        state = (51 << 0)
        bombpeptimer = 0
    }
}
if (place_meeting((x + 1), y, obj_pizzagoblinbomb) || place_meeting((x - 1), y, obj_pizzagoblinbomb) || place_meeting(x, (y - 1), obj_pizzagoblinbomb) || place_meeting(x, (y + 1), obj_pizzagoblinbomb))
{
    with (obj_pizzagoblinbomb)
    {
        instance_create(x, y, obj_canonexplosion)
        instance_destroy()
    }
}
if ((obj_player1.character == "M") && ((obj_player1.sprite_index == spr_pepperman_shoulderloop) || (obj_player1.state == (5 << 0))) && (place_meeting((x + 1), y, obj_player1) || place_meeting((x - 1), y, obj_player1)))
    instance_destroy()
if ((obj_player1.character == "M") && (obj_player1.state == (108 << 0)) && (place_meeting(x, (y + 1), obj_player1) || place_meeting(x, (y - 1), obj_player1)))
    instance_destroy()
