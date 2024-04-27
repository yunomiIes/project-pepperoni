function scr_dotaunt() //gml_Script_scr_dotaunt
{
    if (key_taunt2 || (input_finisher_buffer > 0))
    {
        input_finisher_buffer = 0
        if (!finisher)
        {
            if (global.pizzeletaunt || (character == "PZ"))
                scr_soundeffect(sound_taunt1, 298, 299, 300, 301, 302, 303, 304)
            else if ((character == "PI"))
                scr_soundeffect(sound_tauntpizzano1, 367, 368, 369, 370, 371, 372, 373)
            else
            {
                var sfx = audio_play_sound(sfx_taunt, 0, false)
                audio_sound_pitch(sfx, random_range(0.9, 1.1))
            }
            taunttimer = 20
            tauntstoredmovespeed = movespeed
            tauntstoredvsp = vsp
            tauntstoredsprite = sprite_index
            tauntstoredstate = state
            state = (84 << 0)
            if (supercharged && key_up)
            {
                image_index = 0
                sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4)
                audio_stop_sound(sfx_pep_supertaunt)
                if ((character != "PZ") && (character != "PI"))
                    scr_soundeffect(sfx_supertaunt)
                if ((character == "PZ") || (character == "PI"))
                {
                    audio_stop_sound(sfx_supertaunt)
                    scr_soundeffect(sfx_supertaunt1SP)
                }
            }
            else
            {
                taunttimer = 20
                sprite_index = spr_taunt
                image_index = random_range(0, 11)
            }
            with (instance_create(x, y, obj_taunteffect))
                player = other.id
        }
    }
}

