depth = -100
sprite_index = spr_lowface
image_speed = 0.35
image_alpha = 0
alarm[0] = 10
coneballspeed = 1
parryspeed = 1
x = obj_player1.x
y = obj_player1.y
dis = 800
mindis = 150
dir = 0
attacking = 0
atktimer = 250
projcool = 5
fading = 0
alpha = 1
attack = 1
lastframexdistance = 0
lastframeydistance = 0
hsp = 0
vsp = 0
if global.pizzafaceicon
{
    with (instance_create(x, y, obj_objecticontracker))
    {
        objectID = other.id
        sprite_index = spr_pizzafaceicon
    }
}
