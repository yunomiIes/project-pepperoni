function scr_pizzagoblin_throw() //scr_pizzagoblin_throw
{
    if (!variable_global_exists("throw_data"))
    {
        global.throw_data[471] = [spr_railh2, spr_pizzagoblin_throwbomb, spr_peppermanlow]
        global.throw_data[473] = [spr_railhright, spr_canongoblin_throwbomb, spr_peppermanlow]
        global.throw_data[472] = [spr_ghost_cart, spr_archergoblin_shoot, spr_peppermanlow]
        global.throw_data[467] = [spr_railh2right, spr_cheeserobot_attack, spr_peppermanlow]
        global.throw_data[487] = [spr_fakepeppino_flailing, spr_spitcheese_spit, spr_sausagemannocigar_walk]
        global.throw_data[220] = [spr_railh2left, spr_tank_shoot, spr_player_pizzacarjump]
        global.throw_data[53] = [spr_fakepeppino_flailing, spr_trash_throw, spr_sausagemannocigar_walk]
        global.throw_data[489] = [spr_fakepeppino_flailing, spr_invtrash_throw, spr_sausagemannocigar_walk]
        global.throw_data[469] = [spr_fakepeppino_flailing, spr_robot_attack, spr_switchblock_gohappy]
        global.throw_data[470] = [spr_gerome_idle1, spr_kentukykenny_throw, spr_peppermanlow]
        global.throw_data[477] = [spr_railh2right, spr_pizzard_shoot, spr_sausagemannocigar_walk]
        global.throw_data[482] = [spr_entrancepillarsecret, spr_pepgoblin_kick, spr_peppermanlow]
        global.throw_data[808] = [spr_gerome_idle1, spr_pepbat_kick, spr_peppermanlow]
        global.throw_data[480] = [spr_railhleft, spr_swedishmonkey_eat, spr_peppermanlow]
        global.throw_data[479] = [sprite10293, spr_ranch_shoot, spr_sausagemannocigar_walk]
        global.throw_data[478] = [spr_fakepeppino_flailing, spr_pickle_attack, spr_peppermanlow]
        global.throw_data[244] = [spr_railh2right, spr_tank_shoot, spr_sausagemannocigar_walk]
        global.throw_data[459] = [spr_pizzaslug_rage, spr_shrimp_knife, spr_cigar_turn]
        global.throw_data[460] = [spr_pizzaslug_rage, spr_shrimp_knife, spr_cigar_turn]
        global.throw_data[435] = [spr_pizzaslug_rage, spr_shrimp_knife, spr_cigar_turn]
        global.throw_data[247] = [spr_railhright, spr_pizzaslug_cough, sprite10293]
        global.throw_data[497] = [spr_entrancepillarsecret, spr_ufolive_shoot, spr_sausagemannocigar_walk]
        global.throw_data[836] = [spr_railh2left, spr_kentukybomber_attack, spr_sausagemannocigar_walk]
        global.throw_data[306] = [spr_railh2, spr_ufogrounded_shoot, spr_sausagemannocigar_walk]
        global.throw_data[488] = [spr_fakepeppino_flailing, spr_trash_throw, spr_sausagemannocigar_walk]
        global.throw_data[203] = [spr_railh2, spr_peasanto_throw, spr_peppermanlow]
        global.throw_data[49] = [spr_railh2, spr_farmer2_throw, spr_peppermanlow]
    }
    hsp = 0
    if place_meeting(x, (y + 1), obj_railh)
        hsp = -5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = 5
    if ((floor(image_index) == (image_number - 1)))
    {
        state = (134 << 0)
        sprite_index = walkspr
    }
    if ((bombreset <= 0) && (floor(image_index) == global.throw_data[object_index][0]))
    {
        bombreset = global.throw_data[object_index][2]
        sprite_index = global.throw_data[object_index][1]
        if point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
            scr_soundeffect(sfx_enemyprojectile)
        switch object_index
        {
            case obj_pizzagoblin:
                if ((string_copy(room_get_name(room), 1, 8) != "ruinsage") && (string_copy(room_get_name(room), 1, 12) != "medievalsage") && (string_copy(room_get_name(room), 1, 10) != "strongcold") && (string_copy(room_get_name(room), 1, 11) != "dungeonsage"))
                {
                    with (instance_create(x, y, obj_pizzagoblinbomb))
                    {
                        defused = 1
                        movespeed = 5
                        image_xscale = other.image_xscale
                        vsp = -10
                        countdown = 80
                    }
                }
                else
                {
                    with (instance_create(x, y, obj_pizzagoblinbombSAGE))
                    {
                        defused = 1
                        movespeed = 5
                        image_xscale = other.image_xscale
                        vsp = -10
                        hsp = (10 * other.image_xscale)
                        countdown = 80
                    }
                }
                break
            case obj_canongoblin:
                with (instance_create(x, y, obj_canongoblinbomb))
                    image_xscale = other.image_xscale
                break
            case obj_noisegoblin:
                with (instance_create(x, y, obj_noisegoblin_arrow))
                {
                }
                break
            case obj_cheeserobot:
                with (instance_create(x, y, obj_cheeseblob))
                {
                    sprite_index = spr_cheeserobot_goop
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 8)
                    vsp = 0
                    grav = 0
                }
                break
            case obj_spitcheese:
                if ((spitcheesespr == spr_spitcheese_spit))
                {
                    with (instance_create((x + (image_xscale * 6)), (y - 6), obj_spitcheesespike))
                    {
                        image_xscale = other.image_xscale
                        hsp = (other.image_xscale * 5)
                        vsp = -6
                    }
                }
                else
                {
                    with (instance_create((x + (image_xscale * 6)), (y - 6), obj_cheeseball))
                    {
                        image_xscale = other.image_xscale
                        hsp = (other.image_xscale * 5)
                        vsp = -6
                    }
                }
                break
            case obj_trash:
            case obj_invtrash:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_cheeseball))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                    vsp = -4
                }
                break
            case obj_robot:
                with (instance_create((x + (image_xscale * 4)), y, obj_robotknife))
                {
                    grav = 0
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case obj_kentukykenny:
                with (instance_create(x, y, obj_kentukykenny_projectile))
                    image_xscale = other.image_xscale
                break
            case obj_pizzard:
                with (instance_create(x, y, obj_pizzard_bolt))
                    image_xscale = other.image_xscale
                break
            case obj_swedishmonkey:
                if elite
                {
                    with (instance_create(x, y, obj_evilbanana))
                    {
                        baddieID = other.id
                        image_xscale = other.image_xscale
                        hsp = ((-other.image_xscale) * 4)
                        vsp = -5
                    }
                }
                else
                {
                    with (instance_create(x, y, obj_slipnslide))
                    {
                        baddieID = other.id
                        image_xscale = other.image_xscale
                        hsp = ((-other.image_xscale) * 4)
                        vsp = -5
                    }
                }
                with (obj_slipnslide)
                {
                    if ((baddieID == other.id))
                        banana += 1
                }
                with (obj_evilbanana)
                {
                    if ((baddieID == other.id))
                        banana += 1
                }
                break
            case obj_pepgoblin:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break
            case obj_pepbat:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break
            case obj_pickle:
                attacking = 0
                with (instance_create(x, y, obj_forkhitbox))
                {
                    ID = other.id
                    image_xscale = other.image_xscale
                    sprite_index = other.sprite_index
                }
                break
            case obj_tank:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_canongoblinbomb))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case obj_thug_blue:
            case obj_thug_red:
                with (instance_create((x + (8 * image_xscale)), y, obj_robotknife))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case obj_rancher:
                with (instance_create((x + (image_xscale * 6)), (y + 26), obj_rancher_bullet))
                    image_xscale = other.image_xscale
                break
            case obj_smokingpizzaslice:
                substate = choose((134 << 0), (126 << 0), (126 << 0))
                if ((substate == (134 << 0)))
                    image_xscale = choose(-1, 1, (-image_xscale))
                substate_buffer = substate_max
                with (instance_create((x + (50 * image_xscale)), (y + 20), obj_smokingprojectile))
                    image_xscale = other.image_xscale
                break
            case obj_thug_green:
                with (instance_create((x + (8 * image_xscale)), y, obj_junkenemy))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 7)
                    vsp = -8
                }
                break
            case obj_miniufo:
                instance_create(x, y, obj_warplaser)
                break
            case obj_miniufo_grounded:
                with (instance_create((x + (8 * image_xscale)), y, obj_enemybullet))
                {
                    sprite_index = spr_ufogrounded_bullet
                    image_xscale = other.image_xscale
                }
                break
            case obj_kentukybomber:
                instance_create(x, (y + 70), obj_kentukybomb)
                break
            case obj_bazookabaddie:
                var xx = (x + (72 * image_xscale))
                instance_create(xx, y, obj_bazooka)
                create_particle(xx, y, (6 << 0))
                break
            case obj_farmerbaddie2:
                var s = 2
                with (instance_create(x, (y + 64), obj_farmerbaddie2_projectile))
                    hsp = 0
                with (instance_create(x, (y + 64), obj_farmerbaddie2_projectile))
                    hsp = (-s)
                with (instance_create(x, (y + 64), obj_farmerbaddie2_projectile))
                    hsp = s
                break
            case obj_farmerbaddie3:
                with (instance_create(x, (y - 64), obj_farmerbaddie3_projectile))
                {
                    hsp = 0
                    vsp = -16
                }
                break
        }

    }
    if ((!grounded) && (hsp < 0))
        hsp += 0.1
    else if ((!grounded) && (hsp > 0))
        hsp -= 0.1
}

