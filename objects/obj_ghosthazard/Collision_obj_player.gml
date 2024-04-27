with (other)
{
    if ((!isgustavo) && (state != (16 << 0)) && (state != (17 << 0)) && (state != (146 << 0)) && (state != (147 << 0)) && (state != (186 << 0)))
    {
        scr_losepoints()
        grav /= 2
        state = (16 << 0)
        movespeed = hsp
        ghostdash = 0
        ghostpepper = 0
        sprite_index = spr_ghostidle
        if (!audio_is_playing(sfx_GhostPepIntro))
            scr_soundeffect(sfx_GhostPepIntro)
        with (instance_create(x, y, obj_sausageman_dead))
        {
            hsp = (other.image_xscale * 3)
            image_xscale = (-other.image_xscale)
            sprite_index = other.spr_dead
        }
        other.debris = 0
    }
}
