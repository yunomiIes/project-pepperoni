if ((keycode == "addbutton"))
{
    var i_d = ds_map_find_value(async_load, "id")
    if ((i_d == hduei))
    {
        if ds_map_find_value(async_load, "status")
        {
            if ((ds_map_find_value(async_load, "result") != ""))
                nejdmsx = ds_map_find_value(async_load, "result")
        }
        if ((string_pos("bind", string_lower(nejdmsx)) == 1))
        {
            var commands = string_delete(nejdmsx, 1, 5)
            instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
            {
                keycode: "bind",
                keycode2: commands,
                mysprite: spr_button_debug
            }
)
            show_message_async(commands)
            return;
        }
        switch string_lower(string(nejdmsx))
        {
            case "up":
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    keycode: 38,
                    mysprite: spr_virtual_controller
                }
)
                break
            case "down":
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    keycode: 40,
                    mysprite: spr_virtual_controller,
                    image_angle: 180
                }
)
                break
            case "left":
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    keycode: 37,
                    mysprite: spr_virtual_controller,
                    image_angle: 90
                }
)
                break
            case "right":
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    keycode: 39,
                    mysprite: spr_virtual_controller,
                    image_angle: -90
                }
)
                break
            case "up left":
            case "upleft":
            case "up+left":
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    keycode: 38,
                    keycode2: 37,
                    mysprite: spr_virtual_controller,
                    image_angle: 45
                }
)
                break
            case "up right":
            case "upright":
            case "up+right":
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    keycode: 38,
                    keycode2: 39,
                    mysprite: spr_virtual_controller,
                    image_angle: -45
                }
)
                break
            case "down left":
            case "downleft":
            case "down+left":
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    keycode: 40,
                    keycode2: 37,
                    mysprite: spr_virtual_controller,
                    image_angle: 135
                }
)
                break
            case "down right":
            case "downright":
            case "down+right":
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    keycode: 40,
                    keycode2: 39,
                    mysprite: spr_virtual_controller,
                    image_angle: -135
                }
)
                break
            case "z":
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    keycode: 90,
                    mysprite: spr_button_z,
                    image_xscale: 1.5,
                    image_yscale: 1.5
                }
)
                break
            case "x":
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    keycode: 88,
                    mysprite: spr_button_x,
                    image_xscale: 1.5,
                    image_yscale: 1.5
                }
)
                break
            case "c":
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    keycode: 67,
                    mysprite: spr_button_c,
                    image_xscale: 1.5,
                    image_yscale: 1.5
                }
)
                break
            case "shift":
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    keycode: 16,
                    mysprite: spr_button_shift,
                    image_xscale: 1.5,
                    image_yscale: 1.5
                }
)
                break
            case "shift_dash_lock":
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    buttonlockable: true,
                    keycode: 16,
                    mysprite: spr_button_shift,
                    image_xscale: 1.5,
                    image_yscale: 1.5
                }
)
                break
            case "escape":
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    keycode: 27,
                    mysprite: spr_button_escape,
                    image_xscale: 1.5,
                    image_yscale: 1.5
                }
)
                break
            case "shoot":
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    keycode: 65,
                    mysprite: spr_button_shoot,
                    image_xscale: 1.5,
                    image_yscale: 1.5
                }
)
                global.key_shoot = 65
                break
            case "debug":
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    keycode: "debug",
                    mysprite: spr_button_debug,
                    image_xscale: 1.5,
                    image_yscale: 1.5
                }
)
                break
            default:
                instance_create_depth((display_get_gui_width() / 2), (display_get_gui_height() / 2), -9999, obj_virtual_controller, 
                {
                    keycode: 90,
                    mysprite: spr_button_z,
                    image_xscale: 1.5,
                    image_yscale: 1.5
                }
)
                break
        }

    }
}
if ((keycode == "debug"))
{
    i_d = ds_map_find_value(async_load, "id")
    if ((i_d == dwnxed))
    {
        if ds_map_find_value(async_load, "status")
        {
            if ((ds_map_find_value(async_load, "result") != ""))
            {
                nejdmsx = ds_map_find_value(async_load, "result")
                self.processcommand(nejdmsx)
            }
        }
    }
}
if ((keycode == "color"))
{
    i_d = ds_map_find_value(async_load, "id")
    if ((i_d == ndskld))
    {
        if ds_map_find_value(async_load, "status")
        {
            if ((ds_map_find_value(async_load, "result") != ""))
            {
                nejdmsx = ds_map_find_value(async_load, "result")
                self.processedit(nejdmsx)
            }
        }
    }
}
if ((keycode == "load"))
{
    i_d = ds_map_find_value(async_load, "id")
    if ((i_d == djoiksa))
    {
        if ds_map_find_value(async_load, "status")
        {
            if ((ds_map_find_value(async_load, "result") != ""))
                nejdmsx = ds_map_find_value(async_load, "result")
            self.virtual_key_load(nejdmsx)
        }
    }
}
