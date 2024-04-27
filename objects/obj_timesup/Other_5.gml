if (checkpointactive && (!global.death_mode))
{
    audio_stop_sound(mu_timesup)
    audio_stop_sound(mu_Your_Fat_Ass_Slows_You_Down)
    global.combo = global.checkpointcombo
    global.combotime = 60
    global.combodropped = global.checkpointcombolost
    global.collect = global.checkpointcollect
    global.fill = global.checkpointfill
    global.gerome = global.checkpointgerome
    global.pizzafaceparrycount = 0
    obj_player.supercharged = global.checkpointsupercharged
    obj_player.supercharge = global.checkpointsupercharge
    if ((room == war_lap))
    {
        instance_create_unique(0, 0, 276)
        obj_wartimer.seconds = global.checkpointwarsecs
        obj_wartimer.minutes = global.checkpointwarmin
    }
    if ((global.checkpointgerome == 1))
    {
        if instance_exists(obj_geromefollow)
            instance_create(obj_player1.x, obj_player1.y, obj_geromefollow)
    }
    if ((global.laps >= 3))
    {
        if global.elmlapping
            ds_list_copy(global.checkpointlap4roomsLAP4, global.lap4rooms)
        if ((obj_player1.character != "PZ") && (obj_player1.character != "PI"))
        {
            if (!instance_exists(obj_snickexelap))
                instance_create((x + (room_width / 2)), (y + -10), obj_snickexelap)
            instance_create_unique(0, 0, 276)
            with (obj_wartimer)
            {
                if (!global.elmlapping)
                {
                    minutes = 2
                    seconds = 59
                }
                else
                {
                    minutes = 0
                    seconds = 5
                    addseconds = 0
                    ds_list_clear(global.lap4rooms)
                    ds_list_clear(global.checkpointlap4rooms)
                }
            }
        }
        else if (!instance_exists(obj_snickexelap))
            instance_create((x + round((room_width / 2))), (y + -40), obj_snickexelap)
    }
    if ((global.checkpointsausage == 0))
    {
        global.sausagefollow = 0
        instance_destroy(obj_pizzakinsausage)
    }
    if ((global.checkpointcheese == 0))
    {
        global.cheesefollow = 0
        instance_destroy(obj_pizzakincheese)
    }
    if ((global.checkpointpineapple == 0))
    {
        global.pineapplefollow = 0
        instance_destroy(obj_pizzakinpineapple)
    }
    if ((global.checkpointshroom == 0))
    {
        global.shroomfollow = 0
        instance_destroy(obj_pizzakinshroom)
    }
    if ((global.checkpointtomato == 0))
    {
        global.tomatofollow = 0
        instance_destroy(obj_pizzakintomato)
    }
    ds_list_copy(global.saveroom, global.checkpointsaveroom)
    ds_list_copy(global.baddieroom, global.checkpointbaddieroom)
    ds_list_copy(global.escaperoom, global.checkpointescaperoom)
    ds_list_copy(global.lap4rooms, global.checkpointlap4rooms)
    with (obj_music)
    {
        if (!audio_is_playing(global.checkpointmusic))
        {
            music = global.checkpointmusic
            musicID = scr_music(music)
        }
    }
}
