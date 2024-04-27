var _first = true
if _first
{
    bossspr = spr_vsfakepep2
    vstitle = 2975
}
else
{
    bossspr = spr_vsfakepep
    vstitle = spr_vstitle_fakepep
}
boss_hp = 10
boss_hpsprite = spr_bossfight_fakepephp
boss_palette = 3140
boss_columnmax = 3
boss_hp_x += 50
boss_func = function() //gml_Script_anon_gml_RoomCC_boss_fakepep_1_Create_541_gml_RoomCC_boss_fakepep_1_Create
{
    var eh = 0
    var p = 0
    with (obj_fakepepboss)
    {
        eh = elitehit
        p = phase
    }
    if ((p == 1))
        boss_hp = eh
    else if ((p == 2))
        boss_hp = eh
    else if ((p == 0))
    {
        boss_hp = 0
        if ((room == boss_fakepephallway))
            boss_hp = 1
    }
}

