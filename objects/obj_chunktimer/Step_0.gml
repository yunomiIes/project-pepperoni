if (!global.deathmode)
{
    if ((global.panic == 1) && (global.fill > 0) && (!instance_exists(obj_ghostcollectibles)))
        global.fill -= 0.2
    if ((global.fill <= 0) && (global.panic == 1) && (global.pizzafacecooldown == 0) && (!instance_exists(obj_pizzaface)))
    {
        instance_create(obj_player1.x, obj_player1.y, obj_pizzaface)
        scr_soundeffect(sfx_pizzafaceLaugh2)
    }
}
global.pizzafacecooldown = Approach(global.pizzafacecooldown, 0, 1)
if ((global.fill <= 0))
    global.fill = 0
