if ((room == rank_room))
    instance_destroy()
selected = 0
minutes = 0
seconds = 25
if ((room != secret_entrance))
    start = 1
alarm[0] = 60
startstate = -4
obj_player.isgustavo = 0
global.noisejetpack = 0
if ((room != chateau_secret2))
    instance_destroy(obj_trapghost)
switch room
{
    case medieval_secret4:
        startstate = (47 << 0)
        break
    case medieval_secret5:
        startstate = (47 << 0)
        break
    case badland_secret2:
        startstate = (10 << 0)
        break
    case forest_secret1:
        isgustavo = 1
        break
    case forest_secret3:
        isgustavo = 1
        break
    case street_secret2:
        isgustavo = 1
        break
    case street_secret3:
        isgustavo = 1
        break
    case freezer_secret1:
        global.noisejetpack = 1
        break
}

obj_player1.shotgunAnim = obj_player1.shotgunAnim
instance_destroy(obj_crosspriest_cross)
if ((obj_player1.isgustavo != obj_player.isgustavo))
{
    if isgustavo
        scr_switchgustavo()
    else
        scr_switchpeppino()
    with (obj_player)
    {
        tauntstoredstate = (isgustavo ? (191 << 0) : (0 << 0))
        tauntstoredsprite = sprite_index
    }
}
switch startstate
{
    case -4:
        with (obj_player)
        {
            if (!isgustavo)
            {
                state = (0 << 0)
                tauntstoredsprite = spr_idle
            }
            else
            {
                state = (191 << 0)
                tauntstoredsprite = spr_player_ratmountidle
            }
            tauntstoredmovespeed = 0
            tauntstoredhsp = 0
        }
        break
    case (47 << 0):
        with (obj_player)
            state = (38 << 0)
        break
    case (10 << 0):
        with (obj_player)
        {
            state = (10 << 0)
            tauntstoredmovespeed = 0
            tauntstoredhsp = 0
        }
        break
}

