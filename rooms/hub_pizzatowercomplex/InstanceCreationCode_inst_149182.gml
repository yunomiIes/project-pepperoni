if ((global.dungeoncutscene == -4))
    global.dungeoncutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "jingle_dungeon", 0)
if (!global.dungeoncutscene)
    instance_destroy()
