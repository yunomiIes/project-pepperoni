if ((global.switchbuffer == 0) && (global.panic == escape))
{
    with (other)
    {
        hsp = 0
        vsp = 0
        visible = false
        state = (146 << 0)
    }
    scr_soundeffect(sfx_tvswitch)
    create_particle(x, y, (9 << 0))
    sprite_index = spr_gustavoswitch1
    global.switchbuffer = 200
    playerid = other.id
    with (obj_peppinoswitch)
    {
        playerid = other.playerid
        sprite_index = spr_peppinoswitch2
        image_index = 0
    }
    with (instance_create(0, 0, obj_charswitch_intro))
        spr = spr_backtopeppino
}
