// Exec: execVM

#include "\ice\tb_gamemode_aas\armaGameVer.sqh"
#include "\ice\ice_main\global.sqh"
#include "\ice\tb_gamemode_aas\globaldefines.sqh"
#include "\ice\TB_gameMode_SAD\common.sqh"

/*
zone%1 = zone radius marker
ICE_zoneTask_%1 = attack/defend markers + approx. cache location
zoneName%1 = zone flag/bunker icon + name, [DEBUG only] cache locations icon (red triangle) + label 
ICE_zoneObject_%1 = zone objects = TEs + destructible objectives // for TacBF v3.8
*/

private ["_name_stock","_flagTextures","_zoneMarker","_index","_flag","_list","_radius","_otherMarker","_markerPos","_markerSize","_pos1B","_pos2B","_synchList","_cname",
	"_stockNameUsed","_zoneDesc","_mask","_baseName","_zoneNameMarker","_location","_links","_tempName","_fromPos","_toPos","_fromSize","_toSize","_color",
	"_zoneTaskMarkersStart","_zoneTaskMarkersEnd","_i","_firstZoneObjectExists","_z","_zoneObject","_o","_zoneObjectMarkerPos","_isTunnelEntrance","_zoneObjectDesc",
	"_zoneObjectMarkerType","_zoneObjectMarkerDir","_zoneObjectMarkerSize","_zoneObjectMarkerAlpha","_currZoneSide","_zoneObjectMarkerColour","_zoneObjectMarker",
	"_zoneObjectLocText","_oldTEexists", "_oldTE"];

diag_log ["initMarkers.sqf", "start"];

// the name stock is drawn upon to name the numbered bases defined in
// the initSAAS.sqf script. 
// note1: we'll build the short name labels from the first letter of each name label
// note2: note that Xray is missing because this base name is special and exists once for each team. (Not anymore.)
array _name_stock = 
[
"Alpha" , "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", 
"India", "Juliet", "Kilo", "Lima", "Mike", "November", "Oscar", "Papa", "Quebec", 
"Romeo", "Sierra", "Tango", "Uniform", "Victor", "Whisky", "Xray-1", "Yankee", "Zulu",
"Ace" , "Baker", "Carmen", "Dog", "Edward", "Frank", "George", "Harry", 
"Igloo", "Johnny", "King", "London", "Monkey", "Nuts", "Orange", "Peter", "Queen", 
"Robert", "Sugar", "Tommy", "Uncle", "Vinegar", "William", "Xerxes", "Yellow", "Zebra"
];
#define TB_c_mainBaseName "Main Base"
#define TB_c_forwardBaseName "F.B."

// TODO: Rename flags to TB_flags!
flags = [ objNull ];	// dummy flag in position 0
TB_base_names = [ "dummy" ];
if (isNil "TB_zoneLocations") then {TB_zoneLocations = [locationNull];}; // else keep old array for rerun

{
	if (!isNil "ICE_debug_logNet_PV") then { if (ICE_debug_logNet_PV) then {
		//diag_log ["initMarkers.sqf", "TB_zoneList=", _x];
	};};
} forEach TB_zoneList;

waitUntil {!isNil "TB_zoneList"};
waitUntil {!isNil "TB_gameMode"};
waitUntil {!isNil "ICE_fnc_drawMapLineBetweenCircles"};

waitUntil {!isNil "ICE_teamFlag_bluFor"};
waitUntil {!isNil "ICE_teamFlag_opFor"};
waitUntil {!isNil "ICE_teamFlag_neutral"};
waitUntil {!isNil "ICE_teamName_bluFor"};
waitUntil {!isNil "ICE_teamName_opFor"};
waitUntil {!isNil "TB_blueXrayBaseID"};
waitUntil {!isNil "TB_redXrayBaseID"};
//------------------------ initialise markers ---------------------------------
_flagTextures = [ "dummy.jpg", ICE_teamFlag_opFor, ICE_teamFlag_bluFor, ICE_teamFlag_neutral ];

