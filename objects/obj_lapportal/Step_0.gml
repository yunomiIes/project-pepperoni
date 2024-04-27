var beactive = 0
if instance_exists(obj_wartimer)
    beactive = 1
if instance_exists(obj_pumpkincounter)
    beactive = 1
if (global.panic || beactive)
{
    image_alpha = 1
    if ((sprite_index == spr_pizzaportal))
    {
        playerid = noone
        with (obj_player)
        {
            if ((other.playerid == noone) && place_meeting(x, y, -2))
            {
                scr_checkpointpizzakin2()
                state = (146 << 0)
                visible = false
                other.sprite_index = spr_pizzaportalend
                other.image_index = 0
                other.playerid = id
                scr_soundeffect(sfx_lapenter)
                global.collect += 3000
                global.combotime = 60
                with (instance_create((x + 16), y, obj_smallnumber))
                    number = 3000
            }
        }
    }
    else if ((sprite_index == spr_pizzaportalend))
    {
        with (playerid)
        {
            hsp = 0
            vsp = 0
            visible = false
        }
        if ((floor(image_index) == (image_number - 1)))
        {
            image_index = (image_number - 1)
            image_speed = 0
            if (!instance_exists(obj_fadeout))
            {
                with (obj_player)
                {
                    targetDoor = "LAP"
                    targetRoom = other.targetRoom
                }
                for (var i = 0; i < ds_list_size(global.escaperoom); i++)
                {
                    var b = ds_list_find_value(global.escaperoom, i)
                    var q = ds_list_find_index(global.baddieroom, b)
                    var t = 0
                    if ((q == -1))
                    {
                        q = ds_list_find_index(global.saveroom, b)
                        t = 1
                    }
                    if ((q != -1))
                    {
                        if (!t)
                            ds_list_delete(global.baddieroom, q)
                        else
                            ds_list_delete(global.saveroom, q)
                    }
                }
                global.laps++
                global.lap = 1
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
                            }
                        }
                    }
                    else if (!instance_exists(obj_snickexelap))
                        instance_create((x + round((room_width / 2))), (y + -40), obj_snickexelap)
                }
                instance_create(0, 0, obj_fadeout)
            }
        }
    }
}
else
    image_alpha = 0.5
if ((global.laps == 2))
    global.fill = 0
