if (!variable_global_exists("titlecutscene"))
    global.titlecutscene = 1
if global.titlecutscene
    scene_info = [[gml_Script_cutscene_title_start], [gml_Script_cutscene_set_sprite, 349, 1460, 0.35, 1], [gml_Script_cutscene_wait, 120], [gml_Script_cutscene_title_middle], [gml_Script_cutscene_set_sprite, 349, 675, 0.3, -1], [gml_Script_cutscene_set_vsp, 349, -6], [gml_Script_cutscene_waitfor_sprite, 349], [gml_Script_cutscene_title_end]]
else
    scene_info = [[gml_Script_cutscene_wait, 2]]
