if global.panic
{
    instance_destroy()
    return;
}
switch room
{
    case tower_1:
        self.scr_add_grannypizzalevel("jingle_entrance", 0)
        self.scr_add_grannypizzalevel("jingle_medieval", 1)
        self.scr_add_grannypizzalevel("jingle_ruin", 2)
        self.scr_add_grannypizzalevel("jingle_dungeon", 3)
        self.scr_add_grannypizzaboss("w1stick", "b_pepperman", 4)
        break
    case tower_2:
        self.scr_add_grannypizzalevel("badland", 5)
        self.scr_add_grannypizzalevel("jingle_graveyard", 6)
        self.scr_add_grannypizzalevel("farm", 7)
        self.scr_add_grannypizzalevel("jingle_saloon", 8)
        self.scr_add_grannypizzaboss("w2stick", "b_vigilante", 9)
        break
    case tower_3:
        self.scr_add_grannypizzalevel("plage", 10)
        self.scr_add_grannypizzalevel("forest", 11)
        self.scr_add_grannypizzalevel("space", 12)
        self.scr_add_grannypizzalevel("minigolf", 13)
        self.scr_add_grannypizzaboss("w3stick", "b_noise", 14)
        break
    case tower_4:
        self.scr_add_grannypizzalevel("street", 17)
        self.scr_add_grannypizzalevel("industrial", 16)
        self.scr_add_grannypizzalevel("sewer", 15)
        self.scr_add_grannypizzalevel("jingle_freezer", 18)
        self.scr_add_grannypizzaboss("w4stick", "b_fakepep", 19)
        break
    case tower_5:
        self.scr_add_grannypizzalevel("jingle_chateau", 20)
        self.scr_add_grannypizzalevel("kidsparty", 21)
        self.scr_add_grannypizzalevel("war", 22)
        if ((self.quick_ini_read_string("", "Game", "finalrank", "none") != "none"))
            self.scr_add_grannypizzalevel("exit", 23, false, false, false, true)
        break
}

level_xpad = ((sprite_get_width(spr_tutorialbubble) * text_xscale) / (array_length(levelarray) + 1))
