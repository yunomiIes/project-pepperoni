var i_d = ds_map_find_value(async_load, "id")
if ((i_d == dsxioks))
{
    if ds_map_find_value(async_load, "status")
    {
        if ((ds_map_find_value(async_load, "result") != ""))
        {
            nejdmssx = ds_map_find_value(async_load, "result")
            if ((nejdmssx != "save") && (nejdmssx != "load"))
                self.edit_object_var(nejdmssx)
            else
            {
                if ((nejdmssx == "save"))
                    self.save_editor_objects()
                if ((nejdmssx == "load"))
                    amogustextlol = get_string_async("load code: ", "")
            }
        }
    }
}
if ((i_d == amogustextlol))
{
    if ds_map_find_value(async_load, "status")
    {
        if ((ds_map_find_value(async_load, "result") != ""))
            self.load_editor_objects(ds_map_find_value(async_load, "result"))
    }
}
