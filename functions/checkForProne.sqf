_static = _this select 0;
_player = _this select 2;
_bbr = boundingBoxReal _static;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
_maxLength = abs ((_p2 select 1) - (_p1 select 1));
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));

if (_maxheight > 2.8) then {
	_player switchMove "amovpknlmstpsraswrfldnon";
} else {
	_player switchMove "amovppnemstpsraswrfldnon";
};