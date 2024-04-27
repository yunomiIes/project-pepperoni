switch targetRoom
{
    case 241:
        global.levelcompletename = "SPACE"
        break
    case 194:
        global.levelcompletename = "FOREST"
        break
    case 244:
        global.levelcompletename = "CHATEAU"
        break
    default:
        global.levelcompletename = -4
        break
}

if global.panic
    return;
with (obj_player1)
{
    if (place_meeting(x, y, -2) && key_up && grounded && ((state == (0 << 0)) || (state == (103 << 0)) || (state == (104 << 0)) || (state == (121 << 0))) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && (state != (98 << 0)) && (state != (95 << 0)) && (obj_player1.spotlight == 1))
    {
        with (obj_music)
        {
            audio_sound_gain(music, 0, 1415)
            if ((audio_sound_get_gain(music) <= 0))
                audio_stop_sound(music)
        }
        global.leveltosave = other.level
        backtohubstartx = x
        backtohubstarty = y
        backtohubroom = room
        mach2 = 0
        obj_camera.chargecamera = 0
        image_index = 0
        state = (98 << 0)
        obj_player2.backtohubstartx = x
        obj_player2.backtohubstarty = y
        obj_player2.backtohubroom = room
        if ((global.coop == 1))
        {
            with (obj_player2)
            {
                x = obj_player1.x
                y = obj_player1.y
                mach2 = 0
                obj_camera.chargecamera = 0
                image_index = 0
                state = (98 << 0)
            }
        }
    }
}
with (obj_player2)
{
    if (place_meeting(x, y, -2) && key_up && grounded && ((state == (0 << 0)) || (state == (103 << 0)) || (state == (104 << 0)) || (state == (121 << 0))) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && (state != (98 << 0)) && (state != (95 << 0)) && (obj_player1.spotlight == 0))
    {
        audio_stop_all()
        global.leveltosave = other.level
        backtohubstartx = x
        backtohubstarty = y
        backtohubroom = room
        mach2 = 0
        obj_camera.chargecamera = 0
        image_index = 0
        state = (98 << 0)
        obj_player1.backtohubstartx = x
        obj_player1.backtohubstarty = y
        obj_player1.backtohubroom = room
        if ((global.coop == 1))
        {
            with (obj_player1)
            {
                x = obj_player2.x
                y = obj_player2.y
                mach2 = 0
                obj_camera.chargecamera = 0
                image_index = 0
                state = (98 << 0)
            }
        }
    }
}
with (obj_player1)
{
    if ((state == (98 << 0)) && key_taunt2)
        other.level = "deathmode"
}
if (((floor(obj_player1.image_index) == (obj_player1.image_number - 1)) && (obj_player1.state == (98 << 0))) || ((floor(obj_player2.image_index) == (obj_player2.image_number - 1)) && (obj_player2.state == (98 << 0))))
{
    with (obj_player)
    {
        if ((other.level == "snickchallenge"))
        {
            if (!audio_is_playing(mu_snickchallenge))
                scr_sound(mu_snickchallenge)
            global.wave = 0
            global.maxwave = (((global.minutes * 60) + global.seconds) * 60)
            if global.panicbg
                scr_panicbg_init()
            global.snickchallenge = 1
            global.collect = 10000
            with (obj_camera)
            {
                alarm[1] = 60
                global.seconds = 59
                global.minutes = 9
            }
        }
        if ((other.level == "deathmode"))
        {
            global.death_mode = 1
            global.laps = 6
            if (!instance_exists(obj_pizzagooch))
                instance_create(obj_player1.x, obj_player1.y, obj_pizzagooch)
            if (!audio_is_playing(mu_deathmode))
                scr_sound(mu_deathmode)
            instance_create_unique(0, 0, 934)
            with (obj_deathmodetimer)
                active = 1
        }
        obj_music.fadeoff = 0
        targetDoor = "A"
        targetRoom = other.targetRoom
        global.leveltorestart = other.targetRoom
        if (!instance_exists(obj_fadeout))
            instance_create(x, y, obj_fadeout)
    }
}
