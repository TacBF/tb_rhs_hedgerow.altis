_script=[] execvm "functions\fastrope.sqf";
waituntil {scriptdone _script};

//Activate Fast rope feature if ON
if (tb_FastRopeEnabled) then
{
	private ["_unit"];
	_unit=player;
	//Initalize the addaction menu for the player
	[] call tb_fastrope;
	//Add respawn event to re add the addactio menu on player death
	_unit addEventHandler ["Respawn", {[] call tb_fastrope;}];
};