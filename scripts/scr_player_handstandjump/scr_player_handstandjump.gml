function scr_player_handstandjump() //scr_player_handstandjump
{
    landAnim = 0
    hsp = (xscale * movespeed)
    move = (key_left + key_right)
    momemtum = 1
    dir = xscale
    if ((global.attackstyle != 3))
    {
        if ((movespeed < 10))
        {
            if (((sprite_index == spr_player_pistolshot) || (sprite_index == spr_shotgun_shot)) && (movespeed < 8))
                movespeed += 0.25
            else if ((sprite_index == spr_player_lunge) && (movespeed < 12))
                movespeed += 0.8
            else if ((movespeed < 10))
                movespeed += 0.5
        }
    }
    else
    {
        if ((movespeed < 10))
        {
            if (((sprite_index == spr_player_pistolshot) || (sprite_index == spr_shotgun_shot)) && (movespeed < 8))
                movespeed += 0.25
            else if ((movespeed < 10))
                movespeed += 0.5
        }
        if (global.pummeltest && (!instance_exists(lungeattackID)))
        {
            with (instance_create(x, y, obj_lungehitbox))
            {
                playerid = other.id
                other.lungeattackID = id
            }
        }
    }
    if ((shoot == 1))
        var attackdash = spr_player_pistolshot
    else
        attackdash = spr_suplexdash
    var airattackdash = spr_suplexdashjump
    var airattackdashstart = spr_suplexdashjumpstart
    if ((global.attackstyle == 2) || ((sprite_index == spr_pizzelle_suplexdash) && (image_index < 7)) || (sprite_index == spr_player_lungestart) || (sprite_index == spr_player_lunge))
        vsp = 0
    if ((!key_jump2) && (jumpstop == 0) && (vsp < 0.5) && (stompAnim == 0))
    {
        vsp /= 20
        jumpstop = 1
    }
    if ((key_jump && grounded && (!key_down) && (global.attackstyle != 2) && (character != "S")) || (key_jump && ((sprite_index == spr_player_lungestart) || (sprite_index == spr_player_lunge))))
    {
        jumpstop = 0
        image_index = 0
        vsp = -11
        state = (104 << 0)
        sprite_index = spr_longjump
        scr_soundeffect(sfx_pep_grabcancel)
    }
    if ((sprite_index == attackdash) && (!grounded) && (character != "PZ") && (!pummelmove1))
    {
        image_index = 0
        sprite_index = airattackdashstart
    }
    if (((sprite_index == attackdash) || (sprite_index == airattackdashstart) || (sprite_index == airattackdash)) && (!grounded) && pummelmove1)
    {
        image_index = 0
        sprite_index = spr_player_lungestart
    }
    if ((character != "PZ"))
    {
        if (((sprite_index == attackdash) || (sprite_index == airattackdashstart) || (sprite_index == airattackdash)) && key_slap2 && buzzsawmove)
        {
            movespeed = 8
            image_index = 0
            sprite_index = spr_null
            state = (0 << 0)
            scr_soundeffect(sfx_kungfuair)
        }
    }
    if (grounded && (sprite_index == airattackdash) && ((!key_attack) || (character == "N")) && (global.attackstyle != 2))
    {
        if ((global.attackstyle != 3))
        {
            state = (0 << 0)
            if ((move != xscale))
                movespeed = 2
        }
        else
        {
            sprite_index = attackdash
            image_index = (image_number - 6)
        }
    }
    if ((sprite_index == attackdash) && key_slap2 && (character == "PZ"))
    {
        image_index = 0
        sprite_index = spr_pizzelle_machtumble
        state = (5 << 0)
        if grounded
        {
            if ((movespeed < 12))
                movespeed = 12
        }
        else
        {
            if ((movespeed < 12))
                movespeed = 12
            vsp = 2
        }
    }
    if (grounded && (sprite_index == attackdash) && key_slap2 && (character == "P"))
    {
        image_index = 4
        sprite_index = spr_player_faceplant
        scr_soundeffect(sfx_pep_grabcancel)
        state = (5 << 0)
        if ((movespeed >= 12))
        {
        }
        else
            movespeed = 12
    }
    if ((sprite_index == spr_player_lunge) && grounded && pummelmove1)
        state = (0 << 0)
    if (grounded && (sprite_index == airattackdash) && key_attack && (character != "N") && (global.attackstyle != 2))
        state = (104 << 0)
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == attackdash))
        state = (0 << 0)
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_player_lungestart))
        sprite_index = spr_player_lunge
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_player_lunge))
        state = (0 << 0)
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == airattackdashstart))
        sprite_index = airattackdash
    if ((floor(image_index) == (image_number - 1)) && key_attack && (sprite_index == attackdash))
    {
        image_speed = 0.35
        state = (104 << 0)
        grav = 0.5
    }
    if (key_down && grounded && (global.attackstyle != 2))
    {
        scr_soundeffect(sfx_pep_crouchslide)
        if (!finalmoveset)
        {
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale
            movespeed = 12
            crouchslipbuffer = 25
            grav = 0.5
            sprite_index = spr_crouchslip
            image_index = 0
            machhitAnim = 0
            state = (5 << 0)
        }
        else
        {
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale
            movespeed = 12
            crouchslipbuffer = 25
            grav = 0.5
            sprite_index = spr_crouchslip
            image_index = 0
            machhitAnim = 0
            state = (5 << 0)
        }
    }
    if ((character != "S"))
        mask_index = spr_player_mask
    if (((!grounded) && (place_meeting((x + hsp), y, obj_solid) || scr_solid_slope((x + hsp), y)) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || (grounded && (place_meeting((x + sign(hsp)), (y - 16), obj_solid) || scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && scr_slope()))
    {
        if key_attack
        {
            if (!finalmoveset)
            {
                wallspeed = movespeed
                if ((vsp > 0))
                    wallspeed -= vsp
                state = (37 << 0)
            }
            else
            {
                wallspeed = 6
                grabclimbbuffer = 10
                state = (37 << 0)
            }
        }
    }
    if ((character != "S"))
    {
        if ((grounded || (!key_attack)) && scr_solid((x + xscale), y) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)))
        {
            var _bump = ledge_bump(((vsp >= 0) ? 32 : 22))
            if _bump
            {
                jumpstop = 1
                state = (92 << 0)
                vsp = -4
                sprite_index = spr_suplexbump
                instance_create((x + (xscale * 10)), (y + 10), obj_bumpeffect)
                scr_soundeffect(sfx_pep_splat)
            }
        }
    }
    if ((!instance_exists(obj_slidecloud)) && grounded && (movespeed > 5))
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale
    }
    if ((sprite_index != spr_pizzelle_suplexdash))
        image_speed = 0.35
    else
        image_speed = 0.29
    if ((state != (106 << 0)) && (move != xscale) && (move != 0))
    {
        image_index = 0
        if (!grounded)
        {
            sprite_index = spr_suplexcancel
            jumpAnim = 1
            grav = 0.5
            state = (92 << 0)
        }
        else
        {
            state = (0 << 0)
            movespeed = 2
            grav = 0.5
        }
    }
    if ((character == "S"))
    {
        if (key_attack && key_shoot)
        {
            hsp = 0
            if ((movespeed < 28))
                movespeed += 0.5
            if ((movespeed > 20))
                sprite_index = spr_playerS_crazyrun
            else if ((movespeed < 20) && (movespeed > 12))
                sprite_index = spr_snick_mach3
            else if ((movespeed < 12) && (movespeed > 8))
                sprite_index = spr_snick_mach2
            else
                sprite_index = spr_snick_walk
        }
        else if ((movespeed >= 12))
            state = (121 << 0)
        else
        {
            state = (0 << 0)
            movespeed = 0
        }
        if ((!instance_exists(obj_dashcloud2)) && grounded && (movespeed > 5))
        {
            with (instance_create(x, y, obj_dashcloud2))
                image_xscale = other.xscale
        }
    }
    return;
}

