var enem_left = 0
var proceed_bad = 1
with (obj_baddie)
{
    if ((arenaID != -4))
    {
        proceed_bad = 0
        enem_left++
    }
}
var proceed_spawner = 1
with (obj_arenaspawner)
{
    if ((current_enem < array_length(enemy_array)))
        proceed_spawner = 0
    enem_left += (array_length(enemy_array) - current_enem)
}
enemies_left = enem_left
if (proceed_bad && proceed_spawner && (showround == 0))
{
    showround = 1
    alarm[0] = 120
    alarm[1] = 20
    instance_destroy(obj_ammocollect)
}
maxtime = (global.arena_perks.time ? 2100 : 1800)
var timermv = 1
timermv += (global.arenaintensity / 7)
timermv = round(timermv)
if global.arena_perks.time
    timermv /= 1.5
if ((time > 0) && (!showround) && (global.arenaphase != 1))
    time -= timermv
barfill_x -= 0.4
bell_index += 0.35
if ((barfill_x < -23))
    barfill_x = 0
if ((bell_index > (sprite_get_number(bell_sprite) - 1)))
    bell_index = frac(bell_index)
if ((time > 0) && (!dead))
{
    showtime_buffer = 100
    if ((global.arenaphase > 1))
        timer_y = lerp(timer_y, timer_ystart, 0.1)
    else
        timer_y = lerp(timer_y, (timer_ystart + 212), 0.1)
}
else
{
    dead = 1
    if ((bell_sprite == spr_bosstimer_bell))
    {
        bell_sprite = spr_bosstimer_hitbell
        bell_index = 0
    }
    else if ((showtime_buffer > 0))
        showtime_buffer--
    else
        timer_y = Approach(timer_y, (timer_ystart + 212), 1)
}
if (dead && (!instance_exists(obj_pizzaface)))
{
    instance_create(obj_player1.x, obj_player1.y, obj_pizzaface)
    scr_soundeffect(sfx_pizzaface)
}
time = clamp(time, 0, maxtime)
global.arenaintensity = floor((global.arenaphase / 3))
