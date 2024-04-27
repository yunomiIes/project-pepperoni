var _destroyed = 0
if ((ds_list_find_index(global.baddieroom, id) != -1))
{
    _destroyed = 1
    instance_destroy()
}
if ((escape == 1) && (!_destroyed))
{
    var b = 0
    with (obj_escapespawn)
    {
        if ((baddieID == other.id) && (state != 0))
            b = 1
    }
    if (!b)
    {
        instance_deactivate_object(id)
        with (instance_create(x, y, obj_escapespawn))
            baddieID = other.id
    }
}
if ((!elite) && (global.laps >= 2) && global.elitelapenemies)
{
    elite = 1
    elitehit = 0
}
if elite
{
    hp += 1
    elitehp = hp
    var _hp = (global.laps - 2)
    if ((global.laps >= 4))
        elitehit += _hp
    maxelitehit = elitehit
}
