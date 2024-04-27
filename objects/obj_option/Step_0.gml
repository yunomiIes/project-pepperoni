if ((!instance_exists(obj_keyconfig)) && (!instance_exists(obj_audioconfig)))
    scr_getinput()
if ((!instance_exists(obj_keyconfig)) && (!instance_exists(obj_audioconfig)))
{
    if ((key_up2 || keyboard_check_pressed(vk_up)) && (optionselected > 0))
    {
        optionselected -= 1
        scr_soundeffect(sfx_menumove)
    }
    if ((key_down2 || keyboard_check_pressed(vk_down)) && (optionselected < 4))
    {
        optionselected += 1
        scr_soundeffect(sfx_menumove)
    }
}
if ((optionselected == 0))
{
    if ((key_right2 || keyboard_check_pressed(vk_right)) && (optionsaved_fullscreen == false))
        optionsaved_fullscreen = true
    if (((-key_left2) || keyboard_check_pressed(vk_left)) && (optionsaved_fullscreen == true))
        optionsaved_fullscreen = false
    if (key_jump || keyboard_check_pressed(vk_return))
    {
        window_set_fullscreen((!optionsaved_fullscreen))
        ini_open("saveData.ini")
        global.option_fullscreen = (!optionsaved_fullscreen)
        ini_write_real("Option", "fullscreen", (!optionsaved_fullscreen))
        ini_close()
    }
}
if ((optionselected == 1))
{
    if ((buffer <= 0) && (!instance_exists(obj_modsconfig)))
    {
        if (key_jump || keyboard_check_pressed(vk_return))
        {
            visible = false
            with (instance_create(x, y, obj_modsconfig))
                depth = (other.depth - 1)
        }
    }
}
if ((optionselected == 2))
{
    if (key_jump || keyboard_check_pressed(vk_return) || keyboard_check_pressed(vk_return))
        scr_soundeffect(sfx_nothing)
}
if ((buffer > 0))
    buffer--
if ((optionselected == 3))
{
    if ((buffer <= 0) && (!instance_exists(obj_audioconfig)))
    {
        if (key_jump || keyboard_check_pressed(vk_return))
        {
            visible = false
            with (instance_create(x, y, obj_audioconfig))
                depth = (other.depth - 1)
        }
    }
}
if ((optionselected == 4))
{
    if ((key_right2 || keyboard_check_pressed(vk_right)) && (optionsaved_vibration == 0))
        optionsaved_vibration = 1
    if (((-key_left2) || keyboard_check_pressed(vk_left)) && (optionsaved_vibration == 1))
        optionsaved_vibration = 0
    if (key_jump || keyboard_check_pressed(vk_return))
    {
        ini_open("saveData.ini")
        global.option_vibration = (!optionsaved_vibration)
        ini_write_real("Option", "vibration", (!optionsaved_vibration))
        ini_close()
    }
}
if ((key_slap2 || keyboard_check_pressed(vk_escape)) && (!instance_exists(obj_keyconfig)) && (!instance_exists(obj_audioconfig)))
{
    scr_soundeffect(sfx_menuselect1, 210, 211)
    if instance_exists(obj_mainmenuselect)
        obj_mainmenuselect.selected = 0
    instance_destroy()
}
