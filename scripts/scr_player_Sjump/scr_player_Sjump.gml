function scr_player_Sjump() //gml_Script_scr_player_Sjump
{
    move = (key_right + key_left)
    hsp = 0
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    if ((sprite_index == spr_superjump) && finalmoveset && ((character == "P") || (character == "PI") || (character == "M") || (character == "N") || (character == "NTV")))
    {
        if ((steppybuffer > 0))
            steppybuffer--
        else
        {
            create_particle((x + irandom_range(-25, 25)), (y + irandom_range(-10, 35)), (1 << 0), 0)
            steppybuffer = 8
        }
        if ((piledrivereffect > 0))
            piledrivereffect--
        else
        {
            with (instance_create(x, y, obj_parryeffect))
            {
                sprite_index = spr_piledrivereffect
                image_yscale = -1
            }
            piledrivereffect = 15
        }
    }
    if (((sprite_index == spr_superjump) || (sprite_index == spr_superspringplayer)) && ((character == "N") || (character == "M") || (character == "P") || (character == "S") || (character == "B") || (character == "NTV")))
        vsp = sjumpvsp
    if (((sprite_index == spr_superjump) || (sprite_index == spr_superspringplayer)) && (character == "PI"))
        vsp = -16
    if (((sprite_index == spr_superjump) || (sprite_index == spr_superspringplayer)) && (character == "PZ"))
        vsp = -18
    sjumpvsp -= 0.1
    if ((character == "V") && (image_index > 3))
        vsp = -11
    if ((sprite_index == spr_player_supersidejump))
    {
        if ((a < 25))
            a++
        hsp = (xscale * a)
        vsp = 0
    }
    if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))))
    {
        pizzapepper = 0
        a = 0
        if ((sprite_index == spr_player_supersidejump))
            sprite_index = spr_player_supersidejumpland
        if ((sprite_index == spr_superjump) || (sprite_index == spr_superspringplayer))
            sprite_index = spr_superjumpland
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = (30 / room_speed)
        }
        with (obj_baddie)
        {
            if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && (vsp > 0))
            {
                image_index = 0
                if grounded
                    vsp = -7
            }
        }
        scr_soundeffect(sfx_groundpound)
        image_index = 0
        state = (123 << 0)
        machhitAnim = 0
    }
    else if (key_slap2 && ((character == "P") || (character == "PZ") || (character == "S") || (character == "M") || (character == "NTV")) && (sprite_index != spr_superspringplayer) && (sprite_index != spr_Sjumpcancelstart))
    {
        switch character
        {
            case "PZ":
            case "S":
            case "M":
            case "P":
                image_index = 0
                sprite_index = spr_Sjumpcancelstart
                scr_soundeffect(sfx_pep_superjumpcancel)
                break
            case "NTV":
                image_speed = 0.5
                if ((move != 0))
                    xscale = move
                jumpstop = 1
                vsp = -5
                state = (104 << 0)
                movespeed = 12
                sprite_index = spr_playerN_sidewayspin
                image_index = 0
                with (instance_create(x, y, obj_crazyrunothereffect))
                    image_xscale = other.xscale
                particle_set_scale((5 << 0), xscale, 1)
                create_particle(x, y, (5 << 0), 0)
                return 1;
        }

    }
    else if (key_slap2 && (character == "PI") && (sprite_index != spr_superspringplayer) && (sprite_index != spr_Sjumpcancelstart))
    {
        image_index = 0
        sprite_index = spr_pizzano_sjumpprepside
        scr_soundeffect(sfx_superjumpcancel)
    }
    else if (key_slap2 && (character == "B") && (sprite_index != spr_superspringplayer) && (sprite_index != spr_Sjumpcancelstart))
    {
        image_index = 0
        sprite_index = spr_playerB_Sjumpcancelstart
        scr_soundeffect(sfx_pep_superjumpcancel)
    }
    if ((sprite_index == spr_pizzano_sjumpprepside) && (character == "PI"))
    {
        vsp = 0
        if ((move != 0))
            xscale = move
        if ((floor(image_index) == (image_number - 1)))
        {
            hsp = 12
            movespeed = hsp
            image_index = 0
            sprite_index = spr_pizzano_sjumpside
            state = (80 << 0)
            with (instance_create(x, y, obj_crazyruneffect))
                image_xscale = other.xscale
        }
    }
    if ((sprite_index == spr_player_Sjumpcancelstart) && (character == "M"))
    {
        vsp = 0
        if ((move != 0))
            xscale = move
        if ((floor(image_index) == (image_number - 1)))
        {
            vsp = -3
            movespeed = 12
            image_index = 0
            sprite_index = spr_mach4
            state = (121 << 0)
            with (instance_create(x, y, obj_crazyruneffect))
                image_xscale = other.xscale
        }
    }
    if ((sprite_index == spr_Sjumpcancelstart) && (character == "PZ"))
    {
        vsp = 0
        if ((move != 0))
            xscale = move
        if ((floor(image_index) == (image_number - 1)))
        {
            jumpstop = 1
            vsp = -4
            flash = 1
            movespeed = 13
            image_index = 0
            sprite_index = spr_Sjumpcancel
            state = (121 << 0)
            with (instance_create(x, y, obj_crazyrunothereffect))
                image_xscale = other.xscale
        }
    }
    if ((sprite_index == spr_playerB_Sjumpcancelstart) && (character == "B"))
    {
        vsp = 0
        if ((move != 0))
            xscale = move
        if ((floor(image_index) == (image_number - 1)))
        {
            jumpstop = 1
            vsp = -4
            flash = 1
            movespeed = 12
            image_index = 0
            sprite_index = spr_playerB_Sjumpcancel
            state = (121 << 0)
            with (instance_create(x, y, obj_crazyruneffect))
                image_xscale = other.xscale
        }
    }
    if ((sprite_index == spr_player_Sjumpcancelstart) && (character != "M") && (character != "PI") && (character != "PZ"))
    {
        vsp = 0
        if ((move != 0))
            xscale = move
        if (!finalmoveset)
        {
            if ((floor(image_index) == (image_number - 1)))
            {
                vsp = -5
                movespeed = 12
                image_index = 0
                sprite_index = spr_Sjumpcancel
                state = (80 << 0)
                with (instance_create(x, y, obj_crazyruneffect))
                    image_xscale = other.xscale
            }
        }
        else if ((floor(image_index) == (image_number - 1)))
        {
            jumpstop = 1
            vsp = -4
            flash = 1
            movespeed = 13
            image_index = 0
            sprite_index = spr_player_Sjumpcancel
            state = (121 << 0)
            with (instance_create(x, y, obj_crazyrunothereffect))
                image_xscale = other.xscale
        }
    }
    if ((character == "N") && key_jump2)
    {
        scr_soundeffect(sfx_jump)
        scr_soundeffect(sfx_woosh)
        jumpstop = 0
        vsp = -15
        state = (92 << 0)
        sprite_index = spr_playerN_noisebombspinjump
        image_index = 0
        instance_create(x, (y + 70), obj_noisey)
        with (obj_noisey)
        {
            hsp = -10
            vsp = -1
        }
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale
    }
    if (((sprite_index == spr_player_Sjumpcancelstart) && global.oldsuperjumpcancelomg && (character != "M")) || ((sprite_index == spr_player_Sjumpcancelstart) && (character == "S")))
    {
        audio_stop_sound(sfx_superjumpcancel)
        vsp = -4
        movespeed = 12
        image_index = 0
        sprite_index = spr_mach4
        state = (121 << 0)
        with (instance_create(x, y, obj_crazyruneffect))
            image_xscale = other.xscale
    }
    if ((character == "N"))
    {
        if ((move == 1))
            hsp = 3
        if ((move == -1))
            hsp = -3
    }
    if ((character == "NTV") && (sprite_index == spr_playerN_Sjump))
        hsp = (move * 3)
    if ((character == "V") && (sprite_index == spr_playerV_superjump))
    {
        if ((floor(image_index) == (image_number - 1)))
        {
            state = (92 << 0)
            sprite_index = spr_playerV_fall
        }
    }
    image_speed = 0.5
    scr_collide_player()
    return;
}

