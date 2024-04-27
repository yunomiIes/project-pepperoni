if (global.levelcomplete && (!global.freezercutscene))
{
    global.levelcomplete = 0
    with (obj_player1)
    {
        other.backx = backtohubstartx
        other.backy = backtohubstarty
    }
    currentroom = room
    dragonactor = 118689
    scene_info = [[cutscene_medieval_start], [cutscene_waitfor_sprite, 349], [function() //anon_gml_RoomCC_hub_freezerlobby_3_Create_298_gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (obj_actor)
        {
            if ((id != other.dragonactor))
            {
                sprite_index = spr_idle
                visible = true
            }
        }
        cutscene_end_action()
        return;
    }
], [cutscene_set_player_visible, 0], [cutscene_player_idleanim], [cutscene_player_float, 1], [cutscene_player_pos_lerp, 832, 288, 0.07], [cutscene_wait, 40], [function() //anon_gml_RoomCC_hub_freezerlobby_3_Create_622_gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (dragonactor)
        {
            image_speed = 0.35
            sprite_index = spr_cheesedragon_goingup
            repeat (3)
                create_debris(x, y, 2589)
        }
        cutscene_end_action()
        return;
    }
], [function() //anon_gml_RoomCC_hub_freezerlobby_3_Create_822_gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (dragonactor)
        {
            y -= 5
            if ((y < -100))
            {
                with (other)
                    cutscene_end_action()
            }
        }
        return;
    }
], [cutscene_change_room, 640], [cutscene_set_player_visible, 0], [cutscene_set_player_pos, 1407, 415], [cutscene_wait, 20], [function() //anon_gml_RoomCC_hub_freezerlobby_3_Create_1101_gml_RoomCC_hub_freezerlobby_3_Create
    {
        dragonactor = instance_create(1407, -125, obj_actor)
        dragonactor.sprite_index = spr_cheesedragon_idle
        dragonactor.image_speed = 0.35
        cutscene_end_action()
        return;
    }
], [function() //anon_gml_RoomCC_hub_freezerlobby_3_Create_1293_gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (dragonactor)
        {
            y += 5
            if place_meeting(x, (y + 128), obj_solid)
            {
                sprite_index = spr_cheesedragon_stomp
                image_index = 0
                with (other)
                    cutscene_end_action()
            }
        }
        return;
    }
], [function() //anon_gml_RoomCC_hub_freezerlobby_3_Create_1522_gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (dragonactor)
        {
            y += 5
            if place_meeting(x, (y + 5), obj_solid)
            {
                while (!(place_meeting(x, (y + 1), obj_solid)))
                    y++
                with (other)
                    cutscene_end_action()
            }
        }
        return;
    }
], [cutscene_soundeffect, 27], [cutscene_camera_shake, 5, (3 / room_speed)], [function() //anon_gml_RoomCC_hub_freezerlobby_3_Create_1822_gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (dragonactor)
        {
            if ((floor(image_index) == (image_number - 1)))
            {
                sprite_index = spr_cheesedragon_idle
                with (other)
                    cutscene_end_action()
            }
        }
        return;
    }
], [cutscene_wait, 50], [function() //anon_gml_RoomCC_hub_freezerlobby_3_Create_2045_gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (obj_freezerblock)
            instance_destroy()
        cutscene_end_action()
        return;
    }
], [cutscene_wait, 50], [cutscene_change_room, 638], [cutscene_set_player_visible, 0], [cutscene_set_player_pos, 190, 600], [cutscene_soundeffect, 27], [cutscene_camera_shake, 5, (3 / room_speed)], [cutscene_wait, 50], [function() //anon_gml_RoomCC_hub_freezerlobby_3_Create_2369_gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (obj_freezerblock)
            instance_destroy()
        cutscene_end_action()
        return;
    }
], [cutscene_wait, 50], [cutscene_change_room, currentroom], [cutscene_set_player_pos, backx, backy], [cutscene_set_player_visible, 1], [cutscene_player_float, 0], [function() //anon_gml_RoomCC_hub_freezerlobby_3_Create_2631_gml_RoomCC_hub_freezerlobby_3_Create
    {
        instance_destroy(obj_actor)
        with (obj_player)
        {
            if ((object_index != obj_player2) || global.coop)
            {
                state = (0 << 0)
                x = backtohubstartx
                y = backtohubstarty
            }
        }
        global.levelcomplete = 0
        global.freezercutscene = 1
        quick_ini_write_real(get_savefile_ini(), "cutscene", "jingle_freezer", 1)
        cutscene_end_action()
        return;
    }
], [cutscene_save_game]]
}
else if global.levelcomplete
{
    global.levelcomplete = 0
    scene_info = [[cutscene_save_game]]
}
else
    scene_info = [[cutscene_wait, 20]]
