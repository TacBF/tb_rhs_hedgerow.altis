// setupHesco.sqf
// By Eagledude4 for tacBF

_static = cursorTarget;
_dir = getDir _static;
_class1 = "Land_HBarrierTower_F";
_class2 = "Land_BagFence_Long_F";

_exit = false;
{
	if (_x in (weapons _static)) exitwith {_exit = true};
} forEach ["RDS_TOWLauncherSingle", "mortar_82mm", "RHS_MK19", "RDS_SPG9", "RDS_AT13LauncherSingle"]; //Too dangerous to use roofed bunkers
if (_exit) exitwith {
	player globalChat "The sandbag bunker might be a safer bet ;)";
};

_spawnHigh = {
	params ["_xOffset","_yOffset"];
	_posF = _static modelToWorld [_xOffset-0.2,_yOffset-2,0];
	_posB = _static modelToWorld [_xOffset-0.2,_yOffset-5,0];
	_posR = _static modelToWorld [_xOffset+1.8,_yOffset-0.8,0];
	_posL = _static modelToWorld [_xOffset-2.2,_yOffset-0.8,0];


	_sbF = createVehicle [_class1, _posF, [], 0, "NONE"];
	_sbF setPos [_posF select 0, _posF select 1, -2.3];
	_sbF setDir ((getDir _static) + 180);
	_sbF setVectorUp (vectorUp _static);

	_sbB = createVehicle [_class2, _posB, [], 0, "NONE"];
	_sbB setPos [_posB select 0, _posB select 1, 0];
	_sbB setDir ((getDir _static) + 180);
	_sbB setVectorUp (vectorUp _static);

	_sbB_2 = createVehicle [_class2, _posB, [], 0, "NONE"];
	_sbB_2 setPos [_posB select 0, _posB select 1, 0.85];
	_sbB_2 setDir ((getDir _static) + 180);
	_sbB_2 setVectorUp (vectorUp _static);

	_sbR = createVehicle [_class2, _posR, [], 0, "NONE"];
	_sbR setPos [_posR select 0, _posR select 1, 1];
	_sbR setDir ((getDir _static) - 90);
	_sbR setVectorUp (vectorUp _static);

	_sbL = createVehicle [_class2, _posL, [], 0, "NONE"];
	_sbL setPos [_posL select 0, _posL select 1, 1];
	_sbL setDir ((getDir _static) + 90);
	_sbL setVectorUp (vectorUp _static);
};

_spawnHigh_Kord = {
	params ["_xOffset","_yOffset"];
	_posF = _static modelToWorld [_xOffset-0.2,_yOffset-2,0];
	_posB = _static modelToWorld [_xOffset-0.2,_yOffset-5,0];
	_posR = _static modelToWorld [_xOffset+1.8,_yOffset-0.8,0];
	_posL = _static modelToWorld [_xOffset-2.2,_yOffset-0.8,0];


	_sbF = createVehicle [_class1, _posF, [], 0, "NONE"];
	_sbF setPos [_posF select 0, _posF select 1, -2.4];
	_sbF setDir ((getDir _static) + 180);
	_sbF setVectorUp (vectorUp _static);

	_sbB = createVehicle [_class2, _posB, [], 0, "NONE"];
	_sbB setPos [_posB select 0, _posB select 1, 0];
	_sbB setDir ((getDir _static) + 180);
	_sbB setVectorUp (vectorUp _static);

	_sbB_2 = createVehicle [_class2, _posB, [], 0, "NONE"];
	_sbB_2 setPos [_posB select 0, _posB select 1, 0.85];
	_sbB_2 setDir ((getDir _static) + 180);
	_sbB_2 setVectorUp (vectorUp _static);

	_sbR = createVehicle [_class2, _posR, [], 0, "NONE"];
	_sbR setPos [_posR select 0, _posR select 1, 0.9];
	_sbR setDir ((getDir _static) - 90);
	_sbR setVectorUp (vectorUp _static);

	_sbL = createVehicle [_class2, _posL, [], 0, "NONE"];
	_sbL setPos [_posL select 0, _posL select 1, 0.9];
	_sbL setDir ((getDir _static) + 90);
	_sbL setVectorUp (vectorUp _static);
};

