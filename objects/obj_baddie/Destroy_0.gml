if ((room == rm_editor))
    return;
if ((ds_list_find_index(global.baddieroom, id) == -1) && ((!elite) || (elitehit <= 0)))
{
    if ((object_index != obj_peppinoclone) && (object_index != obj_ghoul))
    {
        with (instance_create(x, y, obj_sausageman_dead))
        {
            sprite_index = other.spr_dead
            spr_palette = other.spr_palette
            paletteselect = other.paletteselect
        }
    }
    else if ((object_index == obj_peppinoclone))
    {
        with (instance_create(x, y, obj_explosioneffect))
        {
            image_speed = 0.35
            depth = other.depth
            sprite_index = spr_pepclone_death
            image_xscale = other.image_xscale
        }
    }
    else if ((object_index == obj_ghoul))
    {
        var i = 0
        repeat sprite_get_number(spr_ghoul_gibs)
        {
            with (create_debris(x, y, 2538))
            {
                image_index = i
                vsp = (-(irandom_range(10, 14)))
            }
            i++
        }
    }
    if ((object_index == obj_sausageman) && (whoopass == 1))
    {
        with (instance_create(x, y, obj_whoopB))
        {
            create_particle(x, y, (9 << 0))
            vsp = -11
        }
    }
    if ((object_index == obj_tank))
    {
        repeat (3)
        {
            with (instance_create(x, y, obj_sausageman_dead))
                sprite_index = other.spr_content_dead
        }
    }
}
if ((ds_list_find_index(global.baddieroom, id) == -1) && (important == 0))
{
    if ((!elite) || (elitehit <= 0))
    {
        with (obj_player1)
            supercharge += 1
    }
    if ((!elite) || (elitehit <= 0))
        global.combo += 1
    if instance_exists(obj_hardmode)
        global.heatmeter_count++
    if ((!elite) || (elitehit <= 0))
    {
        var combototal = (10 + round((10 * (global.combo * 0.5))))
        global.collect += combototal
        global.comboscore += combototal
    }
    if ((obj_player1.character != "PZ") && (obj_player1.character != "PI"))
        scr_soundeffect(sfx_killenemy)
    else if ((obj_player1.character == "PZ") || (obj_player1.character == "PI"))
    {
        if ((global.combo == 0))
            scr_soundeffect(sfx_combo1)
        else if ((global.combo == 1))
            scr_soundeffect(sfx_combo1)
        else if ((global.combo == 2))
            scr_soundeffect(sfx_combo2)
        else if ((global.combo == 3))
            scr_soundeffect(sfx_combo3)
        else if ((global.combo > 4) || (global.combo == 4))
            scr_soundeffect(sfx_combo4)
    }
    repeat (3)
    {
        with (create_debris(x, y, 1170))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
        }
    }
    instance_create(x, y, obj_bangeffect)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    ds_list_add(global.baddieroom, id)
    if escape
        ds_list_add(global.escaperoom, id)
}
else if ((ds_list_find_index(global.baddieroom, id) == -1) && (important == 1))
{
    trace("destroy unimportant")
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    scr_soundeffect(sfx_killenemy)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    ds_list_add(global.baddieroom, id)
}
if ((room == sucrose_1) || (string_copy(room_get_name(room), 1, 7) == "sucrose"))
{
    with (obj_sucrosetimer)
    {
        minutes += 0
        seconds += 2
    }
}
if instance_exists(obj_lowface)
    global.lowfacefill += 150
