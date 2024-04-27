countdown -= 0.5
if (place_meeting((x + 1), y, obj_bombblock) || place_meeting((x - 1), y, obj_bombblock) || place_meeting(x, (y - 1), obj_bombblock) || place_meeting(x, (y + 1), obj_bombblock))
{
    instance_destroy()
    instance_create(x, y, obj_canonexplosion)
}
if (scr_solid((x + 1), y) || scr_solid((x - 1), y))
    drop = 1
if scr_solid(x, (y + 1))
    hsp = 0
if ((vsp < 12))
    vsp += grav
if ((countdown < 50))
    sprite_index = spr_bomblitsage
if ((place_meeting(x, y, obj_player1) && (obj_player1.state != (51 << 0)) && ((obj_player1.state == (42 << 0)) || (obj_player1.state == (80 << 0)))) || (place_meeting(x, y, obj_player1) && (obj_player1.character == "S") && (obj_player1.state != (51 << 0))) || (place_meeting(x, y, obj_player1) && (obj_player1.character == "V") && obj_player1.key_slap2))
{
    instance_destroy()
    with (obj_player1)
    {
        state = (51 << 0)
        bombpeptimer = 150
        sprite_index = spr_bombpepintro
    }
}
if ((countdown == 0))
{
    instance_destroy()
    instance_create(x, y, obj_canonexplosion)
}
scr_collide()
