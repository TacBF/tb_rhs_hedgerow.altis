/*---------------------------------------------------------------------------
	execVM this from init.sqf
---------------------------------------------------------------------------*/
[] spawn {
	waitUntil { (player == player) };
	_disableTI = format ["params ['_unit', '_weapon']; _weapon disableTIEquipment true;"];
	player addEventHandler ["WeaponAssembled", _disableTI];
};