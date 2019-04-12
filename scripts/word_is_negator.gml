///word_is_negator(str);

if (is_undefined(argument0)) return false;
return ds_list_find_index(negators, argument0)!=-1;
