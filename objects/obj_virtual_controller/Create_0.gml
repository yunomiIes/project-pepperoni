vkeychecker = -1
vkeychecker2 = -1
vkeycounter = 0
mouseon = 0
pressed = false
pulse = 1
hduei = undefined
djoiksa = undefined
dwnxed = undefined
ndskld = undefined
nejdmsx = ""
dsnxjk = undefined
door_object_arr = [598, 223, 608, 806, 604, 602, 254, 610, 87, 287]
depth = -19999
if ((mysprite != undefined))
    sprite_index = mysprite
image_alpha = myusualalpha
persistent = true
function createvbutton_gml_Object_obj_virtual_controller_Create_0(argument0) //gml_Script_createvbutton_gml_Object_obj_virtual_controller_Create_0
{
    with (instance_create_depth(0, 0, depth, obj_virtual_controller))
    {
        if variable_struct_exists(argument0, "x")
            x = argument0.x
        if variable_struct_exists(argument0, "y")
            y = argument0.y
        if variable_struct_exists(argument0, "bklock")
            buttonlockable = argument0.bklock
        else
            buttonlockable = false
        if variable_struct_exists(argument0, "image_angle")
            image_angle = argument0.image_angle
        if variable_struct_exists(argument0, "sprite_name")
        {
            if ((argument0.sprite_name != undefined) && (argument0.sprite_name != "null"))
            {
                sprite_index = spr_button_z
                if sprite_exists(asset_get_index(argument0.sprite_name))
                    sprite_index = asset_get_index(argument0.sprite_name)
            }
            else
                sprite_index = spr_button_z
        }
        else
            sprite_index = spr_button_z
        if variable_struct_exists(argument0, "image_xscale")
            image_xscale = argument0.image_xscale
        if variable_struct_exists(argument0, "image_yscale")
            image_yscale = argument0.image_yscale
        if variable_struct_exists(argument0, "image_speed")
            image_speed = argument0.image_speed
        if variable_struct_exists(argument0, "realcolor")
        {
            image_blend = argument0.realcolor
            realcolor = argument0.realcolor
        }
        else
            realcolor = c_white
        if variable_struct_exists(argument0, "balpha")
        {
            myusualalpha = argument0.balpha
            image_alpha = argument0.balpha
        }
        else
        {
            myusualalpha = 0.5
            image_alpha = 0.5
        }
        if variable_struct_exists(argument0, "bk")
        {
            if ((string(argument0.bk) != "null"))
                keycode = argument0.bk
        }
        if variable_struct_exists(argument0, "bk2")
        {
            if ((string(argument0.bk2) != "null"))
                keycode2 = argument0.bk2
        }
    }
}

function virtual_key_save_gml_Object_obj_virtual_controller_Create_0(argument0) //gml_Script_virtual_key_save_gml_Object_obj_virtual_controller_Create_0
{
    if ((argument0 == undefined))
        argument0 = false
    var mybuttons = array_create(0)
    with (obj_virtual_controller)
    {
        if (((!is_string(keycode)) && (!is_string(keycode2))) || (keycode == "debug") || (keycode == "bind"))
        {
            var buttonproperties = 
            {
                bk: keycode,
                bk2: keycode2,
                bklock: buttonlockable,
                x: x,
                y: y,
                image_angle: image_angle,
                image_xscale: image_xscale,
                image_yscale: image_yscale,
                image_speed: image_speed,
                realcolor: realcolor,
                balpha: myusualalpha,
                sprite_name: sprite_get_name(sprite_index)
            }

            array_push(mybuttons, buttonproperties)
        }
    }
    if argument0
    {
        get_string_async("Controls Save Code: ", json_stringify(mybuttons))
        return;
    }
    var buttonstring = json_stringify(mybuttons)
    var buttonbuffer = buffer_create((string_byte_length(buttonstring) + 1), buffer_fixed, 1)
    buffer_write(buttonbuffer, buffer_string, buttonstring)
    buffer_save(buttonbuffer, "buttonpositions.save")
    buffer_delete(buttonbuffer)
}

