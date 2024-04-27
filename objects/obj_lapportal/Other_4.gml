var panictime = 0
if global.panic
    panictime = 1
if instance_exists(obj_wartimer)
    panictime = 1
if ((global.laps == 3) && (irandom_range(1, 15) == 1))
{
    var xx = 0
    var yy = 0
    var img = 0
    switch room
    {
        case entrance_lap:
            xx = 320
            yy = 544
            img = 1
            break
        case medieval_1:
            xx = 346
            yy = 480
            img = 1
            break
        case ruin_1:
            xx = 352
            yy = 576
            img = 1
            break
        case dungeon_1:
            xx = 1824
            yy = 448
            img = 0
            break
        case badland_1:
            xx = 1568
            yy = 192
            img = 0
            break
        case graveyard_1:
            xx = 480
            yy = 384
            img = 1
            break
        case farm_2:
            xx = 736
            yy = 256
            img = 1
            break
        case saloon_lap:
            xx = 640
            yy = 576
            img = 0
            break
        case plage_lap:
            xx = 1664
            yy = 704
            img = 0
            break
        case forest_lap:
            xx = 992
            yy = 896
            img = 0
            break
        case minigolf_lap:
            xx = 352
            yy = 448
            img = 1
            break
        case space_lap:
            xx = 512
            yy = 544
            img = 1
            break
        case street_1:
            xx = 4640
            yy = 384
            img = 0
            break
        case industrial_lap:
            xx = 864
            yy = 1408
            img = 1
            break
        case sewer_1:
            xx = 576
            yy = 352
            img = 0
            break
        case freezer_lap:
            xx = 768
            yy = 448
            img = 1
            break
        case chateau_1:
            xx = 396
            yy = 224
            img = 0
            break
        case kidsparty_floor1_1:
            xx = 576
            yy = 320
            img = 1
            break
        case war_13:
            xx = 480
            yy = 896
            img = 1
            break
        case trickytreat_7:
            xx = 448
            yy = 960
            img = 1
            break
    }

}
