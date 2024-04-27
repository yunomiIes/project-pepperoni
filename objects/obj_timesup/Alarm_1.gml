if (global.checkpoints && (global.laps >= 1))
{
    obj_player.targetRoom = global.checkpointroom
    obj_player.targetDoor = global.checkpointdoor
    global.panic = 1
    global.combolost = global.checkpointcombolost
    global.hurtcounter = global.checkpointhurtcounter
    instance_create(x, y, obj_fadeout)
    checkpointactive = 1
    with (obj_player)
    {
        holycross = 0
        ghostdash = 0
        ghostpepper = 0
        instakillmove = 0
        alarm[10] = -1
    }
}
else
{
    scr_room_goto(LongintroREAL)
    obj_player.state = (146 << 0)
}