// loop through all bases performing the following actions
// 1. (conditionally centre all zone markers directly on flags), adjust color and brush
for "_index" from __TB_firstZoneIndex to __TB_lastZoneIndex do
{
	// Note: Watch dependency between _zoneMarker and flags.
	_zoneMarker = TB_c_zoneMarker(_index);

	// find zone flag obj
	private ['_flag', '_list', '_radius'];

	flags set [_index, objNull]; // assume no flag by default

	//call compile format ["if (!isNil 'flag%1') then {flags set [%1, flag%1]};", _index];
	_flag = (missionNamespace getVariable format ["flag%1", _index]);
	if (!isNil "_flag") then {flags set [_index, _flag];};

	_flag = flags select _index;

	if (isNull _flag) then
	{
		_radius = ((getMarkerSize _zoneMarker) select 0) max ((getMarkerSize _zoneMarker) select 1);
		_list = nearestObjects [getMarkerPos _zoneMarker, ["FlagCarrier"], _radius];
		if (count _list == 0) then
		{
			_list = nearestObjects [getMarkerPos _zoneMarker, ["FlagCarrier"], 1.5*_radius];
		};
		if (count _list > 0) then {_flag = _list select 0};

		if (isNull _flag) then
		{
			[format ["Error: missing flag for zone %1", _index], __FILE__, __LINE__] call ICE_fnc_logError;
		};

		flags set [_index, _flag];
	};

	//-----------------------------------
	// set flag texture
	if (!isNull _flag) then
	{
		// Note: setFlagTexture has global effect
		_flag setFlagTexture (_flagTextures select __TB_getZoneSide(_index));
	};

	//-----------------------------------
	// adjust zone marker
	// if only slightly off centre, then fix, otherwise assume it was deliberately offset away from centre.
	if (!isNull _flag && getMarkerPos _zoneMarker distance _flag < 10) then 
	{
		_zoneMarker setMarkerPosLocal (getPos _flag);
	};
	if (!isNull _flag) then
	{
		_markerPos = getMarkerPos _zoneMarker;
		_flag setPos _markerPos;
	};
	_zoneMarker setMarkerColorLocal (__TB_teamColors select __TB_getZoneSide(_index));

	// change spawn marker brush type
	_zoneMarker setMarkerBrushLocal "border";
	if (__TB_getSpawnType(_index) in TB_c_allForwardSpawnTypes) then
	{
		_zoneMarker setMarkerBrushLocal "BDiagonalBorder";
		_zoneMarker setMarkerAlphaLocal 0.5;
	};
	if (__TB_getSpawnType(_index) in [SPAWN_XRAY,SPAWN_LARGEFB]) then
	{
		_zoneMarker setMarkerBrushLocal "DottedBorder";
	};
	//-----------------------------------
	// make zone border thicker
	if (TB_gameMode != TB_gameMode_SAD) then
	{
		{
			_otherMarker = format ["%1_%2_thicker", _zoneMarker, _x];
			_markerPos = getMarkerPos _zoneMarker;
			if (ICE_c_fn_2DPosExists(_markerPos)) then
			{
				createMarkerLocal [_otherMarker, _markerPos];
				_otherMarker setMarkerPosLocal _markerPos; // set pos again, for existing markers

				_otherMarker setMarkerShapeLocal markerShape _zoneMarker; // copy other marker
				_otherMarker setMarkerBrushLocal markerBrush _zoneMarker; // copy other marker
				_otherMarker setMarkerSizeLocal [
					(getMarkerSize _zoneMarker select 0)+(_x*-0.4), 
					(getMarkerSize _zoneMarker select 1)+(_x*-0.4)]; // copy other marker
				_otherMarker setMarkerDirLocal markerDir _zoneMarker; // copy other marker
				_otherMarker setMarkerColorLocal getMarkerColor _zoneMarker; // copy other marker
			};
		} forEach [1, 2, 3, 4];
	};

	/*
	// multi-sector capture zone
	if (__ICE_debug_betaVersion && !isMultiplayer && !(__TB_getSpawnType(_index) in TB_c_anySpawnTypes)) then
	{
		// inner ellipse
		_otherMarker = format ["%1_inner", _zoneMarker];
		_markerPos = getMarkerPos _zoneMarker;
		createMarkerLocal [_otherMarker, _markerPos];
		_otherMarker setMarkerPosLocal _markerPos; // set pos again, for existing markers

		_otherMarker setMarkerShapeLocal markerShape _zoneMarker; // copy other marker
		_otherMarker setMarkerBrushLocal markerBrush _zoneMarker; // copy other marker
		_otherMarker setMarkerSizeLocal [(getMarkerSize _zoneMarker select 0)/2, (getMarkerSize _zoneMarker select 1)/2];
		_otherMarker setMarkerDirLocal markerDir _zoneMarker; // copy other marker
		_otherMarker setMarkerColorLocal getMarkerColor _zoneMarker; // copy other marker

		// quadrant lines
		{
			_otherMarker = format ["%1_line_%2", _zoneMarker, _x];
			_markerPos = getMarkerPos _zoneMarker;
			_markerSize = getMarkerSize _zoneMarker select 0;
			_pos1B = [_markerPos, _markerSize, (markerDir _zoneMarker)+_x] call ICE_fnc_relPos;
			_pos2B = [_markerPos, _markerSize/2, (markerDir _zoneMarker)+_x] call ICE_fnc_relPos;
			[
				_otherMarker, 
				_pos1B, 
				_pos2B, 
				getMarkerColor _zoneMarker,
				true,
				2
			] call ICE_fnc_drawMapLine;
		} forEach [0, 90, 180, 270];

	/ *
		// line 2
		_otherMarker = format ["%1_line2", _zoneMarker];
		_markerPos = getMarkerPos _zoneMarker;
		_markerSize = getMarkerSize _zoneMarker select 0;
		[
			_otherMarker, 
			[_markerPos, -_markerSize], 
			[_markerPos, -_markerSize/2], 
			getMarkerColor _zoneMarker
		] call ICE_fnc_drawMapLineBetweenCircles;

		// line 3
		_otherMarker = format ["%1_line3", _zoneMarker];
		_markerPos = getMarkerPos _zoneMarker;
		_markerSize = getMarkerSize _zoneMarker select 0;
		[
			_otherMarker, 
			[_markerPos, _markerSize], 
			[_markerPos, _markerSize/2], 
			getMarkerColor _zoneMarker
		] call ICE_fnc_drawMapLineBetweenCircles;

		// line 4
		_otherMarker = format ["%1_line4", _zoneMarker];
		_markerPos = getMarkerPos _zoneMarker;
		_markerSize = getMarkerSize _zoneMarker select 0;
		[
			_otherMarker, 
			[_markerPos, _markerSize], 
			[_markerPos, _markerSize/2], 
			getMarkerColor _zoneMarker
		] call ICE_fnc_drawMapLineBetweenCircles;
		* /
	};
	*/
};