function virtual_key_load_gml_Object_obj_virtual_controller_Create_0(argument0) //gml_Script_virtual_key_load_gml_Object_obj_virtual_controller_Create_0
{
    if ((argument0 == undefined))
        argument0 = ""
    if ((file_exists("buttonpositions.save") && (argument0 == "")) || (file_exists("buttonpositions.save") && (argument0 == "load")))
    {
        with (obj_virtual_controller)
        {
            if (((!is_string(keycode)) && (!is_string(keycode2))) || (keycode == "debug") || (keycode == "bind"))
                instance_destroy()
        }
        var buttonbuffer = buffer_load("buttonpositions.save")
        var buttonstring = buffer_read(buttonbuffer, buffer_string)
        buffer_delete(buttonbuffer)
        var buttonload = json_parse(buttonstring)
        while ((array_length(buttonload) > 0))
        {
            var loadedbutton = array_pop(buttonload)
            self.createvbutton(loadedbutton)
        }
    }
    else
    {
        with (obj_virtual_controller)
        {
            if (((!is_string(keycode)) && (!is_string(keycode2))) || (keycode == "debug") || (keycode == "bind"))
                instance_destroy()
        }
        buttonload = ""
        if ((argument0 != "") && (argument0 != "default"))
            buttonload = json_parse(argument0)
        else
            buttonload = json_parse("[{\"x\": 928.0, \"y\": 32.0, \"image_xscale\": 1.5, \"image_yscale\": 1.5, \"image_angle\": 0.0, \"bk\": 27.0, \"bk2\": null, \"bklock\": 0.0, \"sprite_name\": \"spr_button_escape\" }, { \"x\": 896.0, \"y\": 416.0, \"image_xscale\": 1.5, \"image_yscale\": 1.5, \"image_angle\": 0.0, \"bk\": 16.0, \"bk2\": null, \"bklock\": 0.0, \"sprite_name\": \"spr_button_shift\" }, { \"x\": 800.0, \"y\": 480.0, \"image_xscale\": 1.5, \"image_yscale\": 1.5, \"image_angle\": 0.0, \"bk\": 67.0, \"bk2\": null, \"bklock\": 0.0, \"sprite_name\": \"spr_button_c\" }, { \"x\": 800.0, \"y\": 352.0, \"image_xscale\": 1.5, \"image_yscale\": 1.5, \"image_angle\": 0.0, \"bk\": 90.0, \"bk2\": null, \"bklock\": 0.0, \"sprite_name\": \"spr_button_z\" }, { \"x\": 704.0, \"y\": 416.0, \"image_xscale\": 1.5, \"image_yscale\": 1.5, \"image_angle\": 0.0, \"bk\": 88.0, \"bk2\": null, \"bklock\": 0.0, \"sprite_name\": \"spr_button_x\" }, { \"x\": 224.0, \"y\": 416.0, \"image_xscale\": 1.0, \"image_yscale\": 1.0, \"image_angle\": -90.0, \"bk\": 39.0, \"bk2\": null, \"bklock\": 0.0, \"sprite_name\": \"spr_virtual_controller\" }, { \"x\": 128.0, \"y\": 352.0, \"image_xscale\": 1.0, \"image_yscale\": 1.0, \"image_angle\": 0.0, \"bk\": 38.0, \"bk2\": null, \"bklock\": 0.0, \"sprite_name\": \"spr_virtual_controller\" }, { \"x\": 128.0, \"y\": 480.0, \"image_xscale\": 1.0, \"image_yscale\": 1.0, \"image_angle\": 180.0, \"bk\": 40.0, \"bk2\": null, \"bklock\": 0.0, \"sprite_name\": \"spr_virtual_controller\" }, { \"x\": 32.0, \"y\": 416.0, \"image_xscale\": 1.0, \"image_yscale\": 1.0, \"image_angle\": -270.0, \"bk\": 37.0, \"bk2\": null, \"bklock\": 0.0, \"sprite_name\": \"spr_virtual_controller\" }, { \"x\": 64.0, \"y\": 288.0, \"image_xscale\": 1.5, \"image_yscale\": 1.5, \"image_angle\": 0.0, \"bk\": 90.0, \"bk2\": null, \"bklock\": 0.0, \"sprite_name\": \"spr_button_z\"}]")
        while ((array_length(buttonload) > 0))
        {
            loadedbutton = array_pop(buttonload)
            self.createvbutton(loadedbutton)
        }
    }
}

function processcommand_gml_Object_obj_virtual_controller_Create_0(argument0, argument1) //gml_Script_processcommand_gml_Object_obj_virtual_controller_Create_0
{
    if ((argument1 == undefined))
        argument1 = false
    var _string = argument0
    if ((string_pos(";", _string) != 0))
    {
        var _commands = string_split((_string + ";"), ";")
        for (var i = 0; i < array_length(_commands); i++)
            self.docommand(_commands[i], argument1)
    }
    else
        self.docommand(_string, argument1)
}

