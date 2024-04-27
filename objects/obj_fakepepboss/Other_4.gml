with (obj_bosscontroller_1)
    bossID = other.id
if instance_exists(obj_fakepepflash)
{
    elitehit = 1
    phase = 2
    destroyable = true
    state = (138 << 0)
    stunned = 50000000
    savedthrown = false
    instance_destroy(spotlightID)
}
