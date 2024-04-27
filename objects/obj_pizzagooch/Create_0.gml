scr_initenemy()
walkspr = spr_pizzaface_angry
idlespr = spr_pizzaface_angry
stunfallspr = spr_pizzaface_stun
scaredspr = spr_pizzaface_dead
spr_dead = spr_pizzaface_dead
grabbedspr = spr_pizzaface_angry
elite = 0
panic = 0
grav = 0.5
destroyable = 1
escape = 0
maxspeed = 8
spd = 0
saved_angle = 0
afterimg = 0
flash = 0
end_turn = 0
shake_timer = 0
state = (141 << 0)
image_speed = 0.35
depth = -50
x = obj_player1.x
y = obj_player1.y
alarm[1] = 10
image_alpha = 0
sprite_index = spr_pizzaface_docile
with (instance_create(x, y, obj_objecticontracker))
{
    objectID = other.id
    sprite_index = spr_pizzafaceicon
}
destroyable = 0
hsp = 0
vsp = 0
grav = 0.5
grounded = 0
platformid = -4
hsp_carry = 0
vsp_carry = 0
scr_collide()
