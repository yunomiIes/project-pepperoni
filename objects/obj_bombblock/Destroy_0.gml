if ((ds_list_find_index(global.saveroom, id) == -1))
{
    repeat (4)
        create_debris((x + 32), (y + 32), 1153)
    ds_list_add(global.saveroom, id)
}
if ((obj_player1.character == "M") && (!(place_meeting(x, y, obj_canonexplosion))))
    scr_soundeffect(sfx_breakmetal)
