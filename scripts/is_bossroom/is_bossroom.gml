function is_bossroom() //gml_Script_is_bossroom
{
    return ((room == boss_pepperman) ? true : ((room == boss_noise) ? true : ((room == boss_vigilante) ? true : ((room == boss_mrstick) ? true : ((room == boss_pizzaface) ? true : (room == boss_pizzaface_p3))))));
}

