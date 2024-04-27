button1clicked = 0
button1height = 50
button1width = 50
button1x = 0
button1y = 0
button2clicked = 0
button2height = 50
button2width = 50
button2x = 60
button2y = 0
button3height = 50
button3width = 50
button3x = 120
button3y = 0
button4height = 50
button4width = 50
button4x = 180
button4y = 0
dragmode = 0
copymode = 0
editormode = 0
selectedent = undefined
oldselectedent = undefined
old_object_x = 0
old_object_y = 0
object_clicked = 0
dsxioks = undefined
amogustextlol = undefined
nejdmssx = ""
transfotip = undefined
exclude_object_hide_arr = [529, 195, 804, 701]
variabletochange = ""
door_object_arr = [223, 608, 806, 604, 602, 254]
depth = -19998
if ((instance_number(object_index) > 1))
    instance_destroy()
function save_editor_objects_gml_Object_obj_fakeeditor_Create_0() //save_editor_objects_gml_Object_obj_fakeeditor_Create_0
{
    var myobjects = array_create(0)
    with (all)
    {
        if variable_instance_exists(id, "createdbyeditor")
        {
            var objectproperties = 
            {
                x: x,
                y: y,
                image_angle: image_angle,
                image_xscale: image_xscale,
                image_yscale: image_yscale,
                image_speed: image_speed,
                persistent: persistent,
                image_blend: image_blend,
                object_index: object_index
            }

            var var_array = variable_instance_get_names(id)
            for (var i = 0; i < array_length(var_array); i++)
                variable_struct_set(objectproperties, var_array[i], variable_instance_get(id, var_array[i]))
            array_push(myobjects, objectproperties)
        }
    }
    var objectsstring = json_stringify(myobjects)
    get_string_async("save code:", objectsstring)
}

function createeditorobject_gml_Object_obj_fakeeditor_Create_0(argument0) //createeditorobject_gml_Object_obj_fakeeditor_Create_0
{
    with (instance_create(0, 0, argument0.object_index))
    {
        var var_array = variable_struct_get_names(argument0)
        for (var i = 0; i < array_length(var_array); i++)
        {
            if ((var_array[i] != "object_index"))
                variable_instance_set(id, var_array[i], variable_struct_get(argument0, var_array[i]))
        }
    }
}

function load_editor_objects_gml_Object_obj_fakeeditor_Create_0(argument0) //load_editor_objects_gml_Object_obj_fakeeditor_Create_0
{
    if ((!is_string(argument0)) || (argument0 == ""))
        show_message_async("No input provided")
    else
    {
        var objload = ""
        objload = json_parse(argument0)
        while ((array_length(objload) > 0))
        {
            var loadedobject = array_pop(objload)
            self.createeditorobject(loadedobject)
        }
    }
}

