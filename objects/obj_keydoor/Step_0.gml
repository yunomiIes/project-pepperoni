if ((!global.horse) && (!instance_exists(obj_jumpscare)) && ((obj_player1.state == (0 << 0)) || (obj_player1.state == (103 << 0)) || (obj_player1.state == (58 << 0)) || (obj_player1.state == (104 << 0)) || (obj_player1.state == (121 << 0)) || (obj_player1.state == (99 << 0))) && ((sprite_index == spr_doorkey) || (sprite_index == spr_doorkeyNEW)) && obj_player1.key_up && obj_player1.grounded && (global.key_inv == 1) && place_meeting(x, y, obj_player1))
{
    ds_list_add(global.saveroom, id)
    obj_player1.state = (98 << 0)
    obj_player1.image_index = 0
    if (instance_exists(obj_player2) && (global.coop == 1))
    {
        obj_player2.x = obj_player1.x
        obj_player2.y = obj_player1.y
        obj_player2.state = (98 << 0)
        obj_player2.image_index = 0
    }
    scr_soundeffect(sfx_cheer)
    image_index = 0
    sprite_index = spr_doorkeyopenNEW
    image_speed = 0
    instance_create((x + 50), (y + 50), obj_lock)
    global.key_inv = 0
}
if instance_exists(obj_player2)
{
    if ((!global.horse) && (!instance_exists(obj_jumpscare)) && (obj_player2.state == (0 << 0)) && obj_player2.grounded && obj_player2.key_up && (global.key_inv == 1) && place_meeting(x, y, obj_player2))
    {
        ds_list_add(global.saveroom, id)
        obj_player2.state = (98 << 0)
        obj_player2.image_index = 0
        obj_player1.x = obj_player2.x
        obj_player1.y = obj_player2.y
        obj_player1.state = (98 << 0)
        obj_player1.image_index = 0
        image_index = 0
        sprite_index = spr_doorkeyopenNEW
        image_speed = 0
        instance_create((x + 50), (y + 50), obj_lock)
        global.key_inv = 0
    }
}
if ((floor(image_index) == 2))
    image_speed = 0
if (place_meeting(x, y, obj_player1) && (!instance_exists(obj_jumpscare)) && (floor(obj_player1.image_index) == (obj_player1.image_number - 1)) && (obj_player1.state == (98 << 0)))
{
    with (obj_player1)
    {
        obj_player1.targetDoor = other.targetDoor
        obj_player1.targetRoom = other.targetRoom
        if (instance_exists(obj_player2) && (global.coop == 1))
        {
            obj_player2.targetDoor = other.targetDoor
            obj_player2.targetRoom = other.targetRoom
        }
        if (!instance_exists(obj_fadeout))
            instance_create(x, y, obj_fadeout)
    }
}
if place_meeting(x, y, obj_doorA)
    targetDoor = "A"
if place_meeting(x, y, obj_doorB)
    targetDoor = "B"
if place_meeting(x, y, obj_doorC)
    targetDoor = "C"
if place_meeting(x, y, obj_doorD)
    targetDoor = "D"
if place_meeting(x, y, obj_doorE)
    targetDoor = "E"
if place_meeting(x, y, obj_doorF)
    targetDoor = "F"
