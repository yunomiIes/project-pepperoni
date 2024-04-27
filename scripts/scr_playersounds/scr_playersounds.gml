function scr_playersounds() //gml_Script_scr_playersounds
{
    with (obj_player)
    {
        if ((character != "NTV"))
        {
            if ((state == (104 << 0)) && (sprite_index == spr_mach1) && (!audio_is_playing(sfx_mach1)) && grounded)
            {
                mach1snd = audio_play_sound(sfx_mach1, 1, false)
                sfx_gain(mach1snd)
            }
            else if (((state != (103 << 0)) && (sprite_index != spr_mach1)) || (!grounded) || (move == (-xscale)))
                audio_stop_sound(mach1snd)
            if (((sprite_index == spr_mach) || (state == (37 << 0))) && (!audio_is_playing(sfx_mach2)))
            {
                mach2snd = audio_play_sound(sfx_mach2, 1, false)
                sfx_gain(mach2snd)
            }
            else if ((sprite_index != spr_mach) && (state != (37 << 0)))
                audio_stop_sound(mach2snd)
            if ((state == (121 << 0)) && (sprite_index != spr_crazyrun) && (!audio_is_playing(sfx_mach3)))
            {
                mach3snd = audio_play_sound(sfx_mach3, 1, false)
                sfx_gain(mach3snd)
            }
            else if ((state != (121 << 0)) || (sprite_index == spr_crazyrun))
                audio_stop_sound(mach3snd)
            if ((sprite_index == spr_crazyrun) && (!audio_is_playing(sfx_mach4)))
            {
                mach4snd = audio_play_sound(sfx_mach4, 1, false)
                sfx_gain(mach4snd)
            }
            else if ((sprite_index != spr_crazyrun))
                audio_stop_sound(mach4snd)
        }
        if ((character == "NTV"))
        {
            if (((sprite_index == spr_mach) || (sprite_index == spr_mach1) || (state == (37 << 0))) && (!audio_is_playing(sfx_mach2N)))
            {
                mach2snd = audio_play_sound(sfx_mach2N, 1, false)
                sfx_gain(mach2snd)
            }
            else if ((sprite_index != spr_mach) && (sprite_index != spr_mach1) && (state != (37 << 0)))
            {
                audio_stop_sound(mach2snd)
                audio_stop_sound(snd_mach2stepN)
            }
            if ((state == (121 << 0)) && (sprite_index != spr_crazyrun) && (!audio_is_playing(sfx_mach3N)))
            {
                mach3snd = audio_play_sound(sfx_mach3N, 1, false)
                sfx_gain(mach3snd)
            }
            else if ((state != (121 << 0)) || (sprite_index == spr_crazyrun))
            {
                audio_stop_sound(mach3snd)
                audio_stop_sound(snd_mach3stepN)
            }
            if ((sprite_index == spr_crazyrun) && (!audio_is_playing(sfx_mach4N)))
            {
                mach4snd = audio_play_sound(sfx_mach4N, 1, false)
                sfx_gain(mach4snd)
            }
            else if ((sprite_index != spr_crazyrun))
                audio_stop_sound(mach4snd)
        }
        if ((character == "NTV"))
        {
            if (grounded && ((sprite_index == spr_mach) || (sprite_index == spr_mach1)) && (!audio_is_playing(sfx_mach2stepN)))
            {
                snd_mach2stepN = audio_play_sound(sfx_mach2stepN, 1, false)
                sfx_gain(snd_mach2stepN)
            }
            else if (!grounded)
                audio_stop_sound(snd_mach2stepN)
            if (grounded && ((sprite_index == spr_mach4) || ((sprite_index == spr_rollgetup) && (state == (121 << 0)))) && (!audio_is_playing(sfx_mach3stepN)))
            {
                snd_mach3stepN = audio_play_sound(sfx_mach3stepN, 1, false)
                sfx_gain(snd_mach3stepN)
            }
            else if (!grounded)
                audio_stop_sound(snd_mach3stepN)
        }
        if ((state == (184 << 0)) && (!audio_is_playing(sfx_mach4)))
        {
            rocketsnd = audio_play_sound(sfx_mach4, 1, false)
            sfx_gain(rocketsnd)
        }
        else if ((state != (184 << 0)))
            audio_stop_sound(rocketsnd)
        if ((state == (38 << 0)) && grounded && (!audio_is_playing(sfx_knightslide)))
        {
            knightslide = audio_play_sound(sfx_knightslide, 1, false)
            sfx_gain(knightslide)
        }
        else if (((state != (38 << 0)) || (!grounded)) && audio_is_playing(sfx_knightslide))
            audio_stop_sound(knightslide)
        if (((sprite_index == spr_bombpeprun) || (sprite_index == spr_bombpeprunabouttoexplode)) && (!audio_is_playing(sfx_bombpep1)))
        {
            bombpep1snd = audio_play_sound(sfx_bombpep1, 1, false)
            sfx_gain(bombpep1snd)
        }
        else if ((sprite_index != spr_bombpeprun) && (sprite_index != spr_bombpeprunabouttoexplode) && audio_is_playing(sfx_bombpep1))
            audio_stop_sound(bombpep1snd)
        else if ((sprite_index != spr_crazyrun))
            audio_stop_sound(mach4snd)
        if ((state != (99 << 0)) && audio_is_playing(superjumpprepsnd))
            audio_stop_sound(superjumpprepsnd)
        if ((state != (99 << 0)) && audio_is_playing(superjumpholdsnd))
            audio_stop_sound(superjumpholdsnd)
        if ((sprite_index == spr_tumblestart) && (!audio_is_playing(sfx_tumble1)) && (floor(image_index) < 11))
            tumble1snd = audio_play_sound(sfx_tumble1, 1, false)
        sfx_gain(tumble1snd)
        if ((sprite_index == spr_tumblestart) && (floor(image_index) == 11) && (!audio_is_playing(sfx_tumble2)))
        {
            tumble2snd = audio_play_sound(sfx_tumble2, 1, false)
            sfx_gain(tumble2snd)
            audio_stop_sound(tumble1snd)
        }
        if (((sprite_index == spr_tumble) || ((sprite_index == spr_machroll) && (!finalmoveset))) && (!audio_is_playing(sfx_tumble3)))
        {
            tumble3snd = audio_play_sound(sfx_tumble3, 1, false)
            sfx_gain(tumble3snd)
        }
        if ((sprite_index == spr_machroll) && finalmoveset && (!audio_is_playing(sfx_pep_machroll)))
        {
            machroll1snd = audio_play_sound(sfx_pep_machroll, 1, false)
            sfx_gain(machroll1snd)
        }
        if ((state != (5 << 0)) && (sprite_index != spr_machroll))
        {
            audio_stop_sound(tumble1snd)
            audio_stop_sound(tumble2snd)
            audio_stop_sound(tumble3snd)
            audio_stop_sound(machroll1snd)
        }
        if (audio_is_playing(suplexdashsnd) && ((state != (42 << 0)) || (state != (42 << 0))))
            audio_stop_sound(suplexdashsnd)
    }
    if ((sprite_index == spr_breakdanceuppercut) && (!audio_is_playing(sfx_uppercut2)))
    {
        uppercutsnd = audio_play_sound(sfx_uppercut2, 1, false)
        sfx_gain(uppercutsnd)
    }
    if ((sprite_index != spr_breakdanceuppercut))
        audio_stop_sound(uppercutsnd)
    if ((character != "NTV") && (state == (225 << 0)) && (!audio_is_playing(sfx_animatronic)))
    {
        animatronicsnd = audio_play_sound(sfx_animatronic, 1, false)
        sfx_gain(animatronicsnd)
    }
    if ((state == (16 << 0)) && (ghostpepper == 1) && (!audio_is_playing(sfx_ghostspeed0)))
    {
        ghostspdsnd0 = audio_play_sound(sfx_ghostspeed0, 1, false)
        sfx_gain(ghostspdsnd0)
    }
    if ((state == (16 << 0)) && (ghostpepper == 2) && (!audio_is_playing(sfx_ghostspeed1)))
    {
        ghostspdsnd1 = audio_play_sound(sfx_ghostspeed1, 1, false)
        sfx_gain(ghostspdsnd1)
    }
    if ((state == (16 << 0)) && ((ghostpepper > 3) || (ghostpepper == 3)) && (!audio_is_playing(sfx_ghostspeed3)))
    {
        ghostspdsnd2 = audio_play_sound(sfx_ghostspeed3, 1, false)
        sfx_gain(ghostspdsnd2)
    }
    if ((state == (16 << 0)) && (ghostpepper == 2))
        audio_stop_sound(ghostspdsnd0)
    if ((state == (16 << 0)) && ((ghostpepper > 3) || (ghostpepper == 3)))
        audio_stop_sound(ghostspdsnd1)
    if ((state != (16 << 0)))
    {
        audio_stop_sound(ghostspdsnd0)
        audio_stop_sound(ghostspdsnd1)
        audio_stop_sound(ghostspdsnd2)
    }
    if ((sprite_index == spr_wallsplat) && (image_index < 1) && (!audio_is_playing(sfx_pep_splat)))
    {
        wallsplatsnd = audio_play_sound(sfx_pep_splat, 1, false)
        sfx_gain(wallsplatsnd)
    }
    if ((sprite_index == spr_player_ratmountmach3) && (!audio_is_playing(sfx_ratmount2)))
    {
        ratmountmach3snd = audio_play_sound(sfx_ratmount2, 1, false)
        sfx_gain(ratmountmach3snd)
    }
    if ((sprite_index != spr_player_ratmountmach3))
        audio_stop_sound(ratmountmach3snd)
    if (isgustavo && (sprite_index == spr_player_ratmountwalljump) && (vsp > 0) && (!audio_is_playing(sfx_ratmountgroundpound)))
    {
        ratmountgroundpoundsnd = audio_play_sound(sfx_ratmountgroundpound, 1, false)
        sfx_gain(ratmountgroundpoundsnd)
    }
    if ((isgustavo && (sprite_index == spr_player_ratmountwalljump) && (vsp < 0)) || (isgustavo && (sprite_index != spr_player_ratmountwalljump)))
        audio_stop_sound(ratmountgroundpoundsnd)
    if (((sprite_index == spr_playerN_sidewayspin) || (sprite_index == spr_playerN_sidewayspinend)) && (!audio_is_playing(sfx_airspin0)))
    {
        snd_airspin = audio_play_sound(sfx_airspin0, 1, false)
        sfx_gain(snd_airspin)
    }
    else if ((sprite_index != spr_playerN_sidewayspin) && (sprite_index != spr_playerN_sidewayspinend))
        audio_stop_sound(snd_airspin)
    if ((sprite_index == spr_playerN_wallbounce) && (!audio_is_playing(sfx_machcancel2N)))
    {
        snd_wallbounce = audio_play_sound(sfx_machcancel2N, 1, false)
        sfx_gain(snd_wallbounce)
    }
    else if ((sprite_index != spr_playerN_wallbounce))
        audio_stop_sound(snd_wallbounce)
    if ((sprite_index == spr_playerN_divebombfall) && (!audio_is_playing(sfx_tornado1)))
    {
        snd_tornado1 = audio_play_sound(sfx_tornado1, 1, false)
        sfx_gain(snd_tornado1)
    }
    else if ((sprite_index != spr_playerN_divebombfall))
        audio_stop_sound(snd_tornado1)
    if (((sprite_index == spr_playerN_divebomb) || (sprite_index == spr_playerN_divebombland)) && (!audio_is_playing(sfx_tornado2)))
    {
        snd_tornado2 = audio_play_sound(sfx_tornado2, 1, false)
        sfx_gain(snd_tornado2)
    }
    else if ((sprite_index != spr_playerN_divebomb) && (sprite_index != spr_playerN_divebombland))
        audio_stop_sound(snd_tornado2)
    if ((sprite_index == spr_pmrpinch) && (!audio_is_playing(sfx_mrpinch1)))
    {
        snd_mrpinch1 = audio_play_sound(sfx_mrpinch1, 1, false)
        sfx_gain(snd_mrpinch1)
    }
    else if ((sprite_index != spr_pmrpinch) && audio_is_playing(sfx_mrpinch1))
        audio_stop_sound(snd_mrpinch1)
    return;
}

