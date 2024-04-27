if (!global.panic)
{
    with (obj_player1)
    {
        lastroom = room
        state = (225 << 0)
        with (obj_music)
            audio_resume_sound(music)
        room_goto(targetRoom)
        if ((targetDoor == "S"))
        {
            targetDoor = lastTargetDoor
            lastTargetDoor = "S"
        }
    }
}
else
{
    with (obj_player)
    {
        if check_player_coop()
            state = (225 << 0)
        audio_resume_sound(mu_kidsparty)
    }
    instance_destroy()
}
