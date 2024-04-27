if ((state == (4 << 0)))
    scr_enemy_grabbed()
else if ((state == (43 << 0)))
    scr_enemy_lungeattack()
else if ((state == (266 << 0)))
    scr_enemy_secret()
scr_squash()
if ((state != (138 << 0)) && (state != (137 << 0)))
    linethrown = 0
if ((state == (138 << 0)) && (!thrown))
    linethrown = 0
if ((object_index != obj_pizzaball) && (place_meeting((x + 1), y, obj_spike) || place_meeting((x - 1), y, obj_spike) || place_meeting(x, (y + 1), obj_spike) || place_meeting(x, (y - 1), obj_spike)))
    instance_destroy()
if ((state != (4 << 0)) && (state != (154 << 0)) && (object_index != obj_pepbat) && (object_index != obj_ghoul) && (object_index != obj_fakesanta) && use_collision)
    scr_collide()
if ((invtime > 0))
    invtime--
if ((sprite_index == walkspr) && (hsp != 0) && (floor(image_index) == (image_number - 1)) && (object_index != obj_ghoul))
    create_particle((x - (image_xscale * 20)), (y + 43), (1 << 0), 0)
if ((object_index != obj_pizzice) || (state != (129 << 0)))
{
    if ((state == (134 << 0)))
        image_speed = 0.35
    else if ((state != (128 << 0)))
        image_speed = 0.35
}
if ((dodgebuffer > 0))
    dodgebuffer--
with (instance_nearest(x, y, obj_player))
{
    if ((state == (84 << 0)))
    {
        other.stunned = 0
        if ((other.state != (129 << 0)) && (!other.provoked) && (other.bombreset > 0))
        {
            other.bombreset = 0
            other.provoked = 1
        }
        other.scaredbuffer = 0
    }
    else if ((other.state != (129 << 0)))
        other.provoked = 0
}
if ((y > (room_height + 100)))
    instance_destroy()
if (thrown && ((x > (room_width + 100)) || (x < -100) || (y < -100)))
    instance_destroy()
if ((global.laps >= 6))
{
    elite = 1
    whoopass = 1
}
if ((global.heatingthemeter == 1) && (global.stylethreshold >= 3) && instance_exists(obj_baddie))
{
    with (obj_baddie)
    {
        elite = 1
        whoopass = 1
    }
}
else if ((global.stylethreshold >= 2) && instance_exists(obj_baddie) && (global.heatingthemeter == 1))
{
    with (obj_baddie)
    {
        elite = 0
        whoopass = 0
    }
}
else if ((global.stylethreshold >= 1) && instance_exists(obj_baddie) && (global.heatingthemeter == 1))
{
    with (obj_baddie)
    {
        elite = 0
        whoopass = 0
    }
}
else if ((global.stylethreshold >= 4) && instance_exists(obj_baddie) && (global.heatingthemeter == 1))
{
    elite = 1
    whoopass = 1
}
