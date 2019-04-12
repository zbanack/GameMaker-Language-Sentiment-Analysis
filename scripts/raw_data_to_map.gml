///raw_data_to_map(string, ds_map, find);

var data = argument0;
var ds_map = argument1;
var find = argument2;

var resultMap = json_decode(data);

if (ds_exists(resultMap, ds_type_map)) {
    var list = ds_map_find_value(resultMap, find);
    for (var n = 0; n < ds_list_size(list); n++;) {
        var lst = ds_list_find_value(list, n);
        
        var word = ds_list_find_value(lst, 0);
        var val = ds_list_find_value(lst, 1);
        ds_map[? word] = val;
    }
    ds_map_destroy(resultMap);
}
