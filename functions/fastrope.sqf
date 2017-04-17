//Fastrope enabled
tb_FastRopeEnabled=true;
//Fastrope rope lenght
tb_FastRopeLength=37;

waitUntil {player == player};
//Flexible addaction 
tb_AddAction=
{
  private ["_object","_action","_script","_arguments","_priority","_showWindow","_hideOnUse","_shortcut","_condition"];
  _object=_this select 0;
  _action=_this select 1;
  _script=_this select 2;
  if (count _this > 3) then {_arguments = _this select 3};
  if (count _this > 4) then {_priority = _this select 4};
  if (count _this > 5) then {_showWindow = _this select 5};
  if (count _this > 6) then {_hideOnUse = _this select 6};
  if (count _this > 7) then {_shortcut = _this select 7};
  if (count _this > 8) then {_condition = _this select 8};
  if (isNil "_arguments") then {_arguments = []};
  if (isNil "_priority") then {_priority = 100};
  if (isNil "_showWindow") then {_showWindow = TRUE};
  if (isNil "_hideOnUse") then {_hideOnUse = TRUE};
  if (isNil "_shortcut") then {_shortcut = ""};
  if (isNil "_condition") then {_condition = "TRUE"};

  //player sidechat "addaction";
  _action = _object addaction [_action,"functions\tb_addaction.sqf",_arguments,_priority,_showWindow,_hideOnUse,_shortcut,_condition];
  _object setvariable [format["tbaction_%1",_action],_script,true]; 
  _action;
};

//Execute action function
tb_ExecuteAction={
	private ["_object","_caller","_id","_script"];
  //hint format["%1",_this];
  _object=_this select 0;
  _caller=_this select 1;
  _id=_this select 2;
  
  _script=_object getVariable (format["tbaction_%1",_id]);
  _this call _script; 
};

tb_fastropedoor=
{
	_strinstr=
	{
		private ["_needle","_haystack","_needleLen","_hay","_found"];
		 _needle = _this select 1;
		 _haystack = toArray (_this select 0);
		 _needleLen = count toArray _needle; 
		 _hay = +_haystack;
		 _hay resize _needleLen; 
		 _found = false;
		 for "_i" from _needleLen to count _haystack do 
		 {
			 if (toString _hay == _needle) exitWith {_found = true};
			 _hay set [_needleLen, _haystack select _i];
			 _hay set [0, "x"]; _hay = _hay - ["x"] 
		 };
	 _found;
	 };
	 private ["_helico","_state","_doorlist","_cfg","_cname"];
	 _helico=_this select 0;
	 _state=_this select 1;
	 _cfg=(configFile >> "CfgVehicles" >> (typeof _helico) >> "AnimationSources");
	 _doorlist=[];
	 for "_i" from 0 to count (_cfg)-1 do
	 {
		_cname=configname (_cfg select _i);
		if ( ([_cname,"door"] call _strinstr) or ([_cname,"ramp"] call _strinstr) ) then
		{
				_doorlist set [count _doorlist,_cname];
		};
	 };
	 //systemchat str _doorlist;
	 if ((count _doorlist)>0) then
	 {
		{
			_helico animate [_x,_state];
			_helico animatedoor [_x,_state];
		} foreach _doorlist;
	};
};


tb_fastropedraw=
{
 private ['_ropeY','_vecdir','_gen','_caller','_id','_initpos','_simu','_loop','_vx','_vy','_step','_time','_source','_possource','_poslink','_offset','_posoffset','_ropedist','_maxropedist','_dist'];
 _source=_this select 0;
 _gen=_this select 1;
 _offset=_source worldToModel getpos _gen;
 _loop=true;
 _simu=0.01;
 _ropeY=0.3;
 _maxropedist=tb_FastRopeLength;
 _time=time;
 //_gen switchmove "commander_apcwheeled2_out";
 //
 _gen spawn {waituntil {(vehicle _this==_this)};_this switchmove "commander_apcwheeled2_out";};
 while {_loop} do
 {
  
  _possource=visiblePositionASL _source;
  if !(surfaceiswater _possource) then {_possource=asltoatl _possource};
  _poslink=aimPos _gen;
  if !(surfaceiswater _poslink) then {_poslink=asltoatl _poslink};
  
  _posoffset=_source modeltoworld [(_offset select 0)/1.5,_offset select 1,_offset select 2];
  
  _vecdir=vectordir _gen;
  _vecdir=[(_vecdir select 0)*_ropeY,(_vecdir select 1)*_ropeY,(_vecdir select 2)*_ropeY];
  _poslink=[(_poslink select 0)+(_vecdir select 0),(_poslink select 1)+(_vecdir select 1),(_poslink select 2)];
  
  drawLine3D [[(_posoffset select 0),(_posoffset select 1),(_possource select 2)+1.0],[(_poslink select 0),(_poslink select 1),(_poslink select 2)],[0,0,0,1]];
  _dist=_gen distance _source;
  if ((_poslink select 2)+_dist<=_maxropedist) then {_ropedist=0;} else {_ropedist=((_poslink select 2)+_dist)-_maxropedist;};
  drawLine3D [[(_poslink select 0),(_poslink select 1),(_poslink select 2)],[(_poslink select 0),(_poslink select 1),_ropedist],[0,0,0,1]];
  //drawLine3D [[(_possource select 0),(_possource select 1),(_possource select 2)+0.5],[(_poslink select 0),(_poslink select 1),(_poslink select 2)],[0,0,0,1]];
  //drawLine3D [[(_possource select 0)+0.01,(_possource select 1)+0.01,_possource select 2],[(_poslink select 0)+0.01,(_poslink select 1)+0.01,(_poslink select 2)],[0,0,0,1]];
  //drawLine3D [[(_possource select 0)-0.01,(_possource select 1)-0.01,_possource select 2],[(_poslink select 0)+0.01,(_poslink select 1)+0.01,(_poslink select 2)],[0,0,0,1]];
  sleep _simu;
  if (((getpos _gen select 2)<0.5) or ((_time+10)<time) or (_dist>_maxropedist)) then {_loop=false;};
 };
 _gen switchmove "";
};


