// setupSandbags.sqf
// By Eagledude4 for tacBF

_static = cursorTarget;
_dir = getDir _static;
_class1 = "Land_BagFence_Round_F";

_spawnHigh = {
	params ["_xOffset","_yOffset","_maxHeight"];
	_posF = _static modelToWorld [_xOffset-0.4,_yOffset+0.9,0];
	_posR = _static modelToWorld [_xOffset+1.2,_yOffset-0.8,0];
	_posL = _static modelToWorld [_xOffset-2.1,_yOffset-0.8,0];

	_sbF = createVehicle [_class1, _posF, [], 0, "NONE"];
	_sbF setPosATL [_posF select 0, _posF select 1, 0];
	_sbF setDir ((getDir _static) + 180);
	_sbF setVectorUp (vectorUp _static);
	_sbF_2 = createVehicle [_class1, _posF, [], 0, "NONE"];
	_sbF_2 setPosATL [_posF select 0, _posF select 1, 0.3];
	_sbF_2 setDir ((getDir _static) + 180);
	_sbF_2 setVectorUp (vectorUp _static);

	_sbR = createVehicle [_class1, _posR, [], 0, "NONE"];
	_sbR setPosATL [_posR select 0, _posR select 1, 0];
	_sbR setDir ((getDir _static) - 90);
	_sbR setVectorUp (vectorUp _static);
	_sbR_2 = createVehicle [_class1, _posR, [], 0, "NONE"];
	_sbR_2 setPosATL [_posR select 0, _posR select 1, 0.85];
	_sbR_2 setDir ((getDir _static) - 90);
	_sbR_2 setVectorUp (vectorUp _static);

	_sbL = createVehicle [_class1, _posL, [], 0, "NONE"];
	_sbL setPosATL [_posL select 0, _posL select 1, 0];
	_sbL setDir ((getDir _static) + 90);
	_sbL setVectorUp (vectorUp _static);
	_sbL_2 = createVehicle [_class1, _posL, [], 0, "NONE"];
	_sbL_2 setPosATL [_posL select 0, _posL select 1, 0.85];
	_sbL_2 setDir ((getDir _static) + 90);
	_sbL_2 setVectorUp (vectorUp _static);


};

_spawnLow = {
	params ["_xOffset","_yOffset","_maxHeight"];
	_posF = _static modelToWorld [_xOffset-0.4,_yOffset+0.9,0];
	_posR = _static modelToWorld [_xOffset+1.2,_yOffset-0.8,0];
	_posL = _static modelToWorld [_xOffset-2.1,_yOffset-0.8,0];

	_sbF = createVehicle [_class1, _posF, [], 0, "NONE"];
	_sbF setPosATL [_posF select 0, _posF select 1, -0.4];
	_sbF setDir ((getDir _static) + 180);
	_sbF setVectorUp (vectorUp _static);

	_sbR = createVehicle [_class1, _posR, [], 0, "NONE"];
	_sbR setPosATL [_posR select 0, _posR select 1, 0];
	_sbR setDir ((getDir _static) - 90);
	_sbR setVectorUp (vectorUp _static);
	_sbR_2 = createVehicle [_class1, _posR, [], 0, "NONE"];
	_sbR_2 setPosATL [_posR select 0, _posR select 1, 0.2];
	_sbR_2 setDir ((getDir _static) - 90);
	_sbR_2 setVectorUp (vectorUp _static);

	_sbL = createVehicle [_class1, _posL, [], 0, "NONE"];
	_sbL setPosATL [_posL select 0, _posL select 1, 0];
	_sbL setDir ((getDir _static) + 90);
	_sbL setVectorUp (vectorUp _static);
	_sbL_2 = createVehicle [_class1, _posL, [], 0, "NONE"];
	_sbL_2 setPosATL [_posL select 0, _posL select 1, 0.2];
	_sbL_2 setDir ((getDir _static) + 90);
	_sbL_2 setVectorUp (vectorUp _static);
};

