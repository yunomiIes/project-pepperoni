if ((sprite_index == spr_gustavoswitch2) && instance_exists(obj_charswitch_intro) && (obj_charswitch_intro.state != (135 << 0)))
    image_index = 0
if ((sprite_index == spr_gustavoswitch2) && (floor(image_index) == (image_number - 1)))
{
    with (obj_player1)
    {
        scr_switchgustavo()
        x = obj_gustavoswitch.x
        y = obj_gustavoswitch.y
        global.switchbuffer = 100
        create_particle(x, y, (9 << 0))
    }
    sprite_index = spr_pepsign
}
if ((sprite_index == spr_pepsign) && (global.panic != escape))
    visible = false
else
    visible = true
