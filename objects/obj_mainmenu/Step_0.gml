scr_getinput()
index += 0.1
switch state
{
    case (18 << 0):
        jumpscarecount++
        currentselect = -1
        if (key_jump2 && (!instance_exists(obj_null)))
        {
            state = (8 << 0)
            currentselect = -1
            visualselect = -1
            darkcount = 7
            dark = 0
            darkbuffer = 5
            jumpscarecount = 0
            scr_soundeffect(sfx_groundpound)
            with (obj_music)
            {
            }
        }
        if ((jumpscarecount > 2400) && (!instance_exists(obj_null)))
        {
            instance_create(480, 270, obj_null)
            scr_soundeffect(sfx_jumpscare)
        }
        break
    case (8 << 0):
        if ((darkbuffer > 0))
            darkbuffer--
        else
        {
            dark = (!dark)
            if ((darkcount > 0))
            {
                darkcount--
                if dark
                    darkbuffer = (2 + irandom(3))
                else
                    darkbuffer = (6 + irandom(5))
                if ((darkcount <= 0))
                {
                    dark = 0
                    darkbuffer = 40
                }
            }
            else
            {
                currentselect = 0
                visualselect = 0
                dark = 0
                state = (0 << 0)
                sprite_index = spr_titlepep_forwardtoleft
                image_index = 0
            }
        }
        break
    case (0 << 0):
        if (key_start && (optionbuffer <= 0) && (!instance_exists(obj_option)))
        {
            with (instance_create(0, 0, obj_option))
                backbuffer = 2
            break
        }
        else if (instance_exists(obj_option) || (optionbuffer > 0))
            break
        else
        {
            move = (key_left2 + key_right2)
            if (((sprite_index != spr_titlepep_punch) && (sprite_index != spr_titlepep_angry)) || (move != 0))
            {
                if ((move != 0))
                    angrybuffer = 0
                currentselect += move
                currentselect = clamp(currentselect, 0, 2)
                if ((currentselect != visualselect) && ((sprite_index == spr_titlepep_left) || (sprite_index == spr_titlepep_middle) || (sprite_index == spr_titlepep_right)))
                {
                    visualselect = Approach(visualselect, currentselect, 1)
                    image_index = 0
                    if ((visualselect == 0) && (sprite_index == spr_titlepep_middle))
                        sprite_index = spr_titlepep_middletoleft
                    if ((visualselect == 1) && (sprite_index == spr_titlepep_left))
                        sprite_index = spr_titlepep_lefttomiddle
                    if ((visualselect == 2) && (sprite_index == spr_titlepep_middle))
                        sprite_index = spr_titlepep_middletoright
                    if ((visualselect == 1) && (sprite_index == spr_titlepep_right))
                        sprite_index = spr_titlepep_righttomiddle
                }
                if ((floor(image_index) == (image_number - 1)))
                {
                    switch sprite_index
                    {
                        case spr_titlepep_forwardtoleft:
                        case spr_titlepep_middletoleft:
                            sprite_index = spr_titlepep_left
                            break
                        case spr_titlepep_lefttomiddle:
                        case spr_titlepep_righttomiddle:
                            sprite_index = spr_titlepep_middle
                            break
                        case spr_titlepep_middletoright:
                            sprite_index = spr_titlepep_right
                            break
                    }

                }
            }
            else if ((sprite_index == spr_titlepep_angry))
            {
                y = ystart
                if ((angrybuffer > 0))
                    angrybuffer--
                else
                {
                    sprite_index = savedsprite
                    switch sprite_index
                    {
                        case spr_titlepep_forwardtoleft:
                        case spr_titlepep_middletoleft:
                            sprite_index = spr_titlepep_left
                            break
                        case spr_titlepep_lefttomiddle:
                        case spr_titlepep_righttomiddle:
                            sprite_index = spr_titlepep_middle
                            break
                        case spr_titlepep_middletoright:
                            sprite_index = spr_titlepep_right
                            break
                    }

                    image_index = savedindex
                    image_speed = 0.35
                }
            }
            else
            {
                if ((vsp < 20))
                    vsp += 0.5
                y += vsp
                if ((y >= ystart) && (vsp > 0))
                {
                    y = ystart
                    vsp = 0
                }
            }
            if key_jump
            {
                state = (98 << 0)
                with (obj_menutv)
                {
                    if ((trigger == other.currentselect))
                    {
                        audio_stop_all()
                        scr_soundeffect(sfx_groundpound)
                        state = (98 << 0)
                        sprite_index = confirmspr
                    }
                }
                alarm[0] = 250
                scr_soundeffect(sfx_collectpizza)
                switch currentselect
                {
                    case 0:
                        sprite_index = spr_titlepep_left
                        break
                    case 1:
                        sprite_index = spr_titlepep_middle
                        break
                    case 2:
                        sprite_index = spr_titlepep_right
                        break
                }

            }
            else if key_quit2
            {
                state = (289 << 0)
                exitselect = 1
                switch currentselect
                {
                    case 0:
                        sprite_index = spr_titlepep_left
                        break
                    case 1:
                        sprite_index = spr_titlepep_middle
                        break
                    case 2:
                        sprite_index = spr_titlepep_right
                        break
                }

            }
            else if key_delete
            {
                deletebuffer = 0
                state = (183 << 0)
                deleteselect = 1
                scr_soundeffect(sfx_groundpound)
                switch currentselect
                {
                    case 0:
                        sprite_index = spr_titlepep_left
                        break
                    case 1:
                        sprite_index = spr_titlepep_middle
                        break
                    case 2:
                        sprite_index = spr_titlepep_right
                        break
                }

            }
            break
        }
    case (183 << 0):
        deleteselect += (key_left2 + key_right2)
        deleteselect = clamp(deleteselect, 0, 1)
        if key_jump2
            deletebuffer++
        else
            deletebuffer = 0
        break
    case (289 << 0):
        exitselect += (key_left2 + key_right2)
        exitselect = clamp(exitselect, 0, 1)
        if key_jump
        {
            if ((exitselect == 0))
                game_end()
            else
                state = (0 << 0)
        }
        break
}

if ((optionbuffer > 0))
    optionbuffer--
if ((state != (18 << 0)) && (state != (8 << 0)))
    extrauialpha = Approach(extrauialpha, 1, 0.1)
if ((currentselect == 0))
{
}
if ((currentselect != -1))
{
}
perstatus_icon = -4
if ((state != (18 << 0)) && (state != (8 << 0)))
{
    var a = (floor((abs((percvisual - percentage)) / 10)) + 1)
    percvisual = Approach(percvisual, percentage, a)
}
if ((perstatus_icon > (sprite_get_number(spr_null) - 1)))
    perstatus_icon = (sprite_get_number(spr_null) - 1)
if ((percentage >= 101))
    perstatus_icon = 8
with (obj_menutv)
{
    if ((trigger == other.currentselect))
        selected = 1
    else
        selected = 0
}
if key_slap2
{
    punch_x = (x + irandom_range(-40, 40))
    punch_y = (y + irandom_range(-30, 30))
    event_user(0)
}