function edit_object_var_gml_Object_obj_fakeeditor_Create_0(argument0) //edit_object_var_gml_Object_obj_fakeeditor_Create_0
{
    var commands = string_split(argument0, " ")
    var i = 1
    while ((i < array_length(commands)))
    {
        if ((i == 1))
        {
            tempvartype = string(commands[i])
            if ((tempvartype != "bool") && (tempvartype != "string") && (tempvartype != "int") && (tempvartype != "float") && (tempvartype != "real") && (tempvartype != "asset"))
            {
                show_message_async((("invalid type \"" + commands[i]) + "\" Available types: bool, string, int, float, real, asset"))
                break
            }
            else
            {
                if ((i == 2))
                {
                    oldvariable = variabletochange
                    variabletochange = commands[i]
                    if (!(variable_instance_exists(selectedent, variabletochange)))
                    {
                        variabletochange = oldvariable
                        show_message_async("variable does not exist, defaulting to previous variable.")
                    }
                }
                if ((i == 3))
                {
                    switch tempvartype
                    {
                        case "bool":
                            if is_bool(bool(commands[i]))
                            {
                                variable_instance_set(selectedent, variabletochange, bool(commands[i]))
                                show_message_async("successfully set bool")
                            }
                            break
                        case "int":
                            if is_int64(int64(commands[i]))
                            {
                                variable_instance_set(selectedent, variabletochange, int64(commands[i]))
                                show_message_async("successfully set int")
                            }
                            break
                        case "float":
                        case "real":
                            if is_real(real(commands[i]))
                            {
                                variable_instance_set(selectedent, variabletochange, real(commands[i]))
                                show_message_async("successfully set real")
                            }
                            break
                        case "string":
                            if is_string(commands[i])
                            {
                                variable_instance_set(selectedent, variabletochange, commands[i])
                                show_message_async("successfully set string")
                            }
                            break
                        case "asset":
                            if ((asset_get_index(commands[i]) > -1))
                            {
                                variable_instance_set(selectedent, variabletochange, asset_get_index(commands[i]))
                                show_message_async("successfully set asset")
                            }
                            break
                    }

                }
                if ((i >= 3))
                    break
                else
                    i++
            }
        }
        else if ((i == 2))
        {
            oldvariable = variabletochange
            variabletochange = commands[i]
            if (!instance_exists(selectedent))
            {
                show_message_async("instance does not exist.")
                break
            }
            else if (!(variable_instance_exists(selectedent, variabletochange)))
            {
                variabletochange = oldvariable
                show_message_async("variable does not exist.")
                break
            }
            else
            {
                if ((i == 3))
                {
                    switch tempvartype
                    {
                        case "bool":
                            if is_bool(bool(commands[i]))
                            {
                                variable_instance_set(selectedent, variabletochange, bool(commands[i]))
                                show_message_async("successfully set bool")
                            }
                            break
                        case "int":
                            if is_int64(int64(commands[i]))
                            {
                                variable_instance_set(selectedent, variabletochange, int64(commands[i]))
                                show_message_async("successfully set int")
                            }
                            break
                        case "float":
                        case "real":
                            if is_real(real(commands[i]))
                            {
                                variable_instance_set(selectedent, variabletochange, real(commands[i]))
                                show_message_async("successfully set real")
                            }
                            break
                        case "string":
                            if is_string(commands[i])
                            {
                                variable_instance_set(selectedent, variabletochange, commands[i])
                                show_message_async("successfully set string")
                            }
                            break
                        case "asset":
                            if ((asset_get_index(commands[i]) > -1))
                            {
                                variable_instance_set(selectedent, variabletochange, asset_get_index(commands[i]))
                                show_message_async("successfully set asset")
                            }
                            break
                    }

                }
                if ((i >= 3))
                    break
                else
                    i++
            }
        }
        else
        {
            if ((i == 3))
            {
                switch tempvartype
                {
                    case "bool":
                        if is_bool(bool(commands[i]))
                        {
                            variable_instance_set(selectedent, variabletochange, bool(commands[i]))
                            show_message_async("successfully set bool")
                        }
                        break
                    case "int":
                        if is_int64(int64(commands[i]))
                        {
                            variable_instance_set(selectedent, variabletochange, int64(commands[i]))
                            show_message_async("successfully set int")
                        }
                        break
                    case "float":
                    case "real":
                        if is_real(real(commands[i]))
                        {
                            variable_instance_set(selectedent, variabletochange, real(commands[i]))
                            show_message_async("successfully set real")
                        }
                        break
                    case "string":
                        if is_string(commands[i])
                        {
                            variable_instance_set(selectedent, variabletochange, commands[i])
                            show_message_async("successfully set string")
                        }
                        break
                    case "asset":
                        if ((asset_get_index(commands[i]) > -1))
                        {
                            variable_instance_set(selectedent, variabletochange, asset_get_index(commands[i]))
                            show_message_async("successfully set asset")
                        }
                        break
                }

            }
            if ((i >= 3))
                break
            else
                i++
        }
    }
}

