var _temp_local_var_3, _temp_local_var_4;
function Command() constructor //gml_Script_Command
{
    static state = 1
    static Do = function() //gml_Script_anon_Command_gml_GlobalScript_Command_235_Command_gml_GlobalScript_Command
    {
    }

    static Undo = function() //gml_Script_anon_Command_gml_GlobalScript_Command_270_Command_gml_GlobalScript_Command
    {
    }

    static OnDelete = function() //gml_Script_anon_Command_gml_GlobalScript_Command_309_Command_gml_GlobalScript_Command
    {
    }

}

function PlaceCommand(argument0, argument1, argument2) constructor //gml_Script_PlaceCommand
{
    var _temp_local_var_3 = @@CopyStatic@@(gml_Script_Command)
    var _temp_local_var_4 = Command()
    static Do = function() //gml_Script_anon_PlaceCommand_gml_GlobalScript_Command_406_PlaceCommand_gml_GlobalScript_Command
    {
        if ((instance == noone))
        {
            instance = instance_create((snap_tile(x, 32) + object.place_xoffset), (snap_tile(y, 32) + object.place_yoffset), obj_fakeobject)
            with (instance)
            {
                sprite_index = other.object.sprite_index
                object = other.object.object_index
            }
            with (obj_editor)
            {
                scr_editor_clear_selectedobjects()
                ds_list_add(selectedobjects, other.instance)
            }
        }
        else
            instance_activate_object(instance)
    }

    static Undo = function() //gml_Script_anon_PlaceCommand_gml_GlobalScript_Command_881_PlaceCommand_gml_GlobalScript_Command
    {
        instance_deactivate_object(instance)
    }

    static OnDelete = function() //gml_Script_anon_PlaceCommand_gml_GlobalScript_Command_957_PlaceCommand_gml_GlobalScript_Command
    {
        if ((state == 0))
        {
            instance_activate_object(instance)
            instance_destroy(instance)
        }
    }

    x = argument0
    y = argument1
    object = argument2
    instance = noone
}

