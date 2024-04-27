if ((player < obj_hardmode))
{
    if ((start == 1))
    {
        if ((other.state != (84 << 0)) && (other.state != (61 << 0)) && (other.state != (137 << 0)) && (other.state != (186 << 0)))
        {
            player = other.id
            player.visible = false
            storedstate = player.state
            player.tauntstoredstate = player.state
            storedmovespeed = player.movespeed
            storedgrav = player.grav
            storedimageindex = player.image_index
            storedspriteindex = player.sprite_index
            storedfreefallsmash = player.freefallsmash
            repeat (8)
                create_particle((x + random_range(50, -50)), (y + random_range(50, -50)), (11 << 0), 0)
            alarm[0] = 25
            player.hsp = 0
            player.vsp = 0
            player.grav = 0
            player.alarm[8] = 100
            player.alarm[7] = 50
            player.alarm[5] = 2
            player.hurted = 1
            player.state = (84 << 0)
        }
    }
}
