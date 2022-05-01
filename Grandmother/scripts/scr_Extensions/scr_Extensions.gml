function reverseArray(_arr) {
	
	var result = array_create(0);
	
	var arrCopy = array_create(0);
	array_copy(arrCopy, 0, _arr, 0, array_length(_arr));
	
	while(array_length(arrCopy) > 0) {
		array_push(result, array_pop(arrCopy));
	}
	
	return result;

}