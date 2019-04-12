///word_is_booster_pos(str);

if (is_undefined(argument0)) return false;
return ds_list_find_index(booster_pos, argument0)!=-1;
