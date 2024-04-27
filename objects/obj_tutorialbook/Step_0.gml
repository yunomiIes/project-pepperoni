if (global.panic && (!donepanic))
{
    donepanic = true
    text = "GET OUT NOW!!!"
    event_perform(ev_other, ev_room_start)
}
text_xscale = ((window_get_width() - 64) / sprite_get_width(spr_tutorialbubble))
wave_timer += 20
if ((text_xscale != text_oldxscale))
    event_perform(ev_other, ev_room_start)
if showgranny
{
    if ((voicecooldown > 1))
        voicecooldown--
    else if (!(place_meeting(x, y, obj_player)))
        voicecooldown = 0
    if place_meeting(x, y, obj_player)
    {
        sprite_index = spr_tutorialgranny_talk
        if ((voicecooldown == 0))
        {
            scr_soundeffect(sfx_pizzagranny1, 24, 20)
            voicecooldown = 100
        }
    }
    else
        sprite_index = spr_tutorialgranny_sleep
}
var _hide = false
with (obj_grannypizzasign)
{
    if ((text_state != (18 << 0)))
        _hide = true
}
if instance_exists(obj_mrsticknotification)
    _hide = true
switch text_state
{
    case (18 << 0):
        repeat (_hide + 1)
            text_y = Approach(text_y, (-((text_sprite_height * text_yscale))), 5)
        if (place_meeting(x, y, obj_player) && (!_hide))
        {
            text_state = (135 << 0)
            text_vsp = 0
        }
        break
    case (135 << 0):
        text_y += text_vsp
        if ((text_vsp < 20))
            text_vsp += 0.5
        if ((text_y > text_ystart))
            text_state = (0 << 0)
        break
    case (0 << 0):
        text_y = Approach(text_y, text_ystart, 2)
        if ((!(place_meeting(x, y, obj_player))) || _hide)
            text_state = (18 << 0)
        break
}

text_wave_x = Wave(-5, 5, 2, 10, wave_timer)
text_wave_y = Wave(-1, 1, 4, 0, wave_timer)
