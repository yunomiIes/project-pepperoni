wave = [[0, (277 << 0), [458]]]
enemy_array = []
enemlimit = 2
prevROUND = -99
max_wave_array = 0
scripted_count = 0
random_arr = []
enemyID = -4
buffer = 0
activeat = 0
manualintensity = 0
disableat = -4
image_speed = 0
visible = false
enemy_arr = -4
state = (0 << 0)
with (instance_create(x, y, obj_objecticontracker))
{
    objectID = other.id
    sprite_index = spr_icon_ghostjohn
}
