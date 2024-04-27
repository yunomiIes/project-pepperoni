if use_dark
{
    for (var i = 0; i < array_length(objdark_arr); i++)
    {
        with (objdark_arr[i])
        {
            if visible
            {
                var b = get_dark(image_blend, other.use_dark)
                draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, b, image_alpha)
            }
        }
    }
}
if (obj_player1.finisher || obj_player2.finisher || ((obj_player.state == (252 << 0)) && (obj_player.superattackstate == (8 << 0))))
    finisher_alpha = Approach(finisher_alpha, 0.3, 0.1)
else if ((finisher_alpha > 0))
    finisher_alpha = Approach(finisher_alpha, 0, 0.02)
if ((finisher_alpha > 0))
{
    draw_set_alpha(finisher_alpha)
    draw_rectangle_color(-32, -32, (room_width + 32), (room_height + 32), c_black, c_black, c_black, c_black, 0)
    draw_set_alpha(1)
}
var _kungfu = global.kungfu
with (obj_baddie)
{
    var _stun = 0
    if ((state == (138 << 0)) && (thrown == 0))
        _stun = 25
    if (visible && (object_index != obj_pizzaball) && bbox_in_camera(view_camera[0], 32))
    {
        var c = image_blend
        if elite
            c = 65535
        if elitegrab
            c = 32768
        b = get_dark(c, other.use_dark)
        if ((object_index == obj_peppinoclone))
        {
        }
        else if usepalette
        {
        }
        draw_sprite_ext(sprite_index, image_index, x, (y + _stun), (xscale * image_xscale), yscale, angle, b, image_alpha)
        var _hp = (hp / maxhp)
        if elite
            _hp = (elitehit / maxelitehit)
        if _kungfu
        {
            if ((hp > maxhp))
                maxhp = hp
            draw_healthbar((x - 16), (y - 50), (x + 16), (y - 45), ((hp / maxhp) * 100), c_black, c_red, c_red, 0, 1, 1)
        }
        if ((_hp > 0) && (_hp < 1) && ((state != (137 << 0)) || shownHealth) && destroyable)
        {
            if ((state != (137 << 0)))
                shownHealth = 1
            var pos = [x, y]
            if ((state == (137 << 0)))
            {
                pos[0] += random_range(-6, 6)
                pos[1] += random_range(-6, 6)
            }
            var w = (70 * _hp)
            draw_sprite_part_ext(spr_healthbar, 5, 17, 0, w, 121, (pos[0] + 42), (pos[1] - 62), -1, 1, c_white, 1)
            draw_sprite(spr_healthbar, 3, pos[0], pos[1])
            draw_sprite(spr_healthbar, (_hp <= 0.5), pos[0], pos[1])
        }
        if ((object_index == obj_peppinoclone) || usepalette)
        {
        }
        if ((object_index == obj_hamkuff))
        {
            if ((state == (206 << 0)) && instance_exists(playerid))
            {
                var x1 = (x + 3)
                var y1 = (y + 30)
                if ((sprite_index == spr_hamkuff_chain2))
                {
                    x1 = (x + 7)
                    y1 = (y + 33)
                }
                var dis = point_distance(x1, y1, playerid.x, playerid.y)
                w = 24
                var len = (dis div w)
                var dir = point_direction(x1, y1, playerid.x, (playerid.y + 16))
                var xx = lengthdir_x(w, dir)
                var yy = lengthdir_y(w, dir)
                for (i = 0; i < len; i++)
                    draw_sprite_ext(spr_hamkuff_sausage, -1, (x1 + (xx * i)), (y1 + (yy * i)), 1, 1, dir, b, 1)
            }
        }
    }
}
with (obj_sausageman_dead)
{
    if (visible && bbox_in_camera(view_camera[0], 32))
    {
        b = get_dark(image_blend, other.use_dark)
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, b, image_alpha)
    }
}
with (obj_heatafterimage)
{
    if visible
        draw_sprite_ext(obj_player1.sprite_index, obj_player1.image_index, x, y, obj_player1.xscale, obj_player1.yscale, 1, c_white, alpha)
}
with (obj_player2)
{
    if (visible && bbox_in_camera(view_camera[0], 32))
    {
        b = get_dark(image_blend, other.use_dark)
        draw_sprite_ext(sprite_index, image_index, x, y, (xscale * scale_xs), (yscale * scale_ys), image_angle, b, image_alpha)
    }
}
with (obj_player1)
{
    if (visible && bbox_in_camera(view_camera[0], 32))
    {
        b = get_dark(image_blend, other.use_dark)
        draw_sprite_ext(sprite_index, image_index, x, y, (xscale * scale_xs), (yscale * scale_ys), angle, b, image_alpha)
    }
}
with (obj_baddie)
{
    _stun = 0
    if ((state == (138 << 0)))
        _stun = 25
    if (visible && flash && bbox_in_camera(view_camera[0], 32))
        draw_sprite_ext(sprite_index, image_index, x, (y + _stun), (xscale * image_xscale), yscale, angle, image_blend, image_alpha)
}
with (obj_player)
{
    if (visible && flash && bbox_in_camera(view_camera[0], 32))
        draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)
}
with (obj_deadjohnparent)
{
    if (visible && flash && bbox_in_camera(view_camera[0], 32))
        draw_sprite_ext(sprite_index, image_index, (x + hurtx), y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
}
with (obj_smallnumber)
{
    if (visible && flash)
        draw_text(x, y, number)
}
if ((room != timesuproom) && (room != rank_room))
{
    if (global.fallingbricks && (global.laps >= 2) && global.panic)
    {
        brick_y = ((brick_y + 4) % sprite_get_height(bg_fallingbricksforefront))
        draw_sprite_tiled_ext(bg_fallingbricksforefront, 0, 0, brick_y, 1, 1, c_white, 1)
    }
}
