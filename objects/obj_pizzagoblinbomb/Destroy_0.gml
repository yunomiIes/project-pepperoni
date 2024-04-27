if ((destroy && (obj_player1.character != "NTV")) || (destroy && (obj_player1.character == "NTV") && (!global.newnoisetransfo)))
{
    with (instance_create(x, y, obj_canonexplosion))
        rat = other.grabbable
}
if ((obj_player1.character == "NTV") && global.newnoisetransfo)
{
    instance_create(x, y, obj_playerexplosion)
    scr_soundeffect(sfx_explosion)
}
