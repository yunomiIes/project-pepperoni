scene = -2
scenebuffer = 0
instance_destroy(obj_pigtotal)
text = " "
showtext = 0
skipbuffer = 0
startbuffer = 0
with (instance_create((room_width / 2), (room_height / 2), obj_logoprop))
{
    depth = -1
    sprite_index = spr_intro_tourdepizza
}
with (obj_player)
    state = (18 << 0)