//-----------------------------------------------------------------------------
// 2. build base name list
// 3. create flag markers
// 4. draw lines connecting base
array _synchList = [];  // list of bases which current base is synched with
int _cname = 0;   
array _pos = [];
string _zoneMarker = "";

for "_index" from __TB_firstZoneIndex to __TB_lastZoneIndex do
{
	_zoneMarker = TB_c_zoneMarker(_index);

	//-----------------------------------
	// determine zone description

	// Use format to substitute optional parts of name
	/* where:
		%1 = next stock name
		%2 = index (could be handy for debugging sometimes)
		%3 = standard main base name: TB_c_mainBaseName
		%4 = standard forward base name: TB_c_forwardBaseName
		Future: might add zone radius as param
		Future: might add nearest location or city name
	*/
	_stockNameUsed = false;
	_zoneDesc = "";
	_mask = "";

	// determine if optional mask or zone name is used.
	if (count BASE(_index) > __TB_ZA_ZONEDESC) then
	{		
		_mask = __TB_getZoneDesc(_index); // get format mask first
	}
	else
	{
		// check for and use optional marker text, if present
		if (markerText _zoneMarker != "") then
		{
			_mask = markerText _zoneMarker; // get format mask
		};
	};
	if (!isMultiplayer) then {_mask = _mask + " [#%2]"}; // debug in SP

	// substitute optional params using _mask
	if (_mask != "") then
	{
		_baseName = TB_c_mainBaseName;
		if (__TB_getSpawnType(_index) == SPAWN_XRAY) then
		{
			if (__TB_getZoneSide(_index) == TEAM_RED) then {_baseName = format ["%1 %2", ICE_teamName_opFor, TB_c_mainBaseName]};
			if (__TB_getZoneSide(_index) == TEAM_BLUE) then {_baseName = format ["%1 %2", ICE_teamName_bluFor, TB_c_mainBaseName]};
		};

		// if mask contains no optional params, then it is just treated as plain text.
		_zoneDesc = format [_mask, (_name_stock select _cname), _index, _baseName, TB_c_forwardBaseName]; 

		// determine if mask uses the stock name %1 param
		// substitute % into string for %1, then find if it was included or not.
		_stockNameUsed = (((toArray format [_mask, "%", "", "", ""]) find 37) >= 0); // 37 = '%' (% char is arbitrary)
	};

	// if no mask used, then use stock name
	if (_zoneDesc == "") then
	{
		_zoneDesc = (_name_stock select _cname);
		_stockNameUsed = true;
	};

	// mark stock name as used
	if (_stockNameUsed) then
	{
		_cname = _cname + 1;		
	};

	// build up the zone descriptions array
	TB_base_names set [count TB_base_names, _zoneDesc];
	//-----------------------------------
	if (__TB_getSpawnType(_index) == SPAWN_XRAY) then
	{
		// use first found "SPAWN_XRAY" zone as main base
		if (__TB_getZoneSide(_index) == TEAM_RED  && TB_redXrayBaseID  == 0) then { TB_redXrayBaseID  = _index; };
		if (__TB_getZoneSide(_index) == TEAM_BLUE && TB_blueXrayBaseID == 0) then { TB_blueXrayBaseID = _index; };		
	};

	// create a zone name marker for the zone
	_pos = if (isNull (flags select _index)) then
		{getMarkerPos _zoneMarker} else {getPos (flags select _index)};
	if (ICE_c_fn_2DPosIsZero(_pos)) then {_pos set [1, 20*_index]}; // debug: vertically space names at [0,0]

	_zoneNameMarker = __TB_zoneNameMarker(_index); // __TB_zoneNameMarker(X) (format ["zoneName%1",X]) = zone flag/name marker
	_markerPos = getMarkerPos _zoneNameMarker;
	if (ICE_c_fn_2DPosIsZero(_markerPos)) then // if marker is at [0,0] then it must not be a zone%1 marker
	{
		createMarkerLocal [_zoneNameMarker, _pos];
		if ( __TB_getSpawnType(_index) in TB_c_anySpawnTypes) then 
		{
			// Use bunker marker for spawnable zones
			// TB_c_anySpawnTypes [SPAWN_XRAY, SPAWN_QUEUE, SPAWN_TIMESLOT, SPAWN_ALWAYS, SPAWN_INSTANT, SPAWN_LARGEFB, SPAWN_CONTESTEDFB]
			_zoneNameMarker setMarkerTypeLocal
				#ifdef __ICE_armaGameVer2
					"city";
				#endif
				#ifdef __ICE_armaGameVer3
					"loc_Bunker";
				#endif
			_zoneNameMarker setMarkerSizeLocal [1.2, 1.2];
			_zoneNameMarker setMarkerColorLocal "ColorBlack";
		}
		else
		{
			diag_log ["aas\initMarkers.sqf", _index, (_mask == "" && (__TB_getSpawnType(_index) == SPAWN_NEVER)), _mask, __TB_getSpawnType(_index)];
			if (_mask == "" && (__TB_getSpawnType(_index) == SPAWN_NEVER)) then
			{
				_zoneNameMarker setMarkerTypeLocal "Empty"; // hidden zone.
			}
			else
			{
				_zoneNameMarker setMarkerTypeLocal "mil_flag"; // objective
			};
			_zoneNameMarker setMarkerSizeLocal [0.5, 0.5];
		};
		_zoneNameMarker setMarkerTextLocal ""; //(TB_base_names select _index); // Name is now shown via a scalable Location instead.
	};
	if (_index >= count TB_zoneLocations) then
	{
		//-----------------------------------
		// create location object for name
		
		_location = createLocation ["NameVillage", 
			_pos,
			0, //(getMarkerSize TB_c_zoneMarker(_index)) select 0, // Note: _pos is centred on flag, not zone centre.
			0 //(getMarkerSize TB_c_zoneMarker(_index)) select 1
		];
		TB_zoneLocations set [_index, _location];
		_location setText (" "+(TB_base_names select _index)); // leading space is to offset name to the right.
	};
	_zoneNameMarker setMarkerPosLocal _pos; // set pos again, for existing markers

	_location = TB_zoneLocations select _index;
	_location setPosition _pos; // set pos again, for existing locations
	_location setDirection (markerDir _zoneMarker);
	//-----------------------------------
	if (true) then //(TB_gameMode != TB_gameMode_SAD) then
	{
		_links = [];
		// create some links between bases to show control flow
		{
			// only create lines in one direction
			if (_links find format ["%1,%2", _index min _x, _index max _x] == -1) then // only create lines in one direction
			//if (_x > _index) then
			{
				_links set [count _links, format ["%2,%1", _index min _x, _index max _x]];
				_tempName = format ["ICE_zoneLink_%1_%2", _index min _x, _index max _x];
				_fromPos = getMarkerPos TB_c_zoneMarker(_index);
				_toPos = getMarkerPos TB_c_zoneMarker(_x);
				_fromPos set [2, 0]; // to get 2D distance
				_toPos set [2, 0];

				// draw to marker's border only, not centre.
				_fromSize = getMarkerSize TB_c_zoneMarker(_index);
				_toSize = getMarkerSize TB_c_zoneMarker(_x);

				_color = "ColorGrey25"; //"ColorYellow"; //"ColorKhaki"
				if (TB_gameMode == TB_gameMode_SAD) then {_color = "ColorGrey25"}; //"ColorYellow" //"ColorKhaki"
				[
					_tempName, 
					[_fromPos, _fromSize], 
					[_toPos, _toSize], 
					_color
				] call ICE_fnc_drawMapLineBetweenCircles;
			};
		} forEach __TB_getZoneLinksArray(_index);	
		
		//-----------------------------------
		// create some links to show synchronisation of dependent bases
		_links = [];
		{
			// only create synch links in one direction (we dont want two lines on top of one another)
			if (_links find format ["%1,%2", _index min _x, _index max _x] == -1) then // only create lines in one direction
			//if (_x > _index) then
			{
				_links set [count _links, format ["%2,%1", _index min _x, _index max _x]];
				_tempName = format ["ICE_zoneSync_%1_%2", _index min _x, _index max _x];
				_fromPos = getMarkerPos TB_c_zoneMarker(_index);
				_toPos = getMarkerPos TB_c_zoneMarker(_x);
				_fromPos set [2, 0];
				_toPos set [2, 0];

				// draw to marker's border only, not centre.
				_fromSize = getMarkerSize TB_c_zoneMarker(_index);
				_toSize = getMarkerSize TB_c_zoneMarker(_x);

				_color = "ColorRed"; //"ColorRed", "ColorOrange", "ColorPurple", "ColorGrey25"; //"ColorYellow"; //"ColorKhaki"
				if (TB_gameMode == TB_gameMode_SAD) then {_color = "ColorRed"}; //"ColorKhaki"
				[
					_tempName, 
					[_fromPos, _fromSize], 
					[_toPos, _toSize], 
					_color
				] call ICE_fnc_drawMapLineBetweenCircles;
			};
	
		} forEach __TB_getZoneSyncArray(_index);
	};
};
//-----------------------------------------------------------------------------
// create attack and defend markers
// See also: \tb_gamemode_sad\markers\init.sqf

