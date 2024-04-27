if (!global.cheat_pizzagooch)
    return;
if instance_exists(other.baddieID)
{
    var bID = id
    var bID2 = other.baddieID
    if ((!bID.thrown) && (bID.state != (137 << 0)) && (bID2.state != (4 << 0)) && (bID.state != (4 << 0)) && (bID.invtime <= 0) && (!bID.invincible) && bID.instantkillable && bID.killbyenemy && (bID != bID2) && bID2.thrown)
    {
        scr_soundeffect(sfx_punch)
        with (bID)
        {
            state = (138 << 0)
            fake_thrown = 1
            stunned = 100
            hitvsp = -8
            hithsp = ((-bID2.image_xscale) * 15)
            hsp = hithsp
            vsp = hitvsp
            shake_timer = 5
            invtime = 5
        }
    }
}
