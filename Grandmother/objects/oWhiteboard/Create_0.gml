clean = false;
_eraser = noone; //Bitmap
_matrix = noone; //Matrix
_colorTransform = noone; //ColorTransform

function Whiteboard(_source, _eraser) {
	self.sprite_index = _source;
	self._eraser = _eraser;
	self._matrix = instance_create_depth(0, 0, 0, oMatrix);
	self._matrix.Matrix();
	self._colorTransform = [1, 1, 1, 1, 0, 0, 0, 0];
}