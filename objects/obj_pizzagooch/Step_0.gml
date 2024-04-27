var playerid = obj_player1
if ((sprite_index != spr_pizzaface_dead) && (sprite_index != spr_pizzaface_stun))
{
    if global.death_mode
    {
        var has_time = (instance_exists(obj_deathmodetimer) && (obj_deathmodetimer.time > 0))
        walkspr = (has_time ? spr_pizzaface_docile : spr_pizzaface_angry)
        if (has_time && (sprite_index == spr_pizzaface_angry))
        {
            image_index = 0
            sprite_index = spr_pizzaface_todocile
            flash = 1
            with (create_debris(x, y, 2076))
                image_index = 2
            with (create_debris((x + 20), y, 2076))
                image_index = 3
            with (create_debris((x - 20), y, 2076))
                image_index = 4
            with (create_debris(x, (y + 30), 2076))
                image_index = 5
        }
        if ((!has_time) && (sprite_index == spr_pizzaface_docile))
        {
            image_index = 0
            sprite_index = spr_pizzaface_toangry
            flash = 1
            with (create_debris(x, y, 2076))
                image_index = 0
            with (create_debris(x, (y + 30), 2076))
                image_index = 1
        }
        if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_pizzaface_toangry))
        {
            image_index = 0
            sprite_index = spr_pizzaface_angry
            flash = 1
        }
        if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_pizzaface_todocile))
        {
            image_index = 0
            sprite_index = spr_pizzaface_docile
            flash = 1
        }
    }
    else
    {
        sprite_index = spr_pizzaface_angry
        walkspr = spr_pizzaface_angry
    }
}
if (flash && (alarm[0] <= 0))
    alarm[0] = (0.15 * room_speed)
if ((image_alpha >= 1) && (playerid.state != (61 << 0)))
{
    var mvsp = (maxspeed + (abs(obj_player1.hsp) / 8))
    var multiplier = 1
    if (global.death_mode && instance_exists(obj_deathmodetimer) && (obj_deathmodetimer.time > 0))
        mvsp *= 0.44
    else if (global.death_mode && instance_exists(obj_deathmodetimer) && (obj_deathmodetimer.time <= 0))
        mvsp *= 1.75
    var hamkuff_nerf = 0
    with (obj_hamkuff)
    {
        if ((state == (206 << 0)))
            hamkuff_nerf = 1
    }
    if hamkuff_nerf
        multiplier = 0.2
    else if ((playerid.state == (24 << 0)) || (playerid.state == (26 << 0)) || (playerid.state == (29 << 0)) || (playerid.state == (25 << 0)))
        multiplier = 0.75
    mvsp *= multiplier
    var turnspd = (mvsp / 50)
    if (!(bbox_in_camera(view_camera[0], 100)))
    {
        mvsp *= 1.75
        turnspd *= 2.5
    }
    var _cutscene = obj_player1.cutscene
    if ((playerid.state == (10 << 0)) && (playerid.sprite_index == playerid.spr_firemouthintro))
        _cutscene = 1
    var inradius = point_in_circle(x, y, playerid.x, playerid.y, 250)
    var dir = point_direction(x, y, (playerid.x + playerid.hsp), (playerid.y + playerid.vsp))
    var next_pos = point_direction(x, y, (x + hsp), (y + vsp))
    switch state
    {
        case (137 << 0):
            scr_enemy_hit()
            break
        case (134 << 0):
        case (141 << 0):
            if _cutscene
            {
                mvsp = 0
                turnspd = 0.3
            }
            hsp = Approach(hsp, lengthdir_x(mvsp, dir), turnspd)
            vsp = Approach(vsp, lengthdir_y(mvsp, dir), turnspd)
            if (inradius && (!end_turn))
            {
                state = (110 << 0)
                saved_angle = dir
                if (((saved_angle - 10) <= next_pos) && ((saved_angle + 10) >= next_pos))
                    state = (141 << 0)
            }
            else if (!inradius)
                end_turn = 0
            x += hsp
            y += vsp
            break
        case (110 << 0):
            hsp = Approach(hsp, 0, turnspd)
            vsp = Approach(vsp, 0, turnspd)
            if ((abs(hsp) <= 0) && (abs(vsp) <= 0))
            {
                state = (141 << 0)
                end_turn = 1
            }
            x += hsp
            y += vsp
            break
        case (4 << 0):
            if (!global.cheat_pizzagooch)
                state = (141 << 0)
            break
        case (138 << 0):
            if (!global.cheat_pizzagooch)
                state = (141 << 0)
            scr_enemy_stun()
            if place_meeting(x, y, obj_solid)
            {
                hsp = lengthdir_x(15, dir)
                vsp = lengthdir_y(15, dir)
                x += hsp
                y += vsp
            }
            else
                scr_collide()
            var a = instance_place(x, y, obj_player)
            with (a)
            {
                var bID = other.id
                if ((state == (42 << 0)) && ((global.attackstyle == 0) || (bID.object_index == obj_pizzaball)))
                {
                    image_index = 0
                    if ((!key_up) || (bID.object_index == obj_pizzaball))
                    {
                        if ((movespeed <= 10) || (character == (3 << 0)))
                            sprite_index = spr_haulingstart
                        else
                            sprite_index = spr_swingding
                        if (!grounded)
                            vsp = -6
                        swingdingendcooldown = 0
                        state = (79 << 0)
                        grabbingenemy = 1
                        bID.state = (4 << 0)
                        bID.grabbedby = a
                    }
                    else if key_up
                    {
                        grabbingenemy = 1
                        bID.state = (4 << 0)
                        bID.grabbedby = a
                        sprite_index = spr_piledriver
                        vsp = -14
                        state = (76 << 0)
                        image_index = 0
                        image_speed = 0.35
                    }
                }
            }
            break
    }

}
else
    image_alpha = Approach(image_alpha, 1, 0.01)
if (place_meeting(x, y, playerid) && (!playerid.cutscene) && (playerid.state != (146 << 0)) && (!instance_exists(obj_fadeout)) && (!instance_exists(obj_endlevelfade)) && (image_alpha == 1) && (!instance_exists(obj_jumpscare)) && ((state == (141 << 0)) || (state == (110 << 0))))
{
    if (((playerid.state != (84 << 0)) && (playerid.state != (147 << 0))) || (!global.cheat_pizzagooch))
    {
        with (playerid)
        {
            instance_destroy(obj_fadeout)
            instance_destroy(obj_deathmodetimer)
            targetDoor = "A"
            room = timesuproom
            state = (64 << 0)
            sprite_index = spr_Timesup
            image_index = 0
            audio_stop_all()
            global.death_mode = 0
            scr_soundeffect(mu_timesup)
        }
        instance_destroy()
    }
}
if ((maxspeed < 8) && (image_alpha == 1))
    maxspeed += 0.005