function docommand_gml_Object_obj_virtual_controller_Create_0(argument0, argument1) //gml_Script_docommand_gml_Object_obj_virtual_controller_Create_0
{
    if ((argument1 == undefined))
        argument1 = false
    if ((string_pos("panic", string_lower(argument0)) == 1))
    {
        var commands = string_split(argument0, " ")
        var hasarg2 = false
        var i = 1
        while ((i < array_length(commands)))
        {
            if ((i == 2))
            {
                global.panic = true
                global.fill = (int64(commands[i]) * 12)
                with (obj_tv)
                    chunkmax = global.fill
                hasarg2 = true
            }
            if ((i >= 2))
                break
            else
                i++
        }
        if ((hasarg2 == false))
        {
            global.panic = true
            global.fill = 0
        }
    }
    if ((string_pos("spawn", string_lower(argument0)) == 1))
    {
        commands = string_split(argument0, " ")
        hasarg2 = false
        var hasarg3 = false
        var distance = 0
        var _object = obj_forknight
        i = 1
        while ((i < array_length(commands)))
        {
            if ((i == 2))
            {
                hasarg2 = true
                if object_exists(asset_get_index(commands[i]))
                    _object = asset_get_index(commands[i])
            }
            if ((i == 3))
            {
                distance = real(commands[i])
                hasarg3 = true
            }
            if ((i >= 3))
                break
            else
                i++
        }
        if ((hasarg2 == false))
            instance_create(obj_player1.x, (obj_player1.y - 20), obj_forknight)
        else
        {
            if ((obj_player1.xscale >= 0))
                var object = instance_create((obj_player1.x + distance), obj_player1.y, _object)
            else
                object = instance_create((obj_player1.x - distance), obj_player1.y, _object)
            with (object)
            {
                for (var i2 = 0; i2 < array_length(other.door_object_arr); i2++)
                {
                    if ((other.door_object_arr[i2] == object_index))
                        variable_instance_set(id, "targetRoom", room)
                }
            }
            if ((obj_fakeeditor.editormode == 1))
            {
                with (object)
                {
                    variable_instance_set(id, "createdbyeditor", 1)
                    variable_instance_set(id, "editorplacedroom", room)
                    variable_instance_set(id, "oldinstanceeditor", object_index)
                }
                alarm[1] = 1
            }
        }
    }
    if ((string_pos("player_set_state", string_lower(argument0)) == 1))
    {
        commands = string_split(argument0, " ")
        i = 1
        while ((i < array_length(commands)))
        {
            if ((i == 2))
            {
                switch commands[i]
                {
                    case "states.ratmount":
                    case "ratmount":
                        with (obj_player1)
                            state = (191 << 0)
                        break
                    case "states.knightpep":
                    case "knightpep":
                        with (obj_player1)
                        {
                            state = (47 << 0)
                            sprite_index = spr_knightpepidle
                        }
                        break
                    case "states.cheesepep":
                    case "cheesepep":
                        with (obj_player1)
                        {
                            state = (24 << 0)
                            sprite_index = spr_cheesepep_idle
                        }
                        break
                    case "states.rocket":
                    case "rocket":
                        with (obj_player1)
                            state = (184 << 0)
                        break
                    case "states.mort":
                    case "mort":
                        with (obj_player1)
                            state = (11 << 0)
                        break
                    case "states.normal":
                    case "normal":
                        with (obj_player1)
                        {
                            state = (0 << 0)
                            sprite_index = spr_idle
                        }
                        break
                    case "states.shotgun":
                    case "shotgun":
                        with (obj_player1)
                            state = (66 << 0)
                        break
                    case "states.boxxedpep":
                    case "boxxedpep":
                        with (obj_player1)
                            state = (33 << 0)
                        break
                    case "states.cheeseball":
                    case "cheeseball":
                        with (obj_player1)
                            state = (21 << 0)
                        break
                    case "states.fireass":
                    case "fireass":
                        with (obj_player1)
                        {
                            state = (9 << 0)
                            vsp = -20
                            sprite_index = spr_fireass
                            image_index = 0
                            movespeed = hsp
                            if (!audio_is_playing(sfx_scream5))
                                scr_soundeffect(sfx_scream5)
                        }
                        break
                    case "states.firemouth":
                    case "firemouth":
                        with (obj_player1)
                            state = (10 << 0)
                        break
                    case "states.slipnslide":
                    case "slipnslide":
                        with (obj_player1)
                        {
                            sprite_index = spr_slipbanan1
                            vsp = -11
                            movespeed += 2
                            if ((movespeed > 14))
                                movespeed = 14
                            hsp = (movespeed * xscale)
                            image_index = 0
                            state = (165 << 0)
                        }
                        break
                    case "states.rideweenie":
                    case "rideweenie":
                        with (obj_player1)
                        {
                            state = (31 << 0)
                            movespeed = hsp
                            sprite_index = spr_rideweenie
                            xscale = other.image_xscale
                            jumpstop = 1
                            if ((vsp < 0))
                                vsp = 0
                        }
                        break
                    case "states.ghost":
                    case "ghost":
                        with (obj_player1)
                            state = (16 << 0)
                        break
                    case "states.debugstate":
                    case "debugstate":
                        with (obj_player1)
                            state = (208 << 0)
                        break
                    case "states.clownpep":
                    case "clownpep":
                        with (obj_player1)
                        {
                            instance_create(x, y, obj_genericpoofeffect)
                            movespeed = 10
                            state = (104 << 0)
                            skateboarding = 1
                        }
                        break
                }

            }
            if ((i >= 2))
                break
            else
                i++
        }
    }
    if ((string_pos("instance_set_variable", string_lower(argument0)) == 1))
    {
        commands = string_split(argument0, " ")
        var ourinstance = undefined
        var tempvarname = undefined
        var tempvartype = undefined
        var tempvarexists = false
        i = 1
        while ((i < array_length(commands)))
        {
            if ((i == 2))
            {
                if ((asset_get_index(commands[i]) != -1))
                {
                    ourinstance = asset_get_index(commands[i])
                    if ((i == 3))
                    {
                        tempvartype = string(commands[i])
                        if ((tempvartype != "bool") && (tempvartype != "string") && (tempvartype != "int") && (tempvartype != "float") && (tempvartype != "real") && (tempvartype != "asset"))
                        {
                            show_message_async((("invalid type \"" + commands[i]) + "\" Available types: bool, string, int, float, real, asset"))
                            break
                        }
                        else if ((i == 4))
                        {
                            tempvarname = commands[i]
                            if (!(variable_instance_exists(ourinstance, tempvarname)))
                            {
                                show_message_async((("variable \"" + commands[i]) + "\" does not exist."))
                                break
                            }
                            else
                            {
                                if ((i == 5))
                                {
                                    switch tempvartype
                                    {
                                        case "bool":
                                            if is_bool(bool(commands[i]))
                                            {
                                                variable_instance_set(ourinstance, tempvarname, bool(commands[i]))
                                                if (!argument1)
                                                    show_message_async("successfully set bool")
                                            }
                                            break
                                        case "int":
                                            if is_int64(int64(commands[i]))
                                            {
                                                variable_instance_set(ourinstance, tempvarname, int64(commands[i]))
                                                if (!argument1)
                                                    show_message_async("successfully set int")
                                            }
                                            break
                                        case "float":
                                        case "real":
                                            if is_real(real(commands[i]))
                                            {
                                                variable_instance_set(ourinstance, tempvarname, real(commands[i]))
                                                if (!argument1)
                                                    show_message_async("successfully set real")
                                            }
                                            break
                                        case "string":
                                            if is_string(commands[i])
                                            {
                                                variable_instance_set(ourinstance, tempvarname, commands[i])
                                                if (!argument1)
                                                    show_message_async("successfully set string")
                                            }
                                            break
                                        case "asset":
                                            if ((asset_get_index(commands[i]) > -1))
                                            {
                                                variable_instance_set(ourinstance, tempvarname, asset_get_index(commands[i]))
                                                if (!argument1)
                                                    show_message_async("successfully set asset")
                                            }
                                            break
                                    }

                                }
                                if ((i >= 5))
                                    break
                                else
                                    i++
                            }
                        }
                        else
                        {
                            if ((i == 5))
                            {
                                switch tempvartype
                                {
                                    case "bool":
                                        if is_bool(bool(commands[i]))
                                        {
                                            variable_instance_set(ourinstance, tempvarname, bool(commands[i]))
                                            if (!argument1)
                                                show_message_async("successfully set bool")
                                        }
                                        break
                                    case "int":
                                        if is_int64(int64(commands[i]))
                                        {
                                            variable_instance_set(ourinstance, tempvarname, int64(commands[i]))
                                            if (!argument1)
                                                show_message_async("successfully set int")
                                        }
                                        break
                                    case "float":
                                    case "real":
                                        if is_real(real(commands[i]))
                                        {
                                            variable_instance_set(ourinstance, tempvarname, real(commands[i]))
                                            if (!argument1)
                                                show_message_async("successfully set real")
                                        }
                                        break
                                    case "string":
                                        if is_string(commands[i])
                                        {
                                            variable_instance_set(ourinstance, tempvarname, commands[i])
                                            if (!argument1)
                                                show_message_async("successfully set string")
                                        }
                                        break
                                    case "asset":
                                        if ((asset_get_index(commands[i]) > -1))
                                        {
                                            variable_instance_set(ourinstance, tempvarname, asset_get_index(commands[i]))
                                            if (!argument1)
                                                show_message_async("successfully set asset")
                                        }
                                        break
                                }

                            }
                            if ((i >= 5))
                                break
                            else
                                i++
                        }
                    }
                    else if ((i == 4))
                    {
                        tempvarname = commands[i]
                        if (!(variable_instance_exists(ourinstance, tempvarname)))
                        {
                            show_message_async((("variable \"" + commands[i]) + "\" does not exist."))
                            break
                        }
                        else
                        {
                            if ((i == 5))
                            {
                                switch tempvartype
                                {
                                    case "bool":
                                        if is_bool(bool(commands[i]))
                                        {
                                            variable_instance_set(ourinstance, tempvarname, bool(commands[i]))
                                            if (!argument1)
                                                show_message_async("successfully set bool")
                                        }
                                        break
                                    case "int":
                                        if is_int64(int64(commands[i]))
                                        {
                                            variable_instance_set(ourinstance, tempvarname, int64(commands[i]))
                                            if (!argument1)
                                                show_message_async("successfully set int")
                                        }
                                        break
                                    case "float":
                                    case "real":
                                        if is_real(real(commands[i]))
                                        {
                                            variable_instance_set(ourinstance, tempvarname, real(commands[i]))
                                            if (!argument1)
                                                show_message_async("successfully set real")
                                        }
                                        break
                                    case "string":
                                        if is_string(commands[i])
                                        {
                                            variable_instance_set(ourinstance, tempvarname, commands[i])
                                            if (!argument1)
                                                show_message_async("successfully set string")
                                        }
                                        break
                                    case "asset":
                                        if ((asset_get_index(commands[i]) > -1))
                                        {
                                            variable_instance_set(ourinstance, tempvarname, asset_get_index(commands[i]))
                                            if (!argument1)
                                                show_message_async("successfully set asset")
                                        }
                                        break
                                }

                            }
                            if ((i >= 5))
                                break
                            else
                                i++
                        }
                    }
                    else
                    {
                        if ((i == 5))
                        {
                            switch tempvartype
                            {
                                case "bool":
                                    if is_bool(bool(commands[i]))
                                    {
                                        variable_instance_set(ourinstance, tempvarname, bool(commands[i]))
                                        if (!argument1)
                                            show_message_async("successfully set bool")
                                    }
                                    break
                                case "int":
                                    if is_int64(int64(commands[i]))
                                    {
                                        variable_instance_set(ourinstance, tempvarname, int64(commands[i]))
                                        if (!argument1)
                                            show_message_async("successfully set int")
                                    }
                                    break
                                case "float":
                                case "real":
                                    if is_real(real(commands[i]))
                                    {
                                        variable_instance_set(ourinstance, tempvarname, real(commands[i]))
                                        if (!argument1)
                                            show_message_async("successfully set real")
                                    }
                                    break
                                case "string":
                                    if is_string(commands[i])
                                    {
                                        variable_instance_set(ourinstance, tempvarname, commands[i])
                                        if (!argument1)
                                            show_message_async("successfully set string")
                                    }
                                    break
                                case "asset":
                                    if ((asset_get_index(commands[i]) > -1))
                                    {
                                        variable_instance_set(ourinstance, tempvarname, asset_get_index(commands[i]))
                                        if (!argument1)
                                            show_message_async("successfully set asset")
                                    }
                                    break
                            }

                        }
                        if ((i >= 5))
                            break
                        else
                            i++
                    }
                }
                else
                {
                    show_message_async((("invalid instance \"" + commands[i]) + "\""))
                    break
                }
            }
            else if ((i == 3))
            {
                tempvartype = string(commands[i])
                if ((tempvartype != "bool") && (tempvartype != "string") && (tempvartype != "int") && (tempvartype != "float") && (tempvartype != "real") && (tempvartype != "asset"))
                {
                    show_message_async((("invalid type \"" + commands[i]) + "\" Available types: bool, string, int, float, real, asset"))
                    break
                }
                else if ((i == 4))
                {
                    tempvarname = commands[i]
                    if (!(variable_instance_exists(ourinstance, tempvarname)))
                    {
                        show_message_async((("variable \"" + commands[i]) + "\" does not exist."))
                        break
                    }
                    else
                    {
                        if ((i == 5))
                        {
                            switch tempvartype
                            {
                                case "bool":
                                    if is_bool(bool(commands[i]))
                                    {
                                        variable_instance_set(ourinstance, tempvarname, bool(commands[i]))
                                        if (!argument1)
                                            show_message_async("successfully set bool")
                                    }
                                    break
                                case "int":
                                    if is_int64(int64(commands[i]))
                                    {
                                        variable_instance_set(ourinstance, tempvarname, int64(commands[i]))
                                        if (!argument1)
                                            show_message_async("successfully set int")
                                    }
                                    break
                                case "float":
                                case "real":
                                    if is_real(real(commands[i]))
                                    {
                                        variable_instance_set(ourinstance, tempvarname, real(commands[i]))
                                        if (!argument1)
                                            show_message_async("successfully set real")
                                    }
                                    break
                                case "string":
                                    if is_string(commands[i])
                                    {
                                        variable_instance_set(ourinstance, tempvarname, commands[i])
                                        if (!argument1)
                                            show_message_async("successfully set string")
                                    }
                                    break
                                case "asset":
                                    if ((asset_get_index(commands[i]) > -1))
                                    {
                                        variable_instance_set(ourinstance, tempvarname, asset_get_index(commands[i]))
                                        if (!argument1)
                                            show_message_async("successfully set asset")
                                    }
                                    break
                            }

                        }
                        if ((i >= 5))
                            break
                        else
                            i++
                    }
                }
                else
                {
                    if ((i == 5))
                    {
                        switch tempvartype
                        {
                            case "bool":
                                if is_bool(bool(commands[i]))
                                {
                                    variable_instance_set(ourinstance, tempvarname, bool(commands[i]))
                                    if (!argument1)
                                        show_message_async("successfully set bool")
                                }
                                break
                            case "int":
                                if is_int64(int64(commands[i]))
                                {
                                    variable_instance_set(ourinstance, tempvarname, int64(commands[i]))
                                    if (!argument1)
                                        show_message_async("successfully set int")
                                }
                                break
                            case "float":
                            case "real":
                                if is_real(real(commands[i]))
                                {
                                    variable_instance_set(ourinstance, tempvarname, real(commands[i]))
                                    if (!argument1)
                                        show_message_async("successfully set real")
                                }
                                break
                            case "string":
                                if is_string(commands[i])
                                {
                                    variable_instance_set(ourinstance, tempvarname, commands[i])
                                    if (!argument1)
                                        show_message_async("successfully set string")
                                }
                                break
                            case "asset":
                                if ((asset_get_index(commands[i]) > -1))
                                {
                                    variable_instance_set(ourinstance, tempvarname, asset_get_index(commands[i]))
                                    if (!argument1)
                                        show_message_async("successfully set asset")
                                }
                                break
                        }

                    }
                    if ((i >= 5))
                        break
                    else
                        i++
                }
            }
            else if ((i == 4))
            {
                tempvarname = commands[i]
                if (!(variable_instance_exists(ourinstance, tempvarname)))
                {
                    show_message_async((("variable \"" + commands[i]) + "\" does not exist."))
                    break
                }
                else
                {
                    if ((i == 5))
                    {
                        switch tempvartype
                        {
                            case "bool":
                                if is_bool(bool(commands[i]))
                                {
                                    variable_instance_set(ourinstance, tempvarname, bool(commands[i]))
                                    if (!argument1)
                                        show_message_async("successfully set bool")
                                }
                                break
                            case "int":
                                if is_int64(int64(commands[i]))
                                {
                                    variable_instance_set(ourinstance, tempvarname, int64(commands[i]))
                                    if (!argument1)
                                        show_message_async("successfully set int")
                                }
                                break
                            case "float":
                            case "real":
                                if is_real(real(commands[i]))
                                {
                                    variable_instance_set(ourinstance, tempvarname, real(commands[i]))
                                    if (!argument1)
                                        show_message_async("successfully set real")
                                }
                                break
                            case "string":
                                if is_string(commands[i])
                                {
                                    variable_instance_set(ourinstance, tempvarname, commands[i])
                                    if (!argument1)
                                        show_message_async("successfully set string")
                                }
                                break
                            case "asset":
                                if ((asset_get_index(commands[i]) > -1))
                                {
                                    variable_instance_set(ourinstance, tempvarname, asset_get_index(commands[i]))
                                    if (!argument1)
                                        show_message_async("successfully set asset")
                                }
                                break
                        }

                    }
                    if ((i >= 5))
                        break
                    else
                        i++
                }
            }
            else
            {
                if ((i == 5))
                {
                    switch tempvartype
                    {
                        case "bool":
                            if is_bool(bool(commands[i]))
                            {
                                variable_instance_set(ourinstance, tempvarname, bool(commands[i]))
                                if (!argument1)
                                    show_message_async("successfully set bool")
                            }
                            break
                        case "int":
                            if is_int64(int64(commands[i]))
                            {
                                variable_instance_set(ourinstance, tempvarname, int64(commands[i]))
                                if (!argument1)
                                    show_message_async("successfully set int")
                            }
                            break
                        case "float":
                        case "real":
                            if is_real(real(commands[i]))
                            {
                                variable_instance_set(ourinstance, tempvarname, real(commands[i]))
                                if (!argument1)
                                    show_message_async("successfully set real")
                            }
                            break
                        case "string":
                            if is_string(commands[i])
                            {
                                variable_instance_set(ourinstance, tempvarname, commands[i])
                                if (!argument1)
                                    show_message_async("successfully set string")
                            }
                            break
                        case "asset":
                            if ((asset_get_index(commands[i]) > -1))
                            {
                                variable_instance_set(ourinstance, tempvarname, asset_get_index(commands[i]))
                                if (!argument1)
                                    show_message_async("successfully set asset")
                            }
                            break
                    }

                }
                if ((i >= 5))
                    break
                else
                    i++
            }
        }
    }
    if ((string_pos("global_set_variable", string_lower(argument0)) == 1))
    {
        commands = string_split(argument0, " ")
        tempvartype = undefined
        tempvarname = undefined
        tempvarexists = false
        i = 1
        while ((i < array_length(commands)))
        {
            if ((i == 2))
            {
                tempvartype = string(commands[i])
                if ((tempvartype != "bool") && (tempvartype != "string") && (tempvartype != "int") && (tempvartype != "float") && (tempvartype != "real") && (tempvartype != "asset"))
                {
                    show_message_async((("invalid type \"" + commands[i]) + "\""))
                    break
                }
                else if ((i == 3))
                {
                    tempvarname = commands[i]
                    if (!variable_global_exists(tempvarname))
                    {
                        show_message_async((("variable \"" + commands[i]) + "\" does not exist."))
                        break
                    }
                    else
                    {
                        if ((i == 4))
                        {
                            switch tempvartype
                            {
                                case "bool":
                                    if is_bool(bool(commands[i]))
                                    {
                                        variable_global_set(tempvarname, bool(commands[i]))
                                        if (!argument1)
                                            show_message_async("successfully set bool.")
                                    }
                                    break
                                case "int":
                                    if is_int64(int64(commands[i]))
                                    {
                                        variable_global_set(tempvarname, int64(commands[i]))
                                        if (!argument1)
                                            show_message_async("successfully set int.")
                                    }
                                    break
                                case "float":
                                case "real":
                                    if is_real(real(commands[i]))
                                    {
                                        variable_global_set(tempvarname, real(commands[i]))
                                        if (!argument1)
                                            show_message_async("successfully set real.")
                                    }
                                    break
                                case "string":
                                    if is_string(commands[i])
                                    {
                                        variable_global_set(tempvarname, commands[i])
                                        if (!argument1)
                                            show_message_async("successfully set string.")
                                    }
                                    break
                                case "asset":
                                    if ((asset_get_index(commands[i]) > -1))
                                    {
                                        variable_global_set(tempvarname, asset_get_index(commands[i]))
                                        if (!argument1)
                                            show_message_async("successfully set asset.")
                                    }
                                    break
                            }

                        }
                        if ((i >= 4))
                            break
                        else
                            i++
                    }
                }
                else
                {
                    if ((i == 4))
                    {
                        switch tempvartype
                        {
                            case "bool":
                                if is_bool(bool(commands[i]))
                                {
                                    variable_global_set(tempvarname, bool(commands[i]))
                                    if (!argument1)
                                        show_message_async("successfully set bool.")
                                }
                                break
                            case "int":
                                if is_int64(int64(commands[i]))
                                {
                                    variable_global_set(tempvarname, int64(commands[i]))
                                    if (!argument1)
                                        show_message_async("successfully set int.")
                                }
                                break
                            case "float":
                            case "real":
                                if is_real(real(commands[i]))
                                {
                                    variable_global_set(tempvarname, real(commands[i]))
                                    if (!argument1)
                                        show_message_async("successfully set real.")
                                }
                                break
                            case "string":
                                if is_string(commands[i])
                                {
                                    variable_global_set(tempvarname, commands[i])
                                    if (!argument1)
                                        show_message_async("successfully set string.")
                                }
                                break
                            case "asset":
                                if ((asset_get_index(commands[i]) > -1))
                                {
                                    variable_global_set(tempvarname, asset_get_index(commands[i]))
                                    if (!argument1)
                                        show_message_async("successfully set asset.")
                                }
                                break
                        }

                    }
                    if ((i >= 4))
                        break
                    else
                        i++
                }
            }
            else if ((i == 3))
            {
                tempvarname = commands[i]
                if (!variable_global_exists(tempvarname))
                {
                    show_message_async((("variable \"" + commands[i]) + "\" does not exist."))
                    break
                }
                else
                {
                    if ((i == 4))
                    {
                        switch tempvartype
                        {
                            case "bool":
                                if is_bool(bool(commands[i]))
                                {
                                    variable_global_set(tempvarname, bool(commands[i]))
                                    if (!argument1)
                                        show_message_async("successfully set bool.")
                                }
                                break
                            case "int":
                                if is_int64(int64(commands[i]))
                                {
                                    variable_global_set(tempvarname, int64(commands[i]))
                                    if (!argument1)
                                        show_message_async("successfully set int.")
                                }
                                break
                            case "float":
                            case "real":
                                if is_real(real(commands[i]))
                                {
                                    variable_global_set(tempvarname, real(commands[i]))
                                    if (!argument1)
                                        show_message_async("successfully set real.")
                                }
                                break
                            case "string":
                                if is_string(commands[i])
                                {
                                    variable_global_set(tempvarname, commands[i])
                                    if (!argument1)
                                        show_message_async("successfully set string.")
                                }
                                break
                            case "asset":
                                if ((asset_get_index(commands[i]) > -1))
                                {
                                    variable_global_set(tempvarname, asset_get_index(commands[i]))
                                    if (!argument1)
                                        show_message_async("successfully set asset.")
                                }
                                break
                        }

                    }
                    if ((i >= 4))
                        break
                    else
                        i++
                }
            }
            else
            {
                if ((i == 4))
                {
                    switch tempvartype
                    {
                        case "bool":
                            if is_bool(bool(commands[i]))
                            {
                                variable_global_set(tempvarname, bool(commands[i]))
                                if (!argument1)
                                    show_message_async("successfully set bool.")
                            }
                            break
                        case "int":
                            if is_int64(int64(commands[i]))
                            {
                                variable_global_set(tempvarname, int64(commands[i]))
                                if (!argument1)
                                    show_message_async("successfully set int.")
                            }
                            break
                        case "float":
                        case "real":
                            if is_real(real(commands[i]))
                            {
                                variable_global_set(tempvarname, real(commands[i]))
                                if (!argument1)
                                    show_message_async("successfully set real.")
                            }
                            break
                        case "string":
                            if is_string(commands[i])
                            {
                                variable_global_set(tempvarname, commands[i])
                                if (!argument1)
                                    show_message_async("successfully set string.")
                            }
                            break
                        case "asset":
                            if ((asset_get_index(commands[i]) > -1))
                            {
                                variable_global_set(tempvarname, asset_get_index(commands[i]))
                                if (!argument1)
                                    show_message_async("successfully set asset.")
                            }
                            break
                    }

                }
                if ((i >= 4))
                    break
                else
                    i++
            }
        }
    }
    switch string_lower(argument0)
    {
        case "noclip":
            with (obj_player)
            {
                if ((state != (208 << 0)))
                    state = (208 << 0)
                else
                    state = (0 << 0)
            }
            break
        case "showcollision":
        case "showcollisions":
            global.showcollisions = (!global.showcollisions)
            if global.showcollisions
            {
                with (obj_solid)
                {
                    if ((object_index == obj_solid) || (object_index == obj_secretbigblock) || (object_index == obj_secretblock) || (object_index == obj_secretmetalblock))
                        visible = true
                }
                with (obj_slope)
                {
                    if ((object_index == obj_slope))
                        visible = true
                }
                with (obj_platform)
                {
                    if ((object_index == obj_platform))
                        visible = true
                }
            }
            if (!global.showcollisions)
            {
                with (obj_solid)
                {
                    if ((object_index == obj_solid) || (object_index == obj_secretbigblock) || (object_index == obj_secretblock) || (object_index == obj_secretmetalblock))
                        visible = false
                }
                with (obj_slope)
                {
                    if ((object_index == obj_slope))
                        visible = false
                }
                with (obj_platform)
                {
                    if ((object_index == obj_platform))
                        visible = false
                }
            }
            break
        case "showcollision true":
        case "showcollisions true":
            global.showcollisions = true
            with (obj_solid)
            {
                if ((object_index == obj_solid) || (object_index == obj_secretbigblock) || (object_index == obj_secretblock) || (object_index == obj_secretmetalblock) || (object_index == obj_mach3solid))
                    visible = true
            }
            with (obj_slope)
            {
                if ((object_index == obj_slope))
                    visible = true
            }
            with (obj_platform)
            {
                if ((object_index == obj_platform))
                    visible = true
            }
            break
        case "showcollision false":
        case "showcollisions false":
            global.showcollisions = false
            with (obj_solid)
            {
                if ((object_index == obj_solid) || (object_index == obj_secretbigblock) || (object_index == obj_secretblock) || (object_index == obj_secretmetalblock) || (object_index == obj_mach3solid))
                    visible = false
            }
            with (obj_slope)
            {
                if ((object_index == obj_slope))
                    visible = false
            }
            with (obj_platform)
            {
                if ((object_index == obj_platform))
                    visible = false
            }
            break
        case "oldasset true":
        case "oldassets true":
            global.oldsprites = true
            with (obj_pizzaboxunopen)
                sprite_index = spr_pizzaboxunopen
            with (obj_pizzaface)
                sprite_index = spr_pizzaface
            alarm[1] = 1
            break
        case "oldasset false":
        case "oldassets false":
            global.oldsprites = false
            with (obj_pizzaboxunopen)
                sprite_index = spr_pizzaboxunopen_1
            with (obj_pizzaface)
                sprite_index = spr_pizzaface_1
            alarm[1] = 1
            break
        case "oldasset":
        case "oldassets":
            global.oldsprites = (!global.oldsprites)
            switch global.oldsprites
            {
                case true:
                    with (obj_pizzaboxunopen)
                        sprite_index = spr_pizzaboxunopen
                    with (obj_pizzaface)
                        sprite_index = spr_pizzaface
                    with (obj_machalleffect)
                        sprite_index = spr_cloudeffect
                    with (obj_machalleffect)
                        sprite_index = spr_cloudeffect
                    break
                case false:
                    with (obj_pizzaboxunopen)
                        sprite_index = spr_pizzaboxunopen_1
                    with (obj_pizzaface)
                        sprite_index = spr_pizzaface_1
                    with (obj_machalleffect)
                        sprite_index = spr_cloudeffect_1
                    with (obj_machalleffect)
                        sprite_index = spr_cloudeffect_1
                    break
            }

            alarm[1] = 1
            break
        case "enablerank true":
        case "enableranks true":
            global.showrank = true
            break
        case "enablerank false":
        case "enableranks false":
            global.showrank = false
            break
        case "enablerank":
        case "enableranks":
            global.showrank = (!global.showrank)
            break
        case "hidetile":
        case "hidetiles":
            global.hidetiles = true
            break
        case "showtile":
        case "showtiles":
            global.hidetiles = false
            break
        case "toggletile":
        case "toggletiles":
            global.hidetiles = (!global.hidetiles)
            break
        case "character pepperman":
            with (obj_player1)
            {
                character = "M"
                ispeppino = 0
                scr_characterspr()
            }
            break
        case "character vigilante":
            with (obj_player1)
            {
                character = "V"
                ispeppino = 0
                scr_characterspr()
            }
            break
        case "character peppino":
            with (obj_player1)
            {
                character = "P"
                ispeppino = 1
                scr_characterspr()
            }
            break
        case "character oldnoise":
            with (obj_player1)
            {
                character = "N"
                ispeppino = 0
                scr_characterspr()
            }
            break
        case "character noise":
            with (obj_player1)
            {
                character = "P"
                ispeppino = 0
                scr_characterspr()
            }
            break
        case "character2 pepperman":
            with (obj_player2)
            {
                character = "M"
                ispeppino = 0
                scr_characterspr()
            }
            break
        case "character2 vigilante":
            with (obj_player2)
            {
                character = "V"
                ispeppino = 0
                scr_characterspr()
            }
            break
        case "character2 peppino":
            with (obj_player2)
            {
                character = "P"
                ispeppino = 1
                scr_characterspr()
            }
            break
        case "character2 oldnoise":
            with (obj_player2)
            {
                character = "N"
                ispeppino = 0
                scr_characterspr()
            }
            break
        case "character2 noise":
            with (obj_player2)
            {
                character = "P"
                ispeppino = 0
                scr_characterspr()
            }
            break
    }

}