_zoneTaskMarkersStart = 0;
// create empty markers to be converted to attack/defend markers for zones (contested FBs) starting at last cache if S&D gamemode
if (TB_gameMode == TB_gameMode_SAD) then {_zoneTaskMarkersStart = _c_maxCaches};
_zoneTaskMarkersEnd = (_zoneTaskMarkersStart + __TB_maxActiveTaskMarkers) - 1;

for "_i" from _zoneTaskMarkersStart to _zoneTaskMarkersEnd do
{
	_otherMarker = format ["ICE_zoneTask_%1", _i];
	createMarkerLocal [_otherMarker, [0,0,0]];

	_otherMarker setMarkerPosLocal [0,0,0]; // set pos again, for existing markers
	_otherMarker setMarkerAlphaLocal 0.8;
	_otherMarker setMarkerShapeLocal "ICON";
	_otherMarker setMarkerTypeLocal "empty";
	_otherMarker setMarkerSizeLocal [0.6, 0.6]; // N.B. Marker size will change with Interface Size changes in video settings.
	_otherMarker setMarkerColorLocal "ColorBlack";
};
//-----------------------------------------------------------------------------
// create markers for zoneObjects

for "_z" from __TB_firstZoneIndex to __TB_lastZoneIndex do
{
	_firstZoneObjectExists = false;
	_firstZoneObjectExists = (!isNull __TB_ZONEOBJECT(_z,1)); // therefore zone objects must be labelled in succession e.g. zone4Object1, zone4Object2, etc.
	
	// detect and use TEs from missions that have not been updated yet
	_oldTEexists = false;
	if (!_firstZoneObjectExists) then
	{
		if (!isNil (format ["zoneObject%1",_z])) then
		{
			_oldTE = call compile format ["zoneObject%1",_z]; // TE object name from missions not updated properly for TacBF v3.8
			if (!isNull _oldTE) then
			{
				_zoneObject = _oldTE; 
				_oldTEexists = true;
				_firstZoneObjectExists = true;
				diag_log (Format ["initMarkers.sqf: Inititalizing marker for old TE detected in zone%1.",_z]);
			};
		};
	};
	
	if (_firstZoneObjectExists) then
	{
		for "_o" from 1 to __TB_zoneObjectsLimit do
		{
			if (_oldTEexists) then 
			{
				_oldTEexists = false;
			}
			else
			{
				_zoneObject = __TB_ZONEOBJECT(_z,_o);
			};
			if (isNull _zoneObject) exitWith {};
			if (!alive _zoneObject) exitWith {diag_log (Format ["initMarkers.sqf: Error: zone%1Object%2 in zone% not alive! Aborting marker creation",_z,_o]);};
			
			_zoneObjectMarkerPos = getPos _zoneObject;
			
			// Detect if object is TE in S&D gamemode
			// TODO: use to prevent from searching for other zoneObjects to prevent screwing up spawn system
			_isTunnelEntrance = false;
			_isTunnelEntrance = 
			(
				(__TB_getSpawnType(_z) == SPAWN_INSTANT) && 
				(_zoneObject isKindOf "ICE_trapDoor_base")
			);

			// Determine correct icon for object

			/* from '\ice\tb_gamemode_aas\updateHUD.sqf'
			#define _c_markerIconName_none "empty"
			#define _c_markerIconName_attack "ICE_attack"
			#define _c_markerIconName_defend "ICE_defend"
			#define _c_markerColor_none "colorBlack"
			#define _c_markerColor_attack "colorOrange"
			#define _c_markerColor_defend "colorPurple"
			"mil_triangle" 0.6 x 0.6 used for caches in '\ice\tb_gamemode_sad\markers\create.sqf'
			*/
			
			//-----------------------------------------------------------------------------
			// defaults
			_zoneObjectDesc = "";
			_zoneObjectMarkerType = "mil_objective";
			_zoneObjectMarkerDir = 0; 
			_zoneObjectMarkerSize = [0.5, 0.5];
			_zoneObjectMarkerAlpha = 0.6;

			//-----------------------------------------------------------------------------
			// match zoneObject icon to zone colour at mission start
			_currZoneSide = __TB_getZoneSide(_z);
			_zoneObjectMarkerColour = switch (_currZoneSide) do
			{
				case TEAM_BLUE: {"ColorBlue"};
				case TEAM_RED: {"ColorRed"};
				case TEAM_NEUTRAL: {"ColorGreen"};
				default {"ColorPurple"};
			};
			// _zoneObjectMarkerColour = "ColorPurple"; // Use purple for zoneObjects regardless of zone ownership for easier recognition?
			
			//-----------------------------------------------------------------------------
			// icons an descriptions for commonly used zoneObject e.g. "Transformer", "Comms Tower" 
			// match to '\ice\ice_main\Mission\Zones\zoneObjectDestroyed.sqf'
			
			// _zoneObjectMarkerType = "o_unknown"; // light red centre with black outline
			// _zoneObjectMarkerType = "mil_objective"; // circle with cross in centre (matches 'Spot > Objective' in-game)
			// _zoneObjectMarkerType = "mil_box"; 
			
			_zoneObjectDesc = [typeOf _zoneObject, true] call ICE_fnc_getDisplayName; // true = displayNameShort c.f. displayName
			
			if (_isTunnelEntrance) then // use to hide TE marker for later 'randomized TEs' development
			{
				// red diamond
				_zoneObjectDesc = "TE";
				_zoneObjectMarkerType = "mil_box";
				_zoneObjectMarkerDir = 45; // square into diamond
				_zoneObjectMarkerSize = [0.8, 0.8];
				_zoneObjectMarkerAlpha = 0.4;
			};
		
			//-----------------------------------------------------------------------------
			// marker for zoneObject
			_zoneObjectMarker = format ["ICE_zone%1Object%2_Marker", _z, _o]; 
			createMarkerLocal [_zoneObjectMarker , [0,0,0]];
			
			if (!isMultiplayer) then 
			{
				_MRdebug02 = diag_log (format ["initMarkers.sqf: zoneObject:%1, color:%2, side:%3",_zoneObject, _zoneObjectMarkerColour, _currZoneSide]);
			};
			
			_zoneObjectMarker setMarkerPosLocal _zoneObjectMarkerPos;
			_zoneObjectMarker setMarkerShapeLocal "ICON";
			
			_zoneObjectMarker setMarkerTypeLocal _zoneObjectMarkerType;
			_zoneObjectMarker setMarkerSizeLocal _zoneObjectMarkerSize;
			_zoneObjectMarker setMarkerColorLocal _zoneObjectMarkerColour;
			_zoneObjectMarker setMarkerAlphaLocal _zoneObjectMarkerAlpha;
			_zoneObjectMarker setMarkerDirLocal _zoneObjectMarkerDir;
			
			// _zoneObjectMarker setMarkerTextLocal _zoneObjectDesc;
			
			//-----------------------------------------------------------------------------
			// text for description of zoneObject
			// locations = small non-scaling text
			_zoneObjectLocText = createLocation ["ICE_size_014", _zoneObjectMarkerPos, 0, 0]; // "ICE_size_014" = smaller text than "Name"
			_zoneObjectLocText setText (format ["   %1", _zoneObjectDesc]); // 3 x leading spaces to offset text to the right of icon
			// _zoneObjectLocText setName "";
			missionNamespace setVariable [format ["ICE_zone%1Object%2_Text",_z, _o],_zoneObjectLocText]; // location text global variable for killedEH deletion
		
			// '\ice\ice_main\Mission\Zones\zoneObjectDestroyed.sqf': if destroyed during game, killedEH = marker change to X + deleteLocation
		};
	};
};
//-----------------------------------------------------------------------------
// hide all/some markers by default

// hide link/sync lines by default for S&D gamemode
if (TB_gameMode == TB_gameMode_SAD) then 
{
	[['links' ,'sync'], false] execVM '\ice\tb_gamemode_aas\showMarkers.sqf'
}
else
{
	[['links' ,'sync'], true] execVM '\ice\tb_gamemode_aas\showMarkers.sqf'
};
[['zones'], true] execVM '\ice\tb_gamemode_aas\showMarkers.sqf';