_spawnLow_Mortar = {
	params ["_xOffset","_yOffset","_maxHeight"];
	_posF = _static modelToWorld [_xOffset-0,_yOffset+2,0];
	_posR = _static modelToWorld [_xOffset+1.5,_yOffset+0.4,0];
	_posL = _static modelToWorld [_xOffset-1.6,_yOffset+0.4,0];

	_sbF = createVehicle [_class1, _posF, [], 0, "NONE"];
	_sbF setPosATL [_posF select 0, _posF select 1, 0];
	_sbF setDir ((getDir _static) + 180);
	_sbF setVectorUp (vectorUp _static);
	_sbF_2 = createVehicle [_class1, _posF, [], 0, "NONE"];
	_sbF_2 setPosATL [_posF select 0, _posF select 1, 0.85];
	_sbF_2 setDir ((getDir _static) + 180);
	_sbF_2 setVectorUp (vectorUp _static);

	_sbR = createVehicle [_class1, _posR, [], 0, "NONE"];
	_sbR setPosATL [_posR select 0, _posR select 1, 0];
	_sbR setDir ((getDir _static) - 90);
	_sbR setVectorUp (vectorUp _static);
	_sbR_2 = createVehicle [_class1, _posR, [], 0, "NONE"];
	_sbR_2 setPosATL [_posR select 0, _posR select 1, 0.85];
	_sbR_2 setDir ((getDir _static) - 90);
	_sbR_2 setVectorUp (vectorUp _static);

	_sbL = createVehicle [_class1, _posL, [], 0, "NONE"];
	_sbL setPosATL [_posL select 0, _posL select 1, 0];
	_sbL setDir ((getDir _static) + 90);
	_sbL setVectorUp (vectorUp _static);
	_sbL_2 = createVehicle [_class1, _posL, [], 0, "NONE"];
	_sbL_2 setPosATL [_posL select 0, _posL select 1, 0.85];
	_sbL_2 setDir ((getDir _static) + 90);
	_sbL_2 setVectorUp (vectorUp _static);
};

_spawnLow_TOW = {
	params ["_xOffset","_yOffset","_maxHeight"];
	_posF = _static modelToWorld [_xOffset+0,_yOffset+0.5,0];
	_posR = _static modelToWorld [_xOffset+1.8,_yOffset-1,0];
	_posL = _static modelToWorld [_xOffset-1.8,_yOffset-1,0];

	_sbF = createVehicle [_class1, _posF, [], 0, "NONE"];
	_sbF setPos [_posF select 0, _posF select 1, -0.2];
	_sbF setDir ((getDir _static) + 180);
	_sbF setVectorUp (vectorUp _static);

	_sbR = createVehicle [_class1, _posR, [], 0, "NONE"];
	_sbR setPosATL [_posR select 0, _posR select 1, 0];
	_sbR setDir ((getDir _static) - 90);
	_sbR setVectorUp (vectorUp _static);
	_sbR_2 = createVehicle [_class1, _posR, [], 0, "NONE"];
	_sbR_2 setPosATL [_posR select 0, _posR select 1, 0.5];
	_sbR_2 setDir ((getDir _static) - 90);
	_sbR_2 setVectorUp (vectorUp _static);

	_sbL = createVehicle [_class1, _posL, [], 0, "NONE"];
	_sbL setPosATL [_posL select 0, _posL select 1, 0];
	_sbL setDir ((getDir _static) + 90);
	_sbL setVectorUp (vectorUp _static);
	_sbL_2 = createVehicle [_class1, _posL, [], 0, "NONE"];
	_sbL_2 setPosATL [_posL select 0, _posL select 1, 0.5];
	_sbL_2 setDir ((getDir _static) + 90);
	_sbL_2 setVectorUp (vectorUp _static);
};

player globalChat "Setting up bunker...";
player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 13;
if (((nearestObject [player, "ICE_emptySandbagsTimberStack"]) distance player) > 5) exitwith {
	player globalChat "Setup cancelled!";
};
"Land_ClutterCutter_large_F" createVehicle (getpos _static);
deleteVehicle (nearestObject [player, "ICE_emptySandbagsTimberStack"]);
player globalChat "Setup complete.";

_bbr = boundingBoxReal _static;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
_maxLength = abs ((_p2 select 1) - (_p1 select 1));
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));


if ("RDS_TOWLauncherSingle" in (weapons _static)) exitwith {
	[0,0,_maxheight] call _spawnLow_TOW;
};


if (_maxheight > 2.8) then {
	[0,0,_maxheight] call _spawnHigh;
} else {
	if ("mortar_82mm" in (weapons _static)) then {
		[0,0,_maxheight] call _spawnLow_Mortar;
	} else {
		[0,0,_maxheight] call _spawnLow;
	};
};