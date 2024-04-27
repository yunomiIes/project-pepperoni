scr_getinput()
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
if ((optionselected == 0))
{
    if ((key_right2 || keyboard_check_pressed(vk_right)) && (global.heatingthemeter == 0))
        global.heatingthemeter = 1
    if (((-key_left2) || keyboard_check_pressed(vk_left)) && (global.heatingthemeter == 1))
        global.heatingthemeter = 0
}
if ((optionselected == 1))
{
    if ((key_right2 || keyboard_check_pressed(vk_right)) && (global.elmlapping == 0))
        global.elmlapping = 1
    if (((-key_left2) || keyboard_check_pressed(vk_left)) && (global.elmlapping == 1))
        global.elmlapping = 0
}
if ((optionselected == 2))
{
    if ((key_right2 || keyboard_check_pressed(vk_right)) && (global.elmlapbrick == 0))
        global.elmlapbrick = 1
    if (((-key_left2) || keyboard_check_pressed(vk_left)) && (global.elmlapbrick == 1))
        global.elmlapbrick = 0
}
if ((key_slap2 || keyboard_check_pressed(vk_escape)) && (!instance_exists(obj_keyconfig)) && (!instance_exists(obj_audioconfig)))
{
    scr_soundeffect(sfx_menuselect1, 210, 211)
    if instance_exists(obj_mainmenuselect)
        obj_mainmenuselect.selected = 0
    instance_destroy()
}
