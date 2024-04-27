var _found = 0
var total_count = 0
with (obj_baddie)
{
    total_count++
    if ((arenaID == other.id))
        _found++
}
if ((prevROUND != global.arenaphase))
{
    prevROUND = global.arenaphase
    current_enem = 0
    var formula_for_total_enem = ((0.04 * power(global.arenaphase, 2)) + 1)
    formula_for_total_enem = clamp(round(formula_for_total_enem), 2, 70)
    var enemy_limit = clamp(round((formula_for_total_enem / 3)), 1, 5)
    var i = 0
    while ((i < array_length(wave)))
    {
        var _round = wave[i][0]
        if ((global.arenaphase == _round))
        {
            max_wave_array = i
            break
        }
        else
            i++
    }
    enemy_array = []
    var enemy_a = wave[max_wave_array][2]
    var cur_type = wave[max_wave_array][1]
    if ((enemy_a != noone))
    {
        if ((cur_type == (277 << 0)))
            enemy_array = enemy_a
        else
        {
            repeat formula_for_total_enem
                array_push(enemy_array, enemy_a[irandom((array_length(enemy_a) - 1))])
        }
    }
    enemlimit = enemy_limit
}
var type = wave[max_wave_array][1]
var enem = wave[max_wave_array][2]
switch state
{
    case (0 << 0):
        var proceed = 0
        if ((current_enem < array_length(enemy_array)))
            proceed = 1
        if ((floor(image_index) == (image_number - 1)) && proceed)
            image_speed = 0
        var in_cam = (bbox_in_camera(view_camera[0], 100) ? true : (_found < 2))
        var enem_max = ((instance_number(obj_baddie) < 10) ? true : (total_count < 10))
        if (proceed && (enem != -4) && (_found < enemlimit) && enem_max && in_cam && (!(place_meeting(x, y, obj_player1))))
        {
            state = (39 << 0)
            image_index = 0
            visible = true
            image_speed = 0.35
        }
        if ((floor(image_index) == (image_number - 1)))
        {
            visible = false
            image_speed = 0
        }
        break
    case (39 << 0):
        if ((floor(image_index) > 5))
        {
            state = (0 << 0)
            var enem_create = enemy_array[current_enem]
            current_enem++
            if ((enem_create != obj_nothing))
            {
                with (instance_create((x + random_range(-25, 25)), (y + random_range(-25, 25)), enem_create))
                {
                    arenaID = other.id
                    state = (138 << 0)
                    vsp = -3
                    sprite_index = stunfallspr
                    stunned = 5
                    boundbox = 0
                    event_perform(ev_other, ev_room_start)
                }
            }
        }
        break
}

