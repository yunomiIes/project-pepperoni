var target = obj_player1.id
image_speed = obj_player1.image_speed
x = target.x
y = target.y
if ((target == obj_player1.id))
{
    image_xscale = (target.xscale * target.scale_xs)
    image_yscale = (target.yscale * target.scale_ys)
}
else
{
    image_xscale = target.image_xscale
    image_yscale = target.image_yscale
}
visible = target.visible
image_alpha = target.image_alpha
image_blend = target.image_blend
depth = 0
if ((obj_player1.character != "NTV"))
    instance_destroy()
if (((target == obj_player1.id) && ((obj_player1.state == (94 << 0)) || (obj_player1.state == (210 << 0)))) || (room == rank_room))
    visible = false
visible = false
