function scr_player_morthook() //gml_Script_scr_player_morthook
{
    jumpstop = 1
    doublejump = 0
    hsp = 0
    vsp = 0
    if (!instance_exists(morthookID))
    {
        state = (12 << 0)
        sprite_index = spr_pmortfall
        return;
    }
    image_speed = 0.35
    x = Approach(x, morthookID.x, movespeed)
    y = Approach(y, morthookID.y, movespeed)
    if ((floor(x) == morthookID.x) && (floor(y) == morthookID.y))
    {
        scr_soundeffect(sfx_morthook)
        state = (12 << 0)
        sprite_index = spr_mortdoublejumpstart
        image_index = 0
        vsp = -14
        repeat (4)
            create_debris(x, y, 1178)
        movespeed = (xscale * 12)
        with (morthookID)
            projectilebuffer = 20
    }
    if ((sprite_index == spr_playerN_mortthrow) && (floor(image_index) == (image_number - 1)))
        image_index = (image_number - 1)
}

