if ((global.laps >= 1) && global.elmparry)
{
    if ((!collisioned) && other.parryable)
    {
        global.combotime = 60
        if ((global.pizzafaceparrycount == 0))
            global.pizzafacecooldown = 480
        if ((global.pizzafaceparrycount == 1))
            global.pizzafacecooldown = 360
        if ((global.pizzafaceparrycount == 2))
            global.pizzafacecooldown = 180
        var pfid = other.id
        if ((global.pizzafaceparrycount < 3))
        {
            with (instance_create(pfid.x, pfid.y, obj_sausageman_dead))
            {
                if ((obj_player1.character == "PZ") || (obj_player1.character == "PI"))
                    sprite_index = spr_coneball_dead
                else
                    sprite_index = spr_pizzahead_intro1
            }
            scr_soundeffect(sfx_explosion)
            scr_soundeffect(sfx_groundpound)
            instance_destroy(pfid, false)
        }
        else
            pfid.movespeed = -7
        global.pizzafaceparrycount++
        event_user(0)
    }
}
