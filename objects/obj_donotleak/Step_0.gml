with (obj_player)
{
    if (key_taunt2 || key_slap2)
    {
        scr_soundeffect(sfx_menulightswitch)
        scr_soundeffect(sfx_secretfound)
        scr_room_goto(tower_playtestbuild)
    }
}
