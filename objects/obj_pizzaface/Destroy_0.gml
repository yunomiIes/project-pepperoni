with (instance_create(x, y, obj_shakeanddie))
{
    if ((obj_player1.character == "PZ") || (obj_player1.character == "PI"))
        sprite_index = spr_coneball_new
    else
        sprite_index = spr_pizzahead_intro1
}
scr_soundeffect(sfx_explosion)
scr_soundeffect(sfx_groundpound)
