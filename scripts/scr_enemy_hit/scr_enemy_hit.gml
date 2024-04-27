function scr_enemy_hit() //scr_enemy_hit
{
    x = (hitX + random_range(-6, 6))
    y = (hitY + random_range(-6, 6))
    hitLag--
    sprite_index = stunfallspr
    if ((hitLag <= 0))
    {
        x = hitX
        y = hitY
        var _player = -4
        if ((grabbedby == 1))
            _player = 349
        else
            _player = 323
        if ((obj_player.tauntstoredstate == (104 << 0)) || (obj_player.tauntstoredstate == (5 << 0)) || (obj_player.state == (104 << 0)) || (obj_player.state == (5 << 0)))
            thrown = 0
        else
            thrown = 1
        vsp = hitvsp
        hsp = hithsp
        global.hit += 1
        if ((other.object_index == obj_pizzaball))
            global.golfhit += 1
        global.combotime = 60
        global.heattime = 60
        alarm[1] = 5
        var _hp = 0
        if (((global.attackstyle == 3) || (global.attackstyle == 0)) && (!global.kungfu))
            _hp = -1
        if ((((!elite) && (((hp <= _hp) && (!elite)) || (mach3destroy && (elitehit <= 0)))) || (elite && (elitehit <= 0) && mach3destroy)) && (object_get_parent(object_index) != 16) && destroyable)
        {
            elitehit--
            if ((elitehit < 0))
                elitehit = 0
            if ((elitehit > 0))
            {
                event_perform(ev_destroy, 0)
                var b = ds_list_find_index(global.baddieroom, id)
                if ((b != -1))
                    ds_list_delete(global.baddieroom, b)
                image_xscale *= -1
                hsp = (5 * (-image_xscale))
                flash = 0
            }
            else if ((elitehit <= 0))
            {
                instance_destroy()
                instance_create(x, y, obj_genericpoofeffect)
            }
        }
        stunned = 200
        state = (138 << 0)
    }
    return;
}

