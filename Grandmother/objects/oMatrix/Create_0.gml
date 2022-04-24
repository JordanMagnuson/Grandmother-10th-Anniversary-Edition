_matrix = noone;

function Matrix(_a = 1, _b = 0, _c = 0, _d = 1, _tx = 0, _ty = 0) {
	self._matrix = [[_a, _b, _tx], [_c, _d, _ty], [0, 0, 1]]; 
}

function identity() {
	self.Matrix();	
}

function translate(_dx, _dy) {
	self._matrix[0][2] += _dx;
	self._matrix[1][2] += _dy;
}