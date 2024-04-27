if ((other.state != (186 << 0)))
{
    if ((obj_player1.character == "V"))
        global.playerhealth = clamp((global.playerhealth + 10), 0, 100)
    global.heattime = 60
    with (obj_camera)
        healthshaketime = 60
    scr_soundeffect(sfx_collectgiantpizza)
    instance_destroy()
    global.combotime = 60
    var val = heat_calculate(1000)
    if ((other.object_index == obj_player1))
        global.collect += 1000
    else
        global.collectN += 1000
    create_collect(x, y, sprite_index)
    with (instance_create((x + 16), y, obj_smallnumber))
        number = 1000
    tv_do_expression(748)
}
