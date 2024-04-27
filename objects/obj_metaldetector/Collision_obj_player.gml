with (other)
{
    if shotgunAnim
    {
        shotgunAnim = 0
        scr_soundeffect(sfx_Detransfo)
        with (instance_create(x, y, obj_sausageman_dead))
            sprite_index = spr_shotgunback
    }
}
