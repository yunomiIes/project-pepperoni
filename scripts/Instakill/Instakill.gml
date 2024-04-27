function Instakill() //Instakill
{
    if ((other.baddieID.elitegrab == 0))
    {
        other.baddieID.grabbedby = 1
        if ((object_index == obj_player2))
            other.baddieID.grabbedby = 2
        if ((state == (121 << 0)) && (sprite_index != spr_mach3hit) && ((character == "P") || (character == "V") || (character == "B") || (character == "PZ") || (character == "NTV")))
        {
            if ((fightball == 0))
                sprite_index = spr_mach3hit
            image_index = 0
        }
        if ((state == (41 << 0)) && (sprite_index != spr_player_chainsawhit))
        {
            image_index = 0
            sprite_index = spr_player_chainsawhit
        }
        other.baddieID.invtime = 25
        suplexmove = 1
        if ((object_index == obj_player1))
            other.baddieID.grabbedby = 1
        else
            other.baddieID.grabbedby = 2
        scr_soundeffect(sfx_punch)
        if (other.baddieID.elite && (other.baddieID.object_index != obj_robot))
            other.baddieID.elitehit -= 1
        if (!other.baddieID.important)
            global.style += (2 + global.combo)
        if ((!other.baddieID.elite) || (other.baddieID.elitehit <= 0))
            other.baddieID.mach3destroy = 1
        if ((!other.baddieID.killprotection) && (!global.kungfu) && ((!other.baddieID.elite) || (other.baddieID.elitehit <= 0)))
            other.baddieID.instakilled = 1
        if (!other.baddieID.important)
        {
            global.combotime = 60
            global.heattime = 60
        }
        global.hit += 1
        if ((!grounded) && (state != (34 << 0)) && (state != (108 << 0)) && (key_jump2 || (input_buffer_jump == 0)))
        {
            if ((state == (121 << 0)) && (fightball == 0) && mach3hitjump)
                sprite_index = spr_player_mach2jump
            suplexmove = 0
            vsp = -11
        }
        if ((state == (34 << 0)))
        {
            if key_jump2
                vsp = -10
            boxxedpepjump = 10
        }
        if ((character == "M") && (state == (108 << 0)))
        {
            vsp = -11
            state = (92 << 0)
            sprite_index = spr_jump
        }
        if ((state != (61 << 0)))
        {
            tauntstoredmovespeed = movespeed
            tauntstoredsprite = sprite_index
            tauntstoredstate = state
            tauntstoredvsp = vsp
        }
        if ((state == (42 << 0)) && (!key_slap))
        {
            image_index = random_range(0, (image_number - 1))
            if grounded
                sprite_index = spr_player_groundedattack
            else
                sprite_index = spr_player_ungroundedattack
        }
        if ((state == (41 << 0)) && (!global.kungfu))
        {
            sprite_index = spr_player_chainsawhit
            image_index = 0
        }
        var lag = 5
        other.baddieID.hitLag = lag
        other.baddieID.hitX = other.baddieID.x
        other.baddieID.hitY = other.baddieID.y
        other.baddieID.hp -= 1
        hitLag = lag
        hitX = x
        hitY = y
        instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect)
        other.baddieID.alarm[3] = 3
        other.baddieID.state = (137 << 0)
        other.baddieID.image_xscale = (-xscale)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        instance_create(x, y, obj_baddiegibs)
        instance_create(x, y, obj_baddiegibs)
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = (3 / room_speed)
        }
        if ((state != (104 << 0)) && (state != (5 << 0)))
        {
            with (instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect))
                sprite_index = spr_kungfueffect
        }
        other.baddieID.hithsp = (xscale * (movespeed + 2))
        if ((abs(other.baddieID.hithsp) < 10))
            other.baddieID.hithsp = (xscale * 10)
        other.baddieID.hitvsp = -5
        state = (61 << 0)
    }
    else
    {
        other.baddieID.state = (138 << 0)
        other.baddieID.vsp = -4
        other.baddieID.stunned = 40
        scr_hurtplayer(id)
    }
    return;
}