tb_fastropego=
{
	private ['_gen','_caller','_id','_initpos','_simu','_loop','_vx','_vy','_step','_time','_source','_possource','_poslink','_maxropedist'];
	
	_gen = _this select 0;
	//_caller = _this select 1;
	//_id = _this select 2;
	_source=vehicle _gen;
	if ((vehicle _source==_gen) or (driver _source==_gen)) exitwith {};
	moveout _gen;
	unassignVehicle _gen;
	//_gen removeAction _id;	
	_loop=true;
	_simu=0.01;
	_step=-6;
	_maxropedist=tb_FastRopeLength+1;
	_time=time;
	[[_source,_gen],"tb_fastropedraw"] spawn BIS_fnc_MP;
	while {_loop} do
	{
		sleep _simu;
		_vx=velocity _gen select 0;
		_vy=velocity _gen select 1;
		if (_vx>0) then {_vx=_vx-(_simu*-_step);} else {_vx=_vx+(_simu*-_step);};
		if (_vy>0) then {_vy=_vy-(_simu*-_step);} else {_vy=_vy+(_simu*-_step);};
		_gen setvelocity [_vx,_vy,_step];	
		if (((getpos _gen select 2)<0.5) or ((_time+10)<time) or ((_gen distance _source)>_maxropedist)) then {_loop=false;};		
	
	};
	sleep 0.1;
	player switchmove "";

};

tb_fastropecargoallowropecheck=
{
	private '_b';
	_b=false;
	if (vehicle player!=player) then
	{
		if (driver vehicle player!= player) then
		{
			if ((vehicle player) iskindof 'Helicopter') then
			{
				_b=(vehicle player) getvariable ['tb_fastropeready',false];
			};
		};
	};
	_b;
};

tb_fastropepilotallowcheck=
{
	private ['_b','_s'];
	_b=false;
	if (vehicle player!=player) then
	{
		if ((driver vehicle player)==player) then
		{
			if ((vehicle player) iskindof 'Helicopter') then
			{
				_s=gettext (configfile >> 'cfgVehicles' >> (typeof (vehicle player)) >> 'simulation');
				if (_s=='helicopter' or _s=='helicopterx' or _s=='helicopterrtd') then
				{
					if (getnumber (configfile >> 'cfgVehicles' >> (typeof (vehicle player)) >> 'transportsoldier')>0) then
					{
						if !((vehicle player) getvariable ['tb_fastropeready',false]) then 
						{
							_b=true;
						};
					};
				};
			};	
		};
	};	
	_b;
};

tb_fastropepilotdisallowcheck=
{
	private '_b';
	_b=false;
	if (vehicle player!=player) then
	{
		if ((driver vehicle player)==player) then
		{
			if ((vehicle player) iskindof 'Helicopter') then
			{
				if ((vehicle player) getvariable ['tb_fastropeready',false]) then 
				{
					_b=true;
				};
			};
		};
	};
	_b;
};

tb_FastropeEngage=
{
	private "_veh";
	_veh=(vehicle player);
	_veh setvariable ["tb_fastropeready",true,true];
	[[_veh,1],"tb_fastropedoor"] spawn BIS_fnc_MP;
	
};

tb_FastropeDisengage=
{
	private "_veh";
	_veh=(vehicle player);
	_veh setvariable ["tb_fastropeready",nil,true];
	[[_veh,0],"tb_fastropedoor"] spawn BIS_fnc_MP;
	
};

tb_fastrope=
{
	[player,"<t color=""#e9be40"">Rappel Down</t>",{_this spawn tb_fastropego;},[],100,false,false,"","[] call tb_fastropecargoallowropecheck"] call tb_AddAction;
	[player,"<t color=""#a3ff47"">Rappel Winch Down</t>",{[] spawn tb_FastropeEngage;},[],100,false,false,"","[] call tb_fastropepilotallowcheck"] call tb_AddAction;
	[player,"<t color=""#da1337"">Rappel Winch Up</t>",{[] spawn tb_FastropeDisengage;},[],100,false,false,"","[] call tb_fastropepilotdisallowcheck"] call tb_AddAction;
};
