event_inherited()
if (pizzahead && (elitehit <= 0) && destroyable)
{
    scr_fakepep_destroy_sounds()
    instance_destroy(obj_fakepephead)
    instance_destroy(obj_fakepepprojectile)
    instance_destroy(obj_fakepepspawner)
    instance_destroy(obj_fakepeptauntspawner)
    with (obj_music)
    {
    }
}
