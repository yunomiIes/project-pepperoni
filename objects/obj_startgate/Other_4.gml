switch targetRoom
{
    case 24:
    case 39:
    case 54:
    case 71:
        world = 1
        break
    case 99:
    case 123:
    case 137:
    case 157:
        world = 2
        break
    case 178:
    case 194:
    case 229:
        world = 3
        break
    case 241:
    case 391:
    case 571:
    case 528:
        world = 4
        break
    case 425:
    case 442:
    case 406:
    case 471:
        world = 5
        break
}

ini_open_from_string(obj_savesystem.ini_str)
highscore = ini_read_real("Highscore", string(level), 0)
secret_count = ini_read_string("Secret", string(level), 0)
toppin[0] = ini_read_real("Toppin", (string(level) + "1"), 0)
toppin[1] = ini_read_real("Toppin", (string(level) + "2"), 0)
toppin[2] = ini_read_real("Toppin", (string(level) + "3"), 0)
toppin[3] = ini_read_real("Toppin", (string(level) + "4"), 0)
toppin[4] = ini_read_real("Toppin", (string(level) + "5"), 0)
ini_close()
switch level
{
    case "entrance_1":
        msg = "ENTRANCE"
        break
    case "jingle_medieval":
        msg = "PIZZASCAPE"
        break
    case "jingle_chateau":
        msg = "PIZZASCARE"
        break
    case "jingle_ruin":
        msg = "TEH ANCIENT CHEESE"
        break
    case "jingle_dungeon":
        msg = "BLOODSAUCE DUNGEON"
        break
    case "floorroom":
        msg = "OREGANO DESERT"
        break
    case "jingle_graveyard":
        msg = "THE WASTEYARD"
        break
    case "farm":
        msg = "FUN FARM"
        break
    case "ufo":
        msg = "SPACE PINBALL"
        break
    case "strongcold":
        msg = "STRONGCOLD"
        break
    case "forest":
        msg = "GNOME FOREST"
        break
    case "jingle_beach":
        msg = "PINEAPPLE BEACH"
        break
    case "dragonlair":
        msg = "DRAGON LAIR"
        break
    case "snickchallenge":
        msg = "SNICK CHALLENGE"
        break
}

