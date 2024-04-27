if ((other.state != (186 << 0)))
{
    if ((obj_player1.character == "V"))
        global.playerhealth = clamp((global.playerhealth + 10), 0, 100)
    global.heattime = 60
    with (obj_camera)
        healthshaketime = 60
    scr_soundeffect(sfx_collectpizza)
    if (other.isgustavo && (irandom(100) <= 70))
        scr_soundeffect(sfx_Voice06, 220, 221, 222)
    if ((other.character == "NTV"))
        scr_soundeffect(sfx_Noise5, 337, 338)
    instance_destroy()
    global.combotime = 60
    var val = heat_calculate(100)
    if ((other.object_index == obj_player1))
        global.collect += 100
    else
        global.collectN += 100
    create_collect(x, y, sprite_index)
    with (instance_create((x + 16), y, obj_smallnumber))
        number = 100
    if ((obj_player1.character == "N") || (obj_player1.character == "NTV") || ((obj_player1.character == "P") && (!obj_player1.ispeppino)))
        tv_do_expression(4265)
    else if ((obj_player1.character == "PZ"))
        tv_do_expression(4413)
    else
        tv_do_expression(748)
}
