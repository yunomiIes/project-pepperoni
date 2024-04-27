if ((global.laps < 2) || (((room == graveyard_7) || (room == forest_lap) || (room == forest_escape1)) && (!global.elmlapbrick)))
{
    mask_index = spr_lapblockwokeupfeelingreallygood
    sprite_index = spr_lapblockwokeupfeelingreallygood
    x = xstart
    y = ystart
}
else
{
    x = -100
    y = -100
    mask_index = spr_lapblocksleepingbecauseimlazyasheck
    sprite_index = spr_lapblocksleepingbecauseimlazyasheck
}
