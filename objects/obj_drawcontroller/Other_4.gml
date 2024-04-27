if ((room != kidsparty_entrance1))
{
    var roomname = room_get_name(room)
    roomname = string_letters(roomname)
    if ((roomname == "kidspartyfloor") || (roomname == "kidspartyentrance") || (room == tower_5))
    {
        kidsparty_lightning = 1
        dark_lightning = 0
    }
    else
    {
        kidsparty_lightning = 0
        dark_lightning = 0
    }
}
else
{
    kidsparty_lightning = 0
    dark_lightning = 0
}
if ((room == dungeon_5) || (room == dungeon_6))
    use_dark = 1
else
    use_dark = 0