_spawnHigh_DSHKM = {
	params ["_xOffset","_yOffset"];
	_posF = _static modelToWorld [_xOffset-0.2,_yOffset-2,0];
	_posB = _static modelToWorld [_xOffset-0.2,_yOffset-5,0];
	_posR = _static modelToWorld [_xOffset+1.8,_yOffset-0.8,0];
	_posL = _static modelToWorld [_xOffset-2.2,_yOffset-0.8,0];


	_sbF = createVehicle [_class1, _posF, [], 0, "NONE"];
	_sbF setPos [_posF select 0, _posF select 1, -2.5];
	_sbF setDir ((getDir _static) + 180);
	_sbF setVectorUp (vectorUp _static);

	_sbB = createVehicle [_class2, _posB, [], 0, "NONE"];
	_sbB setPos [_posB select 0, _posB select 1, 0];
	_sbB setDir ((getDir _static) + 180);
	_sbB setVectorUp (vectorUp _static);

	_sbB_2 = createVehicle [_class2, _posB, [], 0, "NONE"];
	_sbB_2 setPos [_posB select 0, _posB select 1, 0.85];
	_sbB_2 setDir ((getDir _static) + 180);
	_sbB_2 setVectorUp (vectorUp _static);

	_sbR = createVehicle [_class2, _posR, [], 0, "NONE"];
	_sbR setPos [_posR select 0, _posR select 1, 0.8];
	_sbR setDir ((getDir _static) - 90);
	_sbR setVectorUp (vectorUp _static);

	_sbL = createVehicle [_class2, _posL, [], 0, "NONE"];
	_sbL setPos [_posL select 0, _posL select 1, 0.8];
	_sbL setDir ((getDir _static) + 90);
	_sbL setVectorUp (vectorUp _static);
};

_spawnLow = {
	params ["_xOffset","_yOffset"];
	_posF = _static modelToWorld [_xOffset-0.2,_yOffset-4,0];
	_posB = _static modelToWorld [_xOffset-0.2,_yOffset-7,0];
	_posR = _static modelToWorld [_xOffset+1.8,_yOffset-2.8,0];
	_posL = _static modelToWorld [_xOffset-2.2,_yOffset-2.8,0];


	_sbF = createVehicle [_class1, _posF, [], 0, "NONE"];
	_sbF setPos [_posF select 0, _posF select 1, -3.1];
	_sbF setDir ((getDir _static) + 180);
	_sbF setVectorUp (vectorUp _static);

	_sbB = createVehicle [_class2, _posB, [], 0, "NONE"];
	_sbB setPos [_posB select 0, _posB select 1, 0];
	_sbB setDir ((getDir _static) + 180);
	_sbB setVectorUp (vectorUp _static);

	_sbR = createVehicle [_class2, _posR, [], 0, "NONE"];
	_sbR setPos [_posR select 0, _posR select 1, 0.2];
	_sbR setDir ((getDir _static) - 90);
	_sbR setVectorUp (vectorUp _static);

	_sbL = createVehicle [_class2, _posL, [], 0, "NONE"];
	_sbL setPos [_posL select 0, _posL select 1, 0.2];
	_sbL setDir ((getDir _static) + 90);
	_sbL setVectorUp (vectorUp _static);
};


player globalChat "Setting up bunker...";
player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 13;
if (((nearestObject [player, "ICE_emptyHescoBagsStack"]) distance player) > 5) exitwith {
	player globalChat "Setup cancelled!";
};
"Land_ClutterCutter_large_F" createVehicle (getpos _static);
deleteVehicle (nearestObject [player, "ICE_emptyHescoBagsStack"]);
_static addEventHandler ["GetOut", {_this execVM "functions\checkForProne.sqf"}];
player globalChat "Setup complete.";

_bbr = boundingBoxReal _static;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
_maxLength = abs ((_p2 select 1) - (_p1 select 1));
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));

if (_static isKindOf "RDS_DSHKM_AAF") exitwith { //this is the parent class for the csat one as well rofl
	[0,0] call _spawnHigh_DSHKM;
};

if (_static isKindOf "RDS_KORD_Base") exitwith {
	[0,0] call _spawnHigh_Kord;
};

if (_maxheight > 2.8) then {
	player switchMove "amovpknlmstpsraswrfldnon";
	[0,0] call _spawnHigh;
} else {
	player switchMove "amovppnemstpsraswrfldnon";
	[0,2] call _spawnLow;
};