function scr_scareenemy() //scr_scareenemy
{
    var player = instance_nearest(x, y, obj_player)
    if ((state != (4 << 0)) && (state != (138 << 0)) && (state != (137 << 0)) && (state != (266 << 0)))
    {
        if ((player.x > (x - 400)) && (player.x < (x + 400)) && (y <= (player.y + 60)) && (y >= (player.y - 60)) && (((player.xscale > 0) && (x >= player.x)) || ((player.xscale < 0) && (x <= player.x))))
        {
            if ((sprite_index != scaredspr) && (state != (138 << 0)) && (state != (155 << 0)) && ((player.state == (41 << 0)) || (player.state == (121 << 0)) || (player.state == (31 << 0)) || (player.state == (184 << 0)) || (player.state == (20 << 0)) || (player.state == (38 << 0)) || ((player.state == (80 << 0)) && (obj_player.character == "PI") && (sprite_index == spr_pizzano_sjumpside)) || (player.sprite_index == spr_player_ratmountmach3) || ((player.state == (79 << 0)) && (player.swingdingdash <= 0) && (player.sprite_index == player.spr_swingding))))
            {
                state = (126 << 0)
                sprite_index = scaredspr
                if ((x != player.x))
                    image_xscale = (-(sign((x - player.x))))
                scaredbuffer = 100
                scr_soundeffect(sfx_enemyrarescream, 335, 342, 342, 342, 342)
                if grounded
                    vsp = -3
            }
        }
    }
    return;
}

