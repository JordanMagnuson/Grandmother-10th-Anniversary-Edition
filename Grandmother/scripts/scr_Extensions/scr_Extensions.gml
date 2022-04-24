function getRGB(_color) {
	return (color_get_red(_color) << 16) | (color_get_green(_color) << 8) | (color_get_blue(_color));
}

function numColor(_num) {
	return make_color_rgb((_num >> 16) & 0xFF, (_num >> 8) & 0xFF, _num & 0xFF);
}

function reverseArray(_arr) {
	
	var result = array_create(0);
	
	var arrCopy = array_create(0);
	array_copy(arrCopy, 0, _arr, 0, array_length(_arr));
	
	while(array_length(arrCopy) > 0) {
		array_push(result, array_pop(arrCopy));
	}
	
	return result;

}