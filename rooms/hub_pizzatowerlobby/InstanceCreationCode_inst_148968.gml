if ((global.entrancecutscene == -4))
    global.entrancecutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "jingle_entrance", 0)
if global.entrancecutscene
{
    destroy = 0
    instance_destroy()
}
