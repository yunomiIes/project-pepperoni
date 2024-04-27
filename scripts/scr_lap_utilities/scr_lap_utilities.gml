function scr_resetcpoints() //gml_Script_scr_resetcpoints
{
    with (obj_player1)
    {
        ds_list_clear(global.checkpointsaveroom)
        ds_list_clear(global.checkpointbaddieroom)
        ds_list_clear(global.checkpointescaperoom)
        ds_list_clear(global.checkpointlap4rooms)
    }
}

function scr_checkpointstufftosave() //gml_Script_scr_checkpointstufftosave
{
    global.checkpointroom = room
    global.checkpointdoor = obj_player.targetDoor
    global.checkpointmusic = obj_music.music
    global.checkpointcombo = global.combo
    global.checkpointcombolost = global.combodropped
    global.checkpointhurtcounter = global.hurtcounter
    global.checkpointcollect = global.collect
    global.checkpointfill = global.fill
    global.checkpointgerome = global.gerome
    global.checkpointsupercharged = obj_player.supercharged
    global.checkpointsupercharge = obj_player.supercharge
    obj_tv.checkpointspr = spr_checkpointflag_unvisit
    obj_tv.checkpointalpha = 0
    obj_tv.checkpointindex = 0
    if instance_exists(obj_wartimer)
    {
        global.checkpointwarsecs = obj_wartimer.seconds
        global.checkpointwarmin = obj_wartimer.minutes
    }
}

function scr_checkpointpizzakin2() //gml_Script_scr_checkpointpizzakin2
{
    global.checkpointsausage = global.sausagefollow
    global.checkpointcheese = global.cheesefollow
    global.checkpointpineapple = global.pineapplefollow
    global.checkpointshroom = global.shroomfollow
    global.checkpointtomato = global.tomatofollow
}

