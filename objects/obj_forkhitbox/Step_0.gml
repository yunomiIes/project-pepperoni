if (!instance_exists(ID))
{
    instance_destroy()
    return;
}
x = ID.x
y = ID.y
image_xscale = ID.image_xscale
image_yscale = ID.image_yscale
with (ID)
{
    if ((object_index == obj_coolpineapple) || (object_index == obj_ghostknight) || (object_index == obj_forknight) || (object_index == obj_noisey) || (object_index == obj_smokingpizzaslice) || (object_index == obj_knight))
    {
        if ((state != (134 << 0)) && (state != (125 << 0)))
        {
            hitboxcreate = 0
            instance_destroy(-2)
        }
    }
    switch object_index
    {
        case obj_pepperman:
            other.x = (x + (image_xscale * 8))
            if ((state != (153 << 0)))
                instance_destroy(-2)
            break
        case obj_badrat:
            other.x = (x + (image_xscale * 16))
            if ((state != (80 << 0)))
                instance_destroy(-2)
            break
        case obj_farmerbaddie:
        case obj_farmerbaddie2:
        case obj_farmerbaddie3:
            other.x = (x + (image_xscale * 16))
            if ((state != (80 << 0)))
                instance_destroy(-2)
            break
        case obj_peppinoclone:
            other.x = (x - (image_xscale * 10))
            if ((state != (80 << 0)))
                instance_destroy(-2)
            break
        case obj_motodude:
            other.x = (x + (image_xscale * 32))
            break
        case obj_robot:
            if ((state != (104 << 0)) && (state != (23 << 0)) && (state != (91 << 0)))
            {
                hitboxcreate = 0
                instance_destroy(-2)
            }
            else if ((state == (23 << 0)))
                other.x = (x + (image_xscale * 32))
            else if ((state == (104 << 0)) || (state == (91 << 0)))
                other.x = (x + (image_xscale * 20))
            break
        case obj_soldier:
            other.x = (x + (image_xscale * 24))
            if ((state != (125 << 0)))
                instance_destroy(-2)
            break
        case obj_indiancheese:
            if ((state != (134 << 0)) && (sprite_index != spr_indiancheese_howl))
            {
                hitboxcreate = 0
                instance_destroy(-2)
            }
            break
        case obj_thug_red:
        case obj_thug_blue:
        case obj_thug_green:
            if ((state != (80 << 0)))
            {
                instance_destroy(-2)
                punchinst = -4
            }
            break
        case obj_weeniesquire:
            if ((state != (80 << 0)))
            {
                hitboxcreate = 0
                instance_destroy(-2)
            }
            break
        case obj_minijohn:
            if ((state != (125 << 0)) && (state != (80 << 0)))
                instance_destroy(-2)
            break
        case obj_ninja:
            if ((state != (128 << 0)) && (state != (80 << 0)))
                instance_destroy(-2)
            if ((state == (80 << 0)))
            {
                if ((image_index > 14))
                    instance_destroy(-2)
                other.x = (x + (image_xscale * 24))
            }
            break
        case obj_boulder:
            if (!hitwall)
                instance_destroy(-2)
            break
        case obj_snickexelap:
        case obj_snickexe:
            if (obj_player1.instakillmove || (obj_player1.state == (42 << 0)))
            {
                instance_destroy(-2)
                hitboxcreate = 0
            }
            break
        case obj_pickle:
            if ((state != (129 << 0)))
                instance_destroy(-2)
            break
        case obj_peasanto:
        case obj_fencer:
        case obj_snowman:
        case obj_ancho:
            if ((state != (128 << 0)) && (state != (125 << 0)))
            {
                hitboxcreate = 0
                instance_destroy(-2)
            }
            break
        case obj_snowman:
            if ((global.noisejetpack && (obj_player1.character != "NTV")) || ((obj_player1.character == "NTV") && obj_player1.pizzapepperN && global.noisejetpack))
            {
                hitboxcreate = 0
                instance_destroy(-2)
            }
            break
        case obj_ghostknight:
            if ((state != (134 << 0)) || (obj_player.holycross > 0))
            {
                hitboxcreate = 0
                instance_destroy(-2)
            }
            break
    }

}
