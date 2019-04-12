///raw_data_to_list(string, ds_list, find);

var ds_map, find, resultMap;
resultMap = json_decode(argument0);
ds_map = argument1;
find = argument2;

if (ds_exists(resultMap, ds_type_map)) {
    var list = ds_map_find_value(resultMap, find);
    ds_list_copy(ds_map, list);
    ds_map_destroy(resultMap);
    
    return true;
}

return false;
