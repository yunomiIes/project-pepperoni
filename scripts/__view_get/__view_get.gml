function __view_get(argument0, argument1) //__view_get
{
    var __res = -1
    switch argument0
    {
        case (0 << 0):
            var __cam = view_get_camera(argument1)
            __res = camera_get_view_x(__cam)
            break
        case (1 << 0):
            __cam = view_get_camera(argument1)
            __res = camera_get_view_y(__cam)
            break
        case (2 << 0):
            __cam = view_get_camera(argument1)
            __res = camera_get_view_width(__cam)
            break
        case (3 << 0):
            __cam = view_get_camera(argument1)
            __res = camera_get_view_height(__cam)
            break
        case (4 << 0):
            __cam = view_get_camera(argument1)
            __res = camera_get_view_angle(__cam)
            break
        case (5 << 0):
            __cam = view_get_camera(argument1)
            __res = camera_get_view_border_x(__cam)
            break
        case (6 << 0):
            __cam = view_get_camera(argument1)
            __res = camera_get_view_border_y(__cam)
            break
        case (7 << 0):
            __cam = view_get_camera(argument1)
            __res = camera_get_view_speed_x(__cam)
            break
        case (8 << 0):
            __cam = view_get_camera(argument1)
            __res = camera_get_view_speed_y(__cam)
            break
        case (9 << 0):
            __cam = view_get_camera(argument1)
            __res = camera_get_view_target(__cam)
            break
        case (10 << 0):
            __res = view_get_visible(argument1)
            break
        case (11 << 0):
            __res = view_get_xport(argument1)
            break
        case (12 << 0):
            __res = view_get_yport(argument1)
            break
        case (13 << 0):
            __res = view_get_wport(argument1)
            break
        case (14 << 0):
            __res = view_get_hport(argument1)
            break
        case (15 << 0):
            __res = view_get_camera(argument1)
            break
        case (16 << 0):
            __res = view_get_surface_id(argument1)
            break
        default:
            break
    }

    return __res;
}

