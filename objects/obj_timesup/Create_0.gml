grav = 0
hsp = 0
vsp = 0
grounded = 0
image_speed = 0
alarm[0] = 40
global.panic = 0
alarm[1] = 500
platformid = -4
hsp_carry = 0
vsp_carry = 0
if global.checkpoints
    checkpointactive = 1
else
    checkpointactive = 0
global.combo = 0
global.comboscore = 0
instance_destroy(obj_comboend)
instance_destroy(obj_randomsecret)
