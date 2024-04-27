ds_list_add(global.saveroom, id)
global.gerome = 1
instance_create(x, y, obj_geromefollow)
instance_destroy()
if ((obj_player1.character != "PZ") && (obj_player1.character != "PI"))
{
    if (!audio_is_playing(sfx_GeromeGot))
        scr_soundeffect(sfx_GeromeGot)
}
else if ((obj_player1.character == "PZ") || (obj_player1.character == "PI"))
{
    if (!audio_is_playing(sfx_toppingotSP))
        scr_soundeffect(sfx_toppingotSP)
}
