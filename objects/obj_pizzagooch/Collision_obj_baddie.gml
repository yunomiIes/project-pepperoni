if (!global.cheat_pizzagooch)
    return;
if ((!other.invincible) && (other.invtime <= 0) && (other.state != (4 << 0)) && other.instantkillable && other.killbyenemy && (id != other.id) && (id.thrown || id.fake_thrown) && (id.state == (138 << 0)))
    instance_destroy(other.id)