function processedit_gml_Object_obj_virtual_controller_Create_0(argument0) //gml_Script_processedit_gml_Object_obj_virtual_controller_Create_0
{
    if ((global.selectedvbutton == undefined))
        return show_message_async("A button is not selected.");
    if ((string_pos("color", string_lower(argument0)) == 1))
    {
        var commands = string_split(argument0, " ")
        var argcount = 0
        var _red = 0
        var _green = 0
        var _blue = 0
        var i = 1
        while ((i < array_length(commands)))
        {
            if ((i == 2))
            {
                _red = int64(commands[i])
                argcount++
            }
            if ((i == 3))
            {
                _green = int64(commands[i])
                argcount++
            }
            if ((i == 4))
            {
                _blue = int64(commands[i])
                argcount++
            }
            if ((i >= 4))
                break
            else
                i++
        }
        if ((argcount == 3))
        {
            with (global.selectedvbutton)
                realcolor = make_color_rgb(_red, _green, _blue)
        }
    }
    if ((string_pos("scale", string_lower(argument0)) == 1))
    {
        commands = string_split(argument0, " ")
        argcount = 0
        var _scale = 1
        i = 1
        while ((i < array_length(commands)))
        {
            if ((i == 2))
            {
                _scale = real(commands[i])
                argcount++
            }
            if ((i >= 2))
                break
            else
                i++
        }
        if ((argcount == 1))
        {
            with (global.selectedvbutton)
            {
                image_xscale = _scale
                image_yscale = _scale
            }
        }
    }
    if ((string_pos("alpha", string_lower(argument0)) == 1))
    {
        commands = string_split(argument0, " ")
        argcount = 0
        var _alpha = 1
        i = 1
        while ((i < array_length(commands)))
        {
            if ((i == 2))
            {
                _alpha = real(commands[i])
                argcount++
            }
            if ((i >= 2))
                break
            else
                i++
        }
        if ((argcount == 1))
        {
            with (global.selectedvbutton)
                image_alpha = _alpha
        }
    }
    if ((string_pos("sprite", string_lower(argument0)) == 1))
    {
        commands = string_split(argument0, " ")
        argcount = 0
        var _sprite = spr_button_z
        i = 1
        while ((i < array_length(commands)))
        {
            if ((i == 2))
            {
                if sprite_exists(asset_get_index(commands[i]))
                    _sprite = asset_get_index(commands[i])
                argcount++
            }
            if ((i >= 2))
                break
            else
                i++
        }
        if ((argcount == 1))
        {
            with (global.selectedvbutton)
                sprite_index = _sprite
        }
    }
    if ((string_pos("image_speed", string_lower(argument0)) == 1))
    {
        commands = string_split(argument0, " ")
        argcount = 0
        var _speed = 0.35
        i = 1
        while ((i < array_length(commands)))
        {
            if ((i == 2))
            {
                _speed = real(commands[i])
                argcount++
            }
            if ((i >= 2))
                break
            else
                i++
        }
        if ((argcount == 1))
        {
            with (global.selectedvbutton)
                image_speed = _speed
        }
    }
}

