image_speed = 0.35
if ((trashbuffer > 0))
    trashbuffer--
switch state
{
    case (0 << 0):
        with (obj_player)
        {
            if ((other.state == (0 << 0)) && (state != (209 << 0)) && (other.trashbuffer <= 0) && place_meeting(x, y, -2))
            {
                state = (209 << 0)
                if ((character != "NTV"))
                {
                    sprite_index = spr_player_trashstart
                    image_index = 0
                }
                else
                    sprite_index = spr_null
                xscale = other.image_xscale
                other.shot = 0
                other.playerid = id
                other.state = (209 << 0)
                other.sprite_index = spr_trash_flingstart
                other.image_index = 0
            }
        }
        break
    case (209 << 0):
        with (playerid)
        {
            if ((floor(image_index) == (image_number - 1)))
                image_index = (image_number - 3)
        }
        if (!shot)
        {
            playerid.x = x
            playerid.hsp = 0
            playerid.vsp = 0
            switch image_index
            {
                case 0:
                    playerid.y = (y - 56)
                    break
                case 1:
                    playerid.y = (y - 53)
                    break
                case 2:
                    playerid.y = (y - 48)
                    break
                case 3:
                    playerid.y = (y - 44)
                    break
                case 4:
                    playerid.y = (y - 44)
                    break
                case 5:
                    playerid.y = (y - 40)
                    break
                default:
                    playerid.y = (y - 40)
                    break
            }

            if ((floor(image_index) == 10))
            {
                shot = 1
                with (playerid)
                {
                    x = other.x
                    y = other.y
                    sprite_index = spr_player_trashjump
                    image_index = 0
                    movespeed = 0
                    state = (210 << 0)
                    vsp = -25
                    scr_soundeffect(sfx_misc_trashjump2)
                }
            }
        }
        if ((floor(image_index) == (image_number - 1)))
        {
            sprite_index = spr_trash
            state = (0 << 0)
            trashbuffer = 30
        }
        break
}

if ((sprite_index == spr_trash_flingstart) && (image_index <= 9) && (!audio_is_playing(sfx_misc_trashjump1)))
{
    snd_trash = audio_play_sound(sfx_misc_trashjump1, 1, false)
    sfx_gain(snd_trash)
}
else if ((image_index >= 10) && ((sprite_index == spr_trash_flingstart) || (sprite_index != spr_trash_flingstart)))
    audio_stop_sound(snd_trash)
scr_collide()
