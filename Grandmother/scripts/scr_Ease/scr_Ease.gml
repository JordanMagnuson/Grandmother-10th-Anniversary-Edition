#macro PI2 (pi / 2)
#macro B1 (1 / 2.75)
#macro B2 (2 / 2.75)
#macro B3 (1.5 / 2.75)
#macro B4 (2.5 / 2.75)
#macro B5 (2.25 / 2.75)
#macro B6 (2.625 / 2.75)

function quadIn(_t) {
	return _t * _t;	
}

function quadOut(_t) {
	return -_t * (_t - 2);	
}

function quadInOut(_t) {
	
	if(_t <= 0.5) {
		return _t * _t * 2;
	}
	
	_t--;
	return 1 - _t * _t * 2;	
}

function cubeIn(_t) {
	return _t * _t * _t;	
}

function cubeOut(_t) {
	return 1 + (--_t) * _t * _t;
}

function cubeInOut(_t) {
	
}

function quartIn(_t) {
	return _t * _t * _t * _t;
}

function quartOut(_t) {
	_t--;
	return 1 - _t * _t * _t * _t;
}

function quartInOut(_t) {
	
	if(_t <= 0.5) {
		return 	_t * _t * _t * _t * 8;
	}
	
	_t = _t * 2 - 2;
	return (1 - _t * _t *_t * _t) / 2 + 0.5;

}

function quintIn(_t) {
	return _t * _t * _t * _t * _t;
}

function quintOut(_t) {
	_t--;
	return _t * _t * _t * _t * _t + 1;
}

function quintInOut(_t) {
	
	_t *= 2;
	
	if(_t < 1) {
		return 	(_t * _t * _t * _t * _t) / 2;
	}
	
	_t -= 2;
	return (_t * _t * _t * _t * _t + 2) / 2;

}

function sineIn(_t) {
	return -cos(PI2 * _t) + 1;
}

function sineOut(_t) {
	return sin(PI2 * _t);
}

function sineInOut(_t) {
	return -cos(pi * _t) / 2 + .5;
}

function bounceIn(_t) {
	_t = 1 - _t;
	if (_t < B1) return 1 - 7.5625 * _t * _t;
	if (_t < B2) return 1 - (7.5625 * (_t - B3) * (_t - B3) + .75);
	if (_t < B4) return 1 - (7.5625 * (_t - B5) * (_t - B5) + .9375);
	return 1 - (7.5625 * (_t - B6) * (_t - B6) + .984375);
}

function bounceOut(_t) {
	if (_t < B1) return 7.5625 * _t * _t;
	if (_t < B2) return 7.5625 * (_t - B3) * (_t - B3) + .75;
	if (_t < B4) return 7.5625 * (_t - B5) * (_t - B5) + .9375;
	return 7.5625 * (_t - B6) * (_t - B6) + .984375;
}

function bounceInOut(_t) {
	if (_t < .5)
	{
		_t = 1 - _t * 2;
		if (_t < B1) return (1 - 7.5625 * _t * _t) / 2;
		if (_t < B2) return (1 - (7.5625 * (_t - B3) * (_t - B3) + .75)) / 2;
		if (_t < B4) return (1 - (7.5625 * (_t - B5) * (_t - B5) + .9375)) / 2;
		return (1 - (7.5625 * (_t - B6) * (_t - B6) + .984375)) / 2;
	}
	_t = _t * 2 - 1;
	if (_t < B1) return (7.5625 * _t * _t) / 2 + .5;
	if (_t < B2) return (7.5625 * (_t - B3) * (_t - B3) + .75) / 2 + .5;
	if (_t < B4) return (7.5625 * (_t - B5) * (_t - B5) + .9375) / 2 + .5;
	return (7.5625 * (_t - B6) * (_t - B6) + .984375) / 2 + .5;
}

function circIn(_t) {
	return -(sqrt(1 - _t * _t) - 1);
}

function circOut(_t) {
	return sqrt(1 - (_t - 1) * (_t - 1));
}

function circInOut(_t) {
	return _t <= .5 ? (sqrt(1 - _t * _t * 4) - 1) / -2 : (sqrt(1 - (_t * 2 - 2) * (_t * 2 - 2)) + 1) / 2;
}

function expoIn(_t) {
	return power(2, 10 * (_t - 1));
}

function expoOut(_t) {
	return -power(2, -10 * _t) + 1;
}

function expoInOut(_t) {
	return _t < .5 ? power(2, 10 * (_t * 2 - 1)) / 2 : (-power(2, -10 * (_t * 2 - 1)) + 2) / 2;
}

function backIn(_t) {
	return _t * _t * (2.70158 * _t - 1.70158);
}

function backOut(_t) {
	_t--;
	return 1 - _t * (_t) * (-2.70158 * _t - 1.70158);
}

function backInOut(_t) {
	_t *= 2;
	if (_t < 1) return _t * _t * (2.70158 * _t - 1.70158) / 2;
	_t -= 2;
	return (1 - _t * _t * (-2.70158 * _t - 1.70158)) / 2 + .5;
}