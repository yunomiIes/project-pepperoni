if ((room == rm_editor))
    return;
if ((image_alpha == 1))
{
    if ((other.state != (186 << 0)))
    {
        if ((obj_player1.character == "V"))
            global.playerhealth = clamp((global.playerhealth + 10), 0, 100)
        global.heattime = 60
        with (obj_camera)
            healthshaketime = 60
        global.combotime = 60
        if ((obj_player1.character == "PZ") || (obj_player1.character == "PI"))
            scr_soundeffect(sfx_bigescapeclock)
        else
            scr_soundeffect(sfx_misc_bellcollectbig)
        instance_destroy()
        var val = heat_calculate(100)
        if ((other.object_index == obj_player1))
            global.collect += 100
        else
            global.collectN += 100
        create_collect(x, y, sprite_index)
        with (instance_create((x + 16), y, obj_smallnumber))
            number = 100
    }
}
