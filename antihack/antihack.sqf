/* ******************************************************* */
/*             Created for the Epoch Community             */
/*                By BigEgg and Movinggun                  */
/* ******************************************************* */

#include "config.sqf"

local _cashvar = if (Z_persistentMoney) then {"globalMoney"} else {"cashMoney"};
local _bankvar = "bankMoney"; //---Be sure to change if you customize this value

diag_log (_diag_prefix + "Initializing Epoch Antihack/Admin Tools");

//---Adds chat commands based on config
if (_discord != "") then {_chatcmds set [count _chatcmds, "discord"]};
if (_teamspeak != "") then {_chatcmds set [count _chatcmds, "teamspeak"]};
if (_website != "") then {_chatcmds set [count _chatcmds, "website"]};

diag_log (_diag_prefix + "Config loaded successfully");

//---Antihack global ban system
if (_egb) then {"Antihack" callExtension "Init"; diag_log (_diag_prefix + "Global ban sync initiated")};

/* ********************* Sort Staff ********************** */

//---Moderators = 0 | Admins = 1 | Head Admins = 2 | Owners = 3
//---Names + UIDs = 4 | Hidden = 5 | No logs = 6 | Execute = 7 | Test account = 8

local _sorted = [[],[],[],[],[],[],[],[],[]];
{
	local _sel = _sorted select _forEachIndex;
	{
		local _name = _x select 0;
		local _puid = _x select 1;
		local _hide = _x select 2;
		local _logs = _x select 3;
		local _exec = _x select 4;
		local _noad = _x select 5;

		if (typeName _name != "ARRAY") then {_name = [_name]};
		if (_noad != "") then {(_sorted select 8) set [count (_sorted select 8), _noad + _puid]};

		{
			_sel set [count _sel, _x + _puid];
			(_sorted select 4) set [count (_sorted select 4), _x + _puid];
			if (_hide) then {
				(_sorted select 5) set [count (_sorted select 5), _x + _puid];
			};
			if (_logs) then {
				(_sorted select 6) set [count (_sorted select 6), _x + _puid];
			};
			if (_exec) then {
				(_sorted select 7) set [count (_sorted select 7), _x + _puid];
			};
		} forEach _name;
	} forEach _x;
} forEach [_mod, _admin, _headAdmin, _owner];
diag_log (_diag_prefix + "Admins sorted successfully");

/* ******************* Random Variables ****************** */

local _fnc_random = { //---Generates random variable
	local _ret = [];

	local _arr = toArray "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; //---Add letters to the beginning
	{_ret set [_x, _arr select (random((count _arr)-1))]} count [0,1];

	_arr = toArray "1234567890aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ1234567890";
	for "_x" from 1 to (7 + random 10) do {
		_ret set [count _ret, _arr select (random((count _arr)-1))];
	};

	_ret = toString _ret;
	diag_log format["%1%2: %3", _diag_prefix, _this, _ret];

	_ret
};

local _kfc_sz = "_kfc_sz" call _fnc_random;
local _kfc_re = "_kfc_re" call _fnc_random;
local _kfc_sz1 = "_kfc_sz1" call _fnc_random;
local _kfc_sz2 = "_kfc_sz2" call _fnc_random;
local _kfc_sz3 = "_kfc_sz3" call _fnc_random;
local _kfc_mic = "_kfc_mic" call _fnc_random;
local _kfc_msg = "_kfc_msg" call _fnc_random;
local _kfc_get = "AHPV_Get" + ("_kfc_get" call _fnc_random);
local _kfc_got = "_kfc_got" call _fnc_random;
local _kfc_ban = "_kfc_ban" call _fnc_random;
local _kfc_oef = "_kfc_oef" call _fnc_random;
local _kfc_pvs = "_kfc_pvs" call _fnc_random;
local _kfc_msg1 = "_kfc_msg1" call _fnc_random;
local _kfc_gvar = "_kfc_gvar" call _fnc_random;
local _kfc_init = "_kfc_init" call _fnc_random;
local _kfc_gtrd = "_kfc_gtrd" call _fnc_random;
local _kfc_atrd = "_kfc_atrd" call _fnc_random;
local _kfc_ntrd = "_kfc_ntrd" call _fnc_random;
local _kfc_akey = "_kfc_akey" call _fnc_random;
local _kfc_strd = "_kfc_strd" call _fnc_random;
local _kfc_info = "_kfc_info" call _fnc_random;
local _kfc_pveh = "_kfc_pveh" call _fnc_random;
local _kfc_keys = "_kfc_keys" call _fnc_random;
local _kfc_gclnt = "_kfc_gclnt" call _fnc_random;
local _kfc_sclnt = "_kfc_sclnt" call _fnc_random;
local _kfc_nclnt = "_kfc_nclnt" call _fnc_random;
local _kfc_rekey = "_kfc_rekey" call _fnc_random;
local _kfc_atrd_cfg = "_kfc_atrd_cfg" call _fnc_random;
local _kfc_strd_cfg = "_kfc_strd_cfg" call _fnc_random;

/* ********** Global Code (sent to all clients) ********** */

local _AH_Global = ("
	local _queue = [];

	"+_kfc_keys+"_fnc = {
		local _key = _this select 1;

		local _run = "+_kfc_keys+" select _key;
		if (!isNil '_run') then {call _run};

		_this call DZ_KeyDown_EH
	};

	"+_kfc_gvar+" = {
		local _exp = _this select 2;
		local _val = (_this select 0) getVariable [_this select 1, _exp];

		if (typeName _val != typeName _exp) exitWith {_exp};

		_val
	};

	"+_kfc_msg+" = {
		local _msg = _this select 0;
		local _opt = _this select 1;

		if (_opt == 1) exitWith {diag_log format['"+_diag_prefix+"%1', _msg]};
		if (_opt == 2) exitWith {systemChat format['"+_chat_prefix+"%1', _msg]};
		if (_opt == 3) exitWith {_msg call dayz_rollingMessages};
		if (_opt == 4) exitWith {
			systemChat format['"+_chat_prefix+"%1', _msg];
			_msg call dayz_rollingMessages;
		};
		if (_opt == 5) exitWith {
			diag_log format['"+_diag_prefix+"%1', _msg];
			systemChat format['"+_chat_prefix+"%1', _msg];
		};

		[format['Message Function: Undefined option received: %1', _opt], 1] call "+_kfc_msg+";
	};

	'"+_kfc_msg1+"' addPublicVariableEventHandler {"+_kfc_msg1+" = nil; [toString(_this select 1), 2] call "+_kfc_msg+"};

	"+_kfc_pvs+" = {
		local _fnc = toUpper (_this select 0);
		local _prm = _this select 1;

		call {
			if (_fnc == 'LOG') exitWith {_prm set [0, toArray (_prm select 0)]};
			if (_fnc == 'BAN') exitWith {
				if (isNil '"+_kfc_ban+"IP') then {"+_kfc_ban+"IP = false};
				_prm = toArray _prm;
				if (count _prm > 1915) then {_prm resize 1915};
				_prm = ["+_kfc_info+" select 0, "+_kfc_info+" select 1, _prm];
			};
		};
		if (_fnc == 'BAN' && {"+_kfc_ban+"IP}) exitWith {};

		AHPV_"+_kfc_pveh+" = [toArray _fnc, _prm, player];
		publicVariableServer 'AHPV_"+_kfc_pveh+"'; AHPV_"+_kfc_pveh+" = nil;
		if (_fnc == 'BAN') then {"+_kfc_ban+"IP = true};
	};

	AH_fnc_toChat = {
		disableSerialization;
		(findDisplay 46) createDisplay 'RscDisplayChat';
		local _ctrl = (findDisplay 24) displayCtrl 101;
		_ctrl ctrlSetText _this;
	};

	_queue set [count _queue, [{
		local _display = findDisplay 49;

		if (isNull _display) exitWith {};
		if (ctrlText (_display displayCtrl 523) == "+str _escTopT+") exitWith {};

		(_display displayCtrl 523) ctrlSetText "+str _escTopT+";
		(_display displayCtrl 523) ctrlSetTextColor "+str _escTopC+";

		(_display displayCtrl 103) ctrlSetText 'PlayerUID (SteamID):';
		(_display displayCtrl 103) ctrlEnable false;

		(_display displayCtrl 119) ctrlSetText format['%1', getPlayerUID player];
		(_display displayCtrl 119) ctrlEnable false;

		(_display displayCtrl 1010) ctrlSetText "+str _escMidT+";
		(_display displayCtrl 1010) ctrlEnable false;

		(_display displayCtrl 121) ctrlSetText "+str _escLUPT+";
		(_display displayCtrl 121) ctrlSetTextColor "+str _escLUPC+";

		(_display displayCtrl 120) ctrlSetText "+str _escLBOT+";
		(_display displayCtrl 120) ctrlSetTextColor "+str _escLBOC+";
	}, 0.1, 0]];
");
//---Debug Monitor
if (_debug) then {_AH_Global = _AH_Global + ("
	_queue set [count _queue, [{
		if (isNil 'BIS_fnc_numberText') exitWith {};
		if (isNil 'AH_debugMonitor') then {AH_debugMonitor = true;};
		if (!AH_debugMonitor) exitWith {};

		local _time = round("+str _drestart+" - serverTime / 60);
		local _hours = floor(_time / 60);
		local _minutes = _time - (_hours * 60);

		if (_minutes < 10) then {
			_minutes = '0' + str _minutes;
		};

		local _humanity = [player, 'humanity', 0] call "+_kfc_gvar+";
		_humanity = call {
			if (_humanity >= 5000) exitWith {'#008CED'};
			if (_humanity <= -5000) exitWith {'#FF0000'};
			'#FFFFFF'
		};

		local _pic = if (vehicle player == player) then {getText(configFile >> 'CfgWeapons' >> currentWeapon player >> 'picture')} else {getText(configFile >> 'CfgVehicles' >> typeOf (vehicle player) >> 'picture')};

		local _txt = format[""<t size='1.3' font='Bitstream' align='center'>%1</t><br/>"", name player];
		_txt = _txt + format[""<img size='3.5' image='%1'/><br/>"", _pic];
		_txt = _txt + format[""<t size='1' font='Bitstream' align='left'>Players Online: </t><t size='1' font='Bitstream' align='right'>%1</t><br/>"", count playableUnits];
		_txt = _txt + format[""<t size='1' font='Bitstream' align='left'>Headshots: </t><t size='1' font='Bitstream' align='right'>%1</t><br/>"", [player, 'headShots', 0] call "+_kfc_gvar+"];
		_txt = _txt + format[""<t size='1' font='Bitstream' align='left'>Bandits Killed: </t><t size='1' font='Bitstream' align='right'>%1</t><br/>"", [player, 'banditKills', 0] call "+_kfc_gvar+"];
		_txt = _txt + format[""<t size='1' font='Bitstream' align='left'>Friendlies Killed: </t><t size='1' font='Bitstream' align='right'>%1</t><br/>"", [player, 'humanKills', 0] call "+_kfc_gvar+"];
		_txt = _txt + format[""<t size='1' font='Bitstream' align='left'>Zombies Killed: </t><t size='1' font='Bitstream' align='right'>%1</t><br/><br/>"", [player, 'zombieKills', 0] call "+_kfc_gvar+"];
		_txt = _txt + format[""<t size='1' font='Bitstream' align='left' color='#FF0000'>Blood: </t><t size='1' font='Bitstream' align='right' color='#FF0000'>%1</t><br/>"", [r_player_blood] call BIS_fnc_numberText];
		_txt = _txt + format[""<t size='1' font='Bitstream' align='left' color='%1'>Humanity: </t><t size='1' font='Bitstream' align='right' color='%1'>%2</t><br/><br/>"", _humanity, [[player, 'humanity', 0] call "+_kfc_gvar+"] call BIS_fnc_numberText];
		_txt = _txt + format[""<t size='1' font='Bitstream' align='left'>FPS: </t><t size='1' font='Bitstream' align='right'>%1</t><br/>"", round diag_fps];
		_txt = _txt + format[""<t size='1' font='Bitstream' align='left'>Map Grid: </t><t size='1' font='Bitstream' align='right'>%1</t><br/>"", mapGridPosition (vehicle player)];
		_txt = _txt + format[""<t size='1' font='Bitstream' align='left'>Restart in: </t><t size='1' font='Bitstream' align='right'>%1hr(s) %2min(s)</t><br/>"", _hours, _minutes];
		_txt = _txt + ""<t size='1' font='Bitstream' align='center'>"+_dtext+"</t>"";

		hintSilent parseText _txt;
	}, 1, 0]];
");};
//---Safe Zones
if (_safezones) then {_AH_Global = _AH_Global + ("
	local _szqueue = [];
	"+_kfc_sz1+" = {
		isInTraderCity = true; canbuild = false; sz_time = diag_tickTime;
		if (isNil 'fnc_veh_handleDam2') then {
			fnc_veh_handleDam2 = fnc_veh_handleDam;
			fnc_veh_handleDam = {
				if ({(_this select 0) distance (_x select 0) <= (_x select 1)} count DZE_SafeZonePosArray > 0 || {(_this select 0) getVariable ['"+_kfc_sz+"', false]}) exitWith {0};
				_this call fnc_veh_handleDam2;
			};
		};
		if (!DZE_BackpackAntiTheft) then {DZE_BackpackAntiTheft = true};

		local _msg = 'You entered a safe zone!';
		taskHint [_msg, [0,1,0,1], 'taskDone']; [_msg, 2] call "+_kfc_msg+";

		['LOG', [format['Entered the safe zone @ %1', mapGridPosition player], 4]] call "+_kfc_pvs+";
		if ([player, 'inCombat', false] call "+_kfc_gvar+") then {
			['LOG', [format['In combat when entering the safe zone @ %1', mapGridPosition player], 4]] call "+_kfc_pvs+";
			sz_combatcnt = sz_combatcnt + 1;
			if (sz_combatcnt >= 3) then {
				['LOG', [format['Abusing the safe zone @ %1. Times entered while in combat: %2', mapGridPosition player, sz_combatcnt], 4]] call "+_kfc_pvs+";
			};
		};");
		if (_antitheft) then {_AH_Global = _AH_Global + ("
			local _veh = vehicle player;

			if (_veh != player && {driver _veh == player}) then {
				local _owner = [];
				_owner set [0, getPlayerUID player];
				{
					if !(getPlayerUID _x in _owner) then {
						_owner set [count _owner, getPlayerUID _x];
					};
				} count (crew _veh);
				_veh setVariable ['Owner', _owner, true];
				['You have been set as the owner of this vehicle.', 4] call "+_kfc_msg+";
			};

			if (isNil 'fn_gearMenuChecks1') then {fn_gearMenuChecks1 = fn_gearMenuChecks};
			fn_gearMenuChecks = {
				if (vehicle player == player) then {
					disableSerialization;

					local _display = _this select 0;
					local _ct = cursorTarget;
					local _dis = if (_ct isKindOf 'USEC_ch53_E' || {_ct isKindOf 'MV22'}) then {25} else {12};

					if ((player distance _ct <= _dis) && {_ct isKindOf 'Air' || {_ct isKindOf 'LandVehicle'} || {_ct isKindOf 'Ship'}}) then {
						local _owner = [_ct, 'Owner', []] call "+_kfc_gvar+";

						local _deny = true;
						{
							if (getPlayerUID _x == (_owner select 0)) exitWith {_deny = false;};
						} count (units group player);

						if (getPlayerUID player in _owner) then {_deny = false};

						if (_deny) then {
							_display closeDisplay 2;
							['You cannot open the gear of a vehicle that does not belong to you!', 2] call "+_kfc_msg+";
						};
					};
				};
				_this call fn_gearMenuChecks1;
			};
		")};
		_AH_Global = _AH_Global + ("
			if (isNil 'fnc_usec_damageHandler1') then {fnc_usec_damageHandler1 = fnc_usec_damageHandler};
			fnc_usec_damageHandler = {0};

			if (isNil 'player_zombieCheck1') then {player_zombieCheck1 = player_zombieCheck};
			player_zombieCheck = {false};

			if (isNil 'player_fired1') then {player_fired1 = player_fired};
			player_fired = {
				deleteVehicle (_this select 6);
				cutText ['You cannot fire your weapon in a safe zone!', 'WHITE IN'];
			};

			"+_kfc_sz3+" = true;
		");
		_AH_Global = _AH_Global + ("
	};
	"+_kfc_sz2+" = {
		"+_kfc_sz3+" = false; isInTraderCity = false; canbuild = true;
		local _msg = 'You left the safe zone!';
		taskHint [_msg, [1,0,0,1], 'taskFailed']; [_msg, 2] call "+_kfc_msg+";

		local _time = diag_tickTime - sz_time;
		['LOG', [format['Left the safe zone @ %1 after %2 minute(s)', mapGridPosition player, round(_time/60)], 4]] call "+_kfc_pvs+";

		local _veh = vehicle player;"); if (_timer > 0) then {_AH_Global = _AH_Global + ("
			if (_time >= 60) then {
				if (_veh != player) then {
					[_veh, "+str _timer+"] spawn {
						(_this select 0) setVariable ['"+_kfc_sz+"', true, true];
						uiSleep (_this select 1);
						(_this select 0) setVariable ['"+_kfc_sz+"', false, true];
					};
				};
				for '_x' from "+str _timer+" to 1 step -1 do
				{
					[[format['Protection ending in %1 second(s)!', _x], 1], 3] call "+_kfc_msg+";
					uiSleep 1;
					if ({_veh distance (_x select 0) <= (_x select 1)} count DZE_SafeZonePosArray > 0) exitWith {};
				};
			} else {
				[format['You were only in the safe zone for %1 second(s).', round _time], 4] call "+_kfc_msg+";
			};
		")}; _AH_Global = _AH_Global + ("
		['Protection disabled!', 4] call "+_kfc_msg+";
		fnc_usec_damageHandler = fnc_usec_damageHandler1;
		player_zombieCheck = player_zombieCheck1;
		player_fired = player_fired1;
		if ("+str _antitheft+") then {fn_gearMenuChecks = fn_gearMenuChecks1};
		if (_veh != player) then {
			_veh setVariable ['safezoneEH', false];
			_veh removeAllEventHandlers 'Fired';
		};
	};
	sz_combatcnt = 0; _szqueue set [count _szqueue, [{if (sz_combatcnt > 0) then {sz_combatcnt = sz_combatcnt - 1}}, 120, 0]];
	_szqueue set [count _szqueue, [{
		local _veh = vehicle player;
		if (isNil '"+_kfc_sz3+"') then {"+_kfc_sz3+" = false};
		if (!"+_kfc_sz3+") then {
			if ({_veh distance (_x select 0) <= (_x select 1)} count DZE_SafeZonePosArray > 0) then {call "+_kfc_sz1+"};
		} else {
			if !({_veh distance (_x select 0) <= (_x select 1)} count DZE_SafeZonePosArray > 0) then {call "+_kfc_sz2+"};
		};
	}, 0.53, 0]];
	_szqueue set [count _szqueue, [{
		if (!"+_kfc_sz3+") exitWith {};
		{player setVariable [_x, false, false]} count ['NORRN_unconscious', 'USEC_isCardiac'];
		r_player_unconscious = false; r_player_cardiac = false;");
		if (_disableWeps) then {_AH_Global = _AH_Global + ("
			local _wep = currentWeapon player;
			if (_wep in "+str _dropWeps+") then {
				player action ['dropWeapon', player, _wep];
			};
		")};
		_AH_Global = _AH_Global + ("
			local _veh = vehicle player;
			if (_veh != player) then {");
				if (_speedlimit > 0) then {_AH_Global = _AH_Global + ("
					if !(_veh isKindOf 'Air') then {
						local _speed = abs(speed _veh);
						if (_speed > "+str _speedlimit+") then {
							local _vel = velocity _veh;
							local _mod = if (_speed > 50) then {0.1} else {0.8};
							_veh setVelocity [(_vel select 0) * _mod, (_vel select 1) * _mod, (_vel select 2) * _mod];
						};
					};
				")};
				if (_antitheft) then {_AH_Global = _AH_Global + ("
					local _owner = [_veh, 'Owner', []] call "+_kfc_gvar+";

					if (driver _veh == player && {count _owner == 0}) then {
						_owner set [0, getPlayerUID player];
						_veh setVariable ['Owner', _owner, true];
						['You have been set as the owner of this vehicle.', 4] call "+_kfc_msg+";
					};

					if (count _owner > 0) then {
						local _deny = true;
						{
							if (getPlayerUID _x == (_owner select 0)) exitWith {_deny = false};
						} count (units group player);
						if (getPlayerUID player in _owner) then {_deny = false;};
						if (_deny) then {player action ['Eject', _veh]};
					};
				")};
				_AH_Global = _AH_Global + ("
					if !([_veh, 'safezoneEH', false] call "+_kfc_gvar+") then {
						_veh setVariable ['safezoneEH', true];
						_veh addEventHandler ['Fired', {_this call player_fired}];
					};
				");
		_AH_Global = _AH_Global + ("};
	}, 0.1, 0]];
	comment 'Safe zones get their own thread because of the uiSleep needed for the exit timer';
	_szqueue spawn {
		waitUntil {!isNil 'Dayz_loginCompleted'};
		while {69 == 69} do
		{
			{
				if (diag_tickTime - (_x select 1) >= (_x select 2)) then {
					call (_x select 0); _x set [2, diag_tickTime];
				};
			} count _this;
			uiSleep 0.1;
		};
	};
");};
//---Client RE
_AH_Global = _AH_Global + ("
	'"+_kfc_rekey+"' addPublicVariableEventHandler {
		"+_kfc_rekey+" = nil;

		local _in = _this select 1;

		local _sender = _in select 0;
		local _param = _in select 1;
		local _id = toString(_in select 2);

		local _info = name _sender + ' ' + '(' + getPlayerUID _sender + ')';

		comment 'We authenticate the request by sending the client key from the server to the respective client. Since only the server and client have this, if it matches, it is a legitimate request.';
		if (dayz_authKey != toString(_in select 3)) exitWith {
			['LOG', ['Incorrect client key received by RE! Possible hacker online!', 3]] call "+_kfc_pvs+";
		};

		if (getPlayerUID player in "+str _headless+") exitWith {}; comment 'Admins should not be manipulating headless clients';

		if (_id == 'TAR_TP2U') exitWith {
			local _veh = vehicle player;

			_veh setPosATL (_param select 1);
			_veh setDir (_param select 2);

			{player reveal _x} count (player nearEntities ['All', 50]);

			[format['You were teleported to %1 by admin ""%2.""', mapGridPosition player, _info], 4] call "+_kfc_msg+";
		};
		if (_id == 'TAR_HEAL') exitWith {
			[player, _sender] call player_medMorphine;
			[player, _sender] call player_medBandage;
			[player, _sender] call player_medPainkiller;
			[player, _sender] call player_medAntiBiotics;

			r_player_blood = 12000;
			player setVariable ['USEC_BloodQty', r_player_blood, true];

			r_player_lowblood = false;
			player setVariable ['USEC_lowBlood', false, true];

			player setVariable ['NORRN_unconscious', false, false];
			r_player_unconscious = false;

			player setVariable ['USEC_isCardiac', false, false];
			r_player_cardiac = false;

			dayz_hunger = 0;
			dayz_thirst = 0;
			dayz_temperatur = 36;

			call player_forceSave;
			[format['You were healed by admin ""%1.""', _info], 4] call "+_kfc_msg+";
		};
		if (_id == 'MAG_GIVE') exitWith {
			for '_x' from 1 to (_param select 1) do {player addMagazine (_param select 2)};
			call player_forceSave;
			[format['You were given %1 ""%2"" by admin ""%3.""', _param select 1, _param select 2, _info], 4] call "+_kfc_msg+";
		};
		if (_id == 'WEP_GIVE') exitWith {
			player addWeapon (_param select 1);
			player selectWeapon (_param select 1);

			if ((_param select 2) != 'none' && {_param select 3}) then {
				for '_x' from 1 to 4 do {
					player addMagazine (_param select 2);
				};
				[format['You were given one ""%1"" with ammo by admin ""%2.""', _param select 1, _info], 4] call "+_kfc_msg+";
			} else {
				[format['You were given one ""%1"" by admin ""%2.""', _param select 1, _info], 4] call "+_kfc_msg+";
			};
			call player_forceSave;
		};
		if (_id == 'BP_GIVE') exitWith {
			player addBackpack (_param select 1);
			call player_forceSave;
			[format['You were given backpack ""%1"" by admin ""%2.""', _param select 1, _info], 4] call "+_kfc_msg+";
		};
		if (_id == 'TAR_BANK') exitWith {
			player setVariable ["+str _bankvar+", (player getVariable ["+str _bankvar+", 0]) + (_param select 1), true];
			call player_forceSave;
			[format['%1 %2 were added to your bank by admin ""%3.""', [_param select 1] call BIS_fnc_numberText, CurrencyName, _info], 4] call "+_kfc_msg+";
		};
		if (_id == 'TAR_WALLET') exitWith {
			player setVariable ["+str _cashvar+", (player getVariable ["+str _cashvar+", 0]) + (_param select 1), true];
			call player_forceSave;
			[format['%1 %2 were added to your wallet by admin ""%3.""', [_param select 1] call BIS_fnc_numberText, CurrencyName, _info], 4] call "+_kfc_msg+";
		};
		if (_id == 'TAR_HUMANITY') exitWith {
			player setVariable ['humanity', (player getVariable ['humanity', 0]) + (_param select 1), true];
			call player_forceSave;
			[format['You were given %1 humanity by admin ""%2.""', [_param select 1] call BIS_fnc_numberText, _info], 4] call "+_kfc_msg+";
		};
		if (_id == 'TAR_AMMO') exitWith {
			local _mags = getArray(configFile >> 'CfgWeapons' >> currentWeapon(vehicle player) >> 'magazines');
			if (count _mags > 0) then {
				for '_x' from 1 to (_param select 1) do {
					(vehicle player) addMagazine (_mags select 0);
				};
			};
			[format['You were given %1 mags of ammunition for your current weapon by admin ""%2.""', _param select 1, _info], 4] call "+_kfc_msg+";
		};
		if (_id == 'TAR_MOVINVEH') exitWith {
			player moveInCargo (vehicle _sender);
			[format['You were moved into the vehicle of admin ""%1.""', _info], 4] call "+_kfc_msg+";
		};
		if (_id == 'TAR_REPAIR') exitWith {
			local _veh = vehicle player;
			local _hit = _veh call vehicle_getHitpoints;

			{
				local _dam = ([_veh, _x] call object_getHit) select 0;

				if (_dam > 0) then {
					local _sel = getText(configFile >> 'CfgVehicles' >> typeOf _veh >> 'HitPoints' >> _x >> 'name');
					local _var = 'hit_' + _sel;
					_veh setHit [_sel, 0];
					_veh setVariable [_var, 0, true];
				};
			} count _hit;

			_veh setDamage 0;
			_veh setFuel 1;

			PVDZ_veh_Save = [_veh, 'repair'];
			publicVariableServer 'PVDZ_veh_Save';

			[format['Your vehicle was repaired by admin ""%1.""', _info], 4] call "+_kfc_msg+";
		};
		if (_id == 'TAR_FREEZE') exitWith {
			if ((_param select 1) == 0) then {disableUserInput false} else {disableUserInput true};
			[format['You were %1 by admin ""%2.""', if ((_param select 1) == 0) then {'unfrozen'} else {'frozen'}, _info], 4] call "+_kfc_msg+";
		};
		if (_id == 'TAR_SUICIDE') exitWith {
			[player, 'suicide'] call player_death;
		};
		if (_id == 'TAR_DISCONNECT') exitWith {
			call player_forceSave; endMission 'END1';
		};
		if (_id == 'TAR_RMGEAR') exitWith {
			removeAllWeapons player;
			removeAllItems player;
			removeBackpack player;
			call player_forceSave;
			[format['Your gear was removed by admin ""%1.""', _info], 4] call "+_kfc_msg+";
		};
		if (_id == 'TAR_SENDUP') exitWith {
			local _pos = [vehicle player] call FNC_getPos;
			(vehicle player) setPos [_pos select 0, _pos select 1, (_pos select 2) + (_param select 1)];
			[format['You were sent %1 meters into the air by admin ""%2.""', [_param select 1] call BIS_fnc_numberText, _info], 4] call "+_kfc_msg+";
		};
		if (_id == 'TAR_SENDOCEAN') exitWith {
			player setPos [0,0,0];
			[format['You were sent to the ocean by admin ""%1.""', _info], 4] call "+_kfc_msg+";
		};
		if (_id == 'TAR_EJECT') exitWith {
			player action ['Eject', vehicle player];
			[format['You were ejected from your vehicle by admin ""%1.""', _info], 4] call "+_kfc_msg+";
		};
		if (_id == 'TAR_LOADOUT') exitWith {
			removeAllWeapons player; removeAllItems player; removeBackpack player;
			local _loadout = "+str _loadouts+" select (_param select 1);
			if (count(_loadout select 1) > 0) then {
				{player addWeapon _x} count (_loadout select 1);
			};
			if (count(_loadout select 2) > 0) then {
				{
					if (typeName _x == 'ARRAY') then {for '_i' from 1 to (_x select 1) do {player addMagazine (_x select 0)}} else {player addMagazine _x};
				} count (_loadout select 2);
			};
			if ((_loadout select 3) != '') then {player addBackpack (_loadout select 3)};
			player selectWeapon ((_loadout select 1) select 0);
			[format['You were given the %1 loadout by admin ""%2.""', _loadout select 0, _info], 4] call "+_kfc_msg+";
			call player_forceSave;
		};
		if (_id == 'MENU_ADJUST') exitWith {
			if ((_param select 2) == 'USEC_BloodQty') then {r_player_blood = _param select 1};
			player setVariable [_param select 2, _param select 1, true];
			call player_forceSave;
			[format['Your %1 was adjusted to %2 by admin ""%3.""', _param select 3, [_param select 1] call BIS_fnc_numberText, _info], 4] call "+_kfc_msg+";
		};
	};
");
//---Chat commands
_AH_Global = _AH_Global + ("
	_queue set [count _queue, [{
		local _display = findDisplay 24;
		if (isNull _display) exitWith {};

		local _puid = getPlayerUID player;
		if (_puid in "+str _chatbanned+") exitWith {
			_display closeDisplay 0;
			['You are chat banned!', 2] call "+_kfc_msg+";
		};

		local _txt = ctrlText (_display displayCtrl 101);
		if (_txt == '') exitWith {};

		_txt = toLower _txt;
		if (_txt in "+str _badChat+" && {!((name player + _puid) in "+str (_sorted select 4)+")} && {!(_puid in "+str (_sorted select 4)+")}) then {
			_display closeDisplay 0; ['LOG', [format['Bad chat: %1', _txt], 9]] call "+_kfc_pvs+";
		};"); if ("day/night" in _chatcmds) then {_AH_Global = _AH_Global + ("
		if (_txt in ['!day', '!night', '/day', '/night']) then {
			_display closeDisplay 0;
			if (count playableUnits < "+str _voteplayers+") exitWith {[format['There must be %1 players online to hold a vote.', "+str _voteplayers+"], 2] call "+_kfc_msg+"};
			['VOTE', if (['night', _txt] call fnc_inString) then {0} else {1}] call "+_kfc_pvs+";
		};")}; if ("suicide" in _chatcmds) then {_AH_Global = _AH_Global + ("
		if (_txt in ['!suicide', '/suicide', '!killme', '/killme']) then {
			local _time = diag_tickTime - AH_Login;
			_display closeDisplay 0;
			if (_time < 180) exitWith {[format['You need to wait %1 second(s)!', round(180 - _time)], 2] call "+_kfc_msg+"};
			if (isInTraderCity) exitWith {['You cannot commit suicide in a safe zone!', 2] call "+_kfc_msg+"};
			if (vehicle player != player) exitWith {['You cannot commit suicide in a vehicle!', 2] call "+_kfc_msg+"};
			[player, 'suicide'] call player_death;
		};")}; if ("discord" in _chatcmds) then {_AH_Global = _AH_Global + ("
		if (_txt in ['!discord', '/discord']) then {
			['Discord information listed below.', 2] call "+_kfc_msg+";
			['Select and press Ctrl + C to copy.', 2] call "+_kfc_msg+";
			_display closeDisplay 0;
			"+str _discord+" call AH_fnc_toChat;
		};")}; if ("teamspeak" in _chatcmds) then {_AH_Global = _AH_Global + ("
		if (_txt in ['!teamspeak', '/teamspeak']) then {
			['TeamSpeak information listed below.', 2] call "+_kfc_msg+";
			['Select and press Ctrl + C to copy.', 2] call "+_kfc_msg+";
			_display closeDisplay 0;
			"+str _teamspeak+" call AH_fnc_toChat;
		};")}; if ("website" in _chatcmds) then {_AH_Global = _AH_Global + ("
		if (_txt in ['!website', '/website']) then {
			['Website information listed below.', 2] call "+_kfc_msg+";
			['Select and press Ctrl + C to copy.', 2] call "+_kfc_msg+";
			_display closeDisplay 0;
			"+str _website+" call AH_fnc_toChat;
		};")}; _AH_Global = _AH_Global + ("
		if (_txt in ['!help', '/help']) then {
			_display closeDisplay 0;
			['Chat Commands:', 2] call "+_kfc_msg+";
			if ('discord' in "+str _chatcmds+") then {
				['Discord: !discord, /discord', 2] call "+_kfc_msg+";
			};
			if ('teamspeak' in "+str _chatcmds+") then {
				['TeamSpeak: !teamspeak, /teamspeak', 2] call "+_kfc_msg+";
			};
			if ('website' in "+str _chatcmds+") then {
				['Website: !website, /website', 2] call "+_kfc_msg+";
			};
			if ('day/night' in "+str _chatcmds+") then {
				['Voting: !day, /day, !night, /night', 2] call "+_kfc_msg+";
			};
			if ('suicide' in "+str _chatcmds+") then {
				['Suicide: !suicide, /suicide, !killme, /killme', 2] call "+_kfc_msg+";
			};
		};
	}, 0.1, 0]];
");
//---Post-login code
_AH_Global = _AH_Global + ("
	{
		waitUntil {!isNull (findDisplay 46)};

		"+_kfc_keys+" = []; "+_kfc_keys+" resize 256;
		(findDisplay 46) displayRemoveAllEventHandlers 'KeyDown';
		(findDisplay 46) displayAddEventHandler ['KeyDown', '_this call "+_kfc_keys+"_fnc']; comment 'Keybind event handler';

		waitUntil {!isNil 'Dayz_loginCompleted'};
		AH_Login = diag_tickTime; comment 'Used for chat commands (suicide)';

		comment 'Tell admins that are in game that a new player has joined';
		if (PVCDZ_plr_Login select 8) then {['LOG', [format['New player connected: %1 (%2)', name player, getPlayerUID player], 10]] call "+_kfc_pvs+"};

		local_lockUnlock = {
			local _veh = _this select 0;
			local _lock = if (_this select 1) then {'LOCKED'} else {'UNLOCKED'};

			if (local _veh) then {
				_veh setVehicleLock _lock;
				['LOG', [format['%1 ""%2"" @ %3', _lock call AH_fnc_grammar, typeOf _veh, mapGridPosition _veh], 6]] call "+_kfc_pvs+";
			};
		};

		if ("+str _viewDistance+" > -1) then {setViewDistance "+str _viewDistance+"};
		if ("+str _grassLevel+" > -1) then {setTerrainGrid "+str _grassLevel+"};
		if ("+str _sev+") then {(vehicle player) switchCamera 'EXTERNAL'};

		"+_kfc_keys+" set ["+str _dkey+", {AH_debugMonitor = !AH_debugMonitor; hintSilent ''}]; comment 'Debug monitor key';
	} spawn {call _this};
");
//---Start global thread
_AH_Global = _AH_Global + ("
	"+_kfc_gtrd+" = [{
		waitUntil {!isNil 'BIS_MPF_InitDone'};
		'"+_kfc_get+"' addPublicVariableEventHandler {"+_kfc_get+" = nil; call (_this select 1)};
		"+_kfc_get+" = player; publicVariableServer '"+_kfc_get+"';
		disableSerialization;
		while {69 == 69} do
		{
			{
				if (diag_tickTime - (_x select 1) >= (_x select 2)) then {
					call (_x select 0); _x set [2, diag_tickTime];
				};
			} count _this;
			uiSleep 0.1;
		};
	}, _queue] spawn {(_this select 1) call (_this select 0)};
");
call compile (_kfc_gclnt + " = {" + _AH_Global + "}");
diag_log (_diag_prefix + "Global client compiled successfully");

/* ***** Player Code (sent to normal player clients) ***** */

local _AH_Normal = ("
	local _queue = [];
	"+_kfc_ban+" = {['BAN', _this] call "+_kfc_pvs+"};
");
if (_bfs) then {
	//---Let's scan for bad files within the game directory
	_AH_Normal = _AH_Normal + ("
		{
			preprocessFile 'scan completed. Bad content was';
			{
				local _file = preprocessFile _x;
				if (_file != '') exitWith {format['Bad file: %1 - Contents: %2', _x, _file] call "+_kfc_ban+"};
			} count "+str _badFiles+";
		} spawn {call _this};
	");
};
if (_bvs) then {
	//---Let's scan for bad variables
	_AH_Normal = _AH_Normal + ("
		_queue set [count _queue, [{
			{
				if (!isNil _x) exitWith {
					format['Bad variable: %1', _x] call "+_kfc_ban+";
				};
			} count "+str _badVars+";
		}, 5, diag_tickTime]];
	");
};
if (_oef) then {
	//---Let's make sure nobody is using onEachFrame scripts (esp etc)...
	_AH_Normal = _AH_Normal + ("
		onEachFrame {"+_kfc_oef+" = true};
		_queue set [count _queue, [{
			if ("+_kfc_oef+") then {"+_kfc_oef+" = false} else {'onEachFrame modified' call "+_kfc_ban+"};
		}, 13, diag_tickTime]];
	");
};
if (_bdc) then {
	//---Let's make sure nobody has a hack dialog open
	_AH_Normal = _AH_Normal + ("
		_queue set [count _queue, [{
			{
				if (!isNull findDisplay _x) exitWith {
					format['Bad display: %1', _x] call "+_kfc_ban+";
				};
			} count "+str _badDisplays+";
		}, 2.1, diag_tickTime]];
	");
};
if (_bsc) then {
	//---Let's make sure the player isn't wearing a forbidden skin
	_AH_Normal = _AH_Normal + ("
		_queue set [count _queue, [{
			local _type = typeOf player;
			{
				if (_type == _x || {_type isKindOf 'CAAnimalBase'}) exitWith {
					format['Bad skin: %1', _type] call "+_kfc_ban+";
				};
			} count "+str _badSkins+";
		}, 23.7, 0, {!isNull findDisplay 46}]];
	");
};
if (_upc) then {
	//---Let's make sure the player can't glitch into bases with urban prone
	_AH_Normal = _AH_Normal + ("
		_queue set [count _queue, [{
			player removeAllEventHandlers 'AnimChanged';
			player addEventHandler ['AnimChanged', {
				if ((_this select 1) in ['smk_urbanproneleft', 'smk_urbanproneright', 'smk_prone_to_urbanprone_left', 'smk_prone_to_urbanprone_right']) then {
					if (count(player nearEntities ['Plastic_Pole_EP1_DZ', DZE_PlotPole select 0]) > 0) then {
						player switchMove '';
						player playActionNow 'stop';
						['You cannot perform this animation near plot poles!', 4] call "+_kfc_msg+";
					};
				};
			}];
		}, 17.3, 0, {!isNull findDisplay 46}]];
	");
};
if (_bwc) then {
	//---Let's make sure the player doesn't have an illegal weapon
	_AH_Normal = _AH_Normal + ("
		_queue set [count _queue, [{
			{
				if (currentWeapon player == _x) exitWith {
					format['Bad weapon: %1', _x] call "+_kfc_ban+";
				};
			} count "+str _badWeapons+";
		}, 3.5, diag_tickTime]];
	");
};
/*
A lot of this was moved to client only in Epoch 107, so cannot be monitored for infraction :(
if (_mev) then {
	//---Let's make sure unsecure variables aren't changed
	_AH_Normal = _AH_Normal + ("
		_queue set [count _queue, [{
			try {
				if (str DZE_RestrictSkins != str "+str DZE_RestrictSkins+") then {throw 'DZE_RestrictSkins modified'};
				if (str DZE_MoneyStorageClasses != str "+str DZE_MoneyStorageClasses+") then {throw 'DZE_MoneyStorageClasses modified'};
				if (str DZE_PlotManagementAdmins != str "+str DZE_PlotManagementAdmins+") then {throw 'DZE_PlotManagementAdmins modified'};
				if (DZE_maintainCurrencyRate != "+str DZE_maintainCurrencyRate+") then {throw 'DZE_maintainCurrencyRate modified'};
				if (str DZE_limitPlots != str "+str DZE_limitPlots+") then {throw 'DZE_limitPlots modified'};
				if (str DZE_isRemovable != str "+str DZE_isRemovable+") then {throw 'DZE_isRemovable modified'};
				if (str DZE_doorManagementAdmins != str "+str DZE_doorManagementAdmins+") then {throw 'DZE_doorManagementAdmins modified'};
				if (str DZE_doorManagementAllowManualCode != str "+str DZE_doorManagementAllowManualCode+") then {throw 'DZE_doorManagementAllowManualCode modified'};
				if (str DZE_SafeZonePosArray != str "+str DZE_SafeZonePosArray+") then {throw 'DZE_SafeZonePosArray modified'};
				if (str DZE_PlotPole != str "+str DZE_PlotPole+") then {throw 'DZE_PlotPole modified'};
				if (DZE_BuildingLimit != "+str DZE_BuildingLimit+") then {throw 'DZE_BuildingLimit modified'};
			} catch {
				['BAN', _exception] call "+_kfc_pvs+";
			};
		}, 4.9, 0, {!isNull findDisplay 46}]];
	");
};
*/
//---Let's make sure player info isn't changing
_AH_Normal = _AH_Normal + ("
	if (("+_kfc_info+" select 1) == '') then {"+_kfc_info+" = [name player, getPlayerUID player]};
	_queue set [count _queue, [{
		if (getPlayerUID player != '' && {name player != ("+_kfc_info+" select 0) || {getPlayerUID player != ("+_kfc_info+" select 1)}}) then {
			format['Player information changed! Current Info: %1 (%2) Should be: %3 (%4)', name player, getPlayerUID player, "+_kfc_info+" select 0, "+_kfc_info+" select 1] call "+_kfc_ban+";
		};
	}, 5.3, 0]];
");
//---Let's make sure the player is referenced as an object
_AH_Normal = _AH_Normal + ("
	_queue set [count _queue, [{
		if (typeName player != 'OBJECT') then {
			format['typeName of player changed from OBJECT to %1', typeName player] call "+_kfc_ban+";
		};
	}, 3.7, 0, {!isNull findDisplay 46}]];
");
//---Disable bad BIS functions
_AH_Normal = _AH_Normal + ("
	_queue set [count _queue, [{
		{
			call compile (_x + ' = {}');
		} count [
			'BIS_fnc_3Dcredits', 'BIS_fnc_AAN', 'BIS_fnc_crows', 'BIS_fnc_customGPS', 'BIS_fnc_customGPSvideo', 'BIS_fnc_destroyCity', 'BIS_fnc_dirIndicator',
			'BIS_fnc_flies', 'BIS_fnc_listPlayers', 'BIS_fnc_sandstorm', 'BIS_fnc_spawnCrew', 'BIS_fnc_spawnEnemy', 'BIS_fnc_spawnGroup', 'BIS_fnc_spawnVehicle',
			'BIS_fnc_spotter', 'BIS_fnc_supplydrop', 'BIS_fnc_taskAttack', 'BIS_fnc_taskDefend', 'BIS_fnc_taskPatrol'
		];
	}, 6.9, 0, {!isNull findDisplay 46}]];
");
//---Let's check the integrity of the mission file
if (_mic) then {_AH_Normal = _AH_Normal + ("
	[] spawn {
		waitUntil {uiSleep 1; !isNil '"+_kfc_mic+"'};
		
		local _missionFiles = "+str _missionFiles+";
		local _counts = [];
		{
			local _arr = []; for '_i' from 0 to 128 do {_arr set [_i, 0]};
			local _file = toArray(preprocessFile _x);

			{_x = _x min 128; _arr set [_x, ((_arr select _x) mod 100) + _forEachIndex]} forEach _file;
			_arr set [128, 0];

			_counts set [count _counts, _arr];
		} forEach _missionFiles;

		{
			if (str _x != str ("+_kfc_mic+" select _forEachIndex)) exitWith {
				local _file = _missionFiles select _forEachIndex;
				format['Mission file modified: %1 - Contents: %2', _file, preprocessFile _file] call "+_kfc_ban+";
			};
		} forEach _counts;
	};
")};
//---Spawn normal thread
_AH_Normal = _AH_Normal + ("
	"+_kfc_ntrd+" = _queue spawn {
		while {69 == 69} do
		{
			{
				if (count _x == 3) then {
					if (diag_tickTime - (_x select 1) >= (_x select 2)) then {
						call (_x select 0); _x set [2, diag_tickTime];
					};
				} else {
					if (call (_x select 3)) then {_x resize 3};
				};
			} count _this;
			uiSleep 0.1;
		};
	};
");
call compile (_kfc_nclnt + " = {" + _AH_Normal + "}");
diag_log (_diag_prefix + "Normal client compiled successfully");

/* ********* Staff Code (sent to staff clients) ********* */

local _AH_Admin = ("
	"+_kfc_atrd_cfg+" = [];
	"+_kfc_atrd+" = [] spawn {
		waitUntil {!isNil 'Dayz_loginCompleted'};
		while {69 == 69} do {
			{
				if (diag_tickTime - (_x select 1) >= (_x select 2)) then {
					if (count _x > 3 && {!(_x select 3)}) exitWith {};
					call (_x select 0);
					_x set [2, diag_tickTime];
				};
			} count "+_kfc_atrd_cfg+";
			uiSleep 0.01;
		};
	};

	AH_fnc_add = {
		admin_options = [];
		{
			admin_options set [count admin_options, _x];
		} count _this;
	};

	AH_fnc_addCommands = {
		disableSerialization;

		local _display = findDisplay 6969;
		local _ctrl = _display displayCtrl 1501;

		{
			local _txt = _x select 0;
			local _clr = _x select 2;

			local _index = _ctrl lbAdd _txt;
			if (count _clr > 0) then {
				_ctrl lbSetColor [_index, _clr];
			};
			if ((_txt call AH_fnc_removePrefix) in admin_toggled) then {
				_ctrl lbSetColor [_index, [0, 1, 0, 1]];
			};

			call {
				if (isClass(configFile >> 'CfgVehicles' >> _txt)) exitWith {
					_ctrl lbSetPicture [_index, getText(configFile >> 'CfgVehicles' >> _txt >> 'picture')];
				};
				if (isClass(configFile >> 'CfgMagazines' >> _txt)) exitWith {
					_ctrl lbSetPicture [_index, getText(configFile >> 'CfgMagazines' >> _txt >> 'picture')];
				};
				if (isClass(configFile >> 'CfgWeapons' >> _txt)) exitWith {
					_ctrl lbSetPicture [_index, getText(configFile >> 'CfgWeapons' >> _txt >> 'picture')];
				};
			};
		} count admin_options;
	};

	AH_fnc_addTargets = {
		disableSerialization;

		local _display = findDisplay 6969;
		local _ctrl = _display displayCtrl 1500;

		local _curSel = lbCurSel 1500;
		_curSel = if (_curSel > -1) then {_ctrl lbData _curSel} else {''};
		_ctrl lbSetCurSel -1;
		lbClear _ctrl;

		local _players = playableUnits;
		local _sort = [];
		{
			_sort set [count _sort, name _x + getPlayerUID _x];
		} count _players;

		_sort = [_sort, [6969, 1500]] call AH_fnc_sortArray;

		local _targets = [];
		{
			local _sel = _x;
			{
				if ((name _x + getPlayerUID _x) == _sel) then {
					_targets set [count _targets, _x];
				};
			} forEach _players;
		} forEach _sort;

		local _toAdd = [];
		{
			_toAdd set [count _toAdd, [_x, ((name _x + getPlayerUID _x) in ("+str _sorted+" select 5) || {(getPlayerUID _x) in ("+str _sorted+" select 5)}), vehicle _x != _x, _x call AH_fnc_rank]];
		} count _targets;

		{if ((_x select 3) == 'Player' && {_x select 2}) then {_x set [3, 'Players in Vehicle']}} count _toAdd;

		local _fnc_removeHidden = {
			{
				local _sel = _x;
				{
					if (_sel == (_x select 3) && {_x select 1}) then {
						_toAdd set [_forEachIndex, ''];
						_toAdd = _toAdd - [''];
					};
				} forEach _toAdd;
			} forEach _this;
		};

		local _rank = player call AH_fnc_rank;
		call
		{
			if (_rank == 'Head Admin') exitWith {['Owner'] call _fnc_removeHidden};
			if (_rank == 'Admin') exitWith {['Owner', 'Head Admin'] call _fnc_removeHidden};
			if (_rank == 'Moderator') exitWith {['Owner', 'Head Admin', 'Admin'] call _fnc_removeHidden};
		};

		{
			local _adding = _x;
			if ({(_x select 3) == _adding} count _toAdd > 0) then {
				local _index = _ctrl lbAdd (_adding + 's:');
				{
					local _tar = _x select 0;
					if ((_x select 3) == _adding) then {
						local _name = name _tar; local _info = _name + (getPlayerUID _tar);

						_index = _ctrl lbAdd _name;
						_ctrl lbSetData [_index, _info];
						if (_info == _curSel) then {_ctrl lbSetCurSel _index};

						if (_x select 2) then {
							_ctrl lbSetPicture [_index, getText(configFile >> 'CfgVehicles' >> typeOf (vehicle _tar) >> 'picture')];
						} else {
							comment 'For some reason, currentWeapon as well as other commands that retrieve the weapons of the player seem to fail from time to time.';
							local _wep = call
							{
								if (currentWeapon _tar != '') exitWith {currentWeapon _tar};
								if (primaryWeapon _tar != '') exitWith {primaryWeapon _tar}; comment 'Using this in case currentWeapon fails';
								if (secondaryWeapon _tar != '') exitWith {secondaryWeapon _tar}; comment 'Last resort';
								''
							};
							_ctrl lbSetPicture [_index, getText(configFile >> 'CfgWeapons' >> _wep >> 'picture')]; comment 'Retrieving vehicles seems to work just fine';
						};
					};
				} forEach _toAdd;
				_index = _ctrl lbAdd '';
			};
		} forEach ['Owner', 'Head Admin', 'Admin', 'Moderator', 'Player', 'Players in Vehicle'];
	};

	AH_fnc_adjust = {
		local _target = call AH_fnc_getTarget;
		if (isNull _target) exitWith {['No target selected!', 2] call "+_kfc_msg+"};

		local _name = name _target;
		local _puid = getPlayerUID _target;
		local _qty = _this select 0;
		local _adj = _this select 2;

		['MENU_ADJUST', [_target, _qty, _this select 1, _adj]] call AH_fnc_adminReq;

		[format['You adjusted the %1 of ""%2 (%3)"" to %4.', _adj, _name, _puid, [_qty] call BIS_fnc_numberText], 4] call "+_kfc_msg+";
		['Please wait a few moments and refresh...', 4] call "+_kfc_msg+";
		format['Adjusted the %1 of ""%2 (%3)"" to %4', _adj, _name, _puid, [_qty] call BIS_fnc_numberText] call AH_fnc_adminLog;
	};

	AH_fnc_adminLog = {['LOG', [_this, 2]] call "+_kfc_pvs+"};

	AH_fnc_adminReq = {["+str _kfc_akey+", [toArray(_this select 0), _this select 1]] call "+_kfc_pvs+"};

	AH_fnc_cancelSpec = {
		if (!admin_spectating) exitWith {};
		admin_specTarget = objNull;
		admin_spectating = false;
		(vehicle player) switchCamera 'EXTERNAL';
		['Spectating stopped.', 4] call "+_kfc_msg+";
		'Stopped spectating' call AH_fnc_adminLog;
	};

	AH_fnc_display = {
		disableSerialization;

		createDialog 'InputDialog';
		local _display = findDisplay 6970;

		local _ctrl = _display displayCtrl 1001;
		_ctrl ctrlSetText (_this select 0);

		_ctrl = _display displayCtrl 1002;
		_ctrl ctrlSetText (_this select 1);

		_ctrl = _display displayCtrl 1700;
		_ctrl ctrlSetText (_this select 3);
		_ctrl buttonSetAction ('closeDialog 0;' + (_this select 2));

		_ctrl = _display displayCtrl 1701;
		_ctrl ctrlSetText 'Cancel';
		_ctrl buttonSetAction 'closeDialog 0';

		_ctrl = _display displayCtrl 1003;
		_ctrl ctrlSetText (_this select 4);

		_ctrl = _display displayCtrl 1004;
		_ctrl ctrlSetText (_this select 5);
	};

	AH_fnc_exeCMD = {
		local _txt = lbText [1501, lbCurSel 1501];

		local _opt = [];
		{
			if ((_x select 0) == _txt) exitWith {_opt = _x};
		} count admin_options;

		local _data = _opt select 1;

		if (typeName _data == 'SCALAR') exitWith {
			if (isNil 'admin_targetSpawn') then {admin_targetSpawn = false};
			if (admin_targetSpawn) then {admin_curTarget = call AH_fnc_getTarget};
			if (_data == 0) exitWith {
				if (count _opt > 3) then {
					local _data = _opt select 3;
					if (typeName _data == 'CODE') then {call _data} else {call compile _data};
				};
			};
			if (_data == 1) exitWith {_txt call AH_fnc_toggle};
			if (_data == 2) exitWith {_txt call admin_spawnVeh};
			if (_data == 3) exitWith {_txt call admin_spawnWep};
			if (_data == 4) exitWith {_txt call admin_spawnMag};
			if (_data == 5) exitWith {_txt call admin_spawnBp};
			if (_data == 6) exitWith {_txt call AH_fnc_target};
			if (_data == 7) exitWith {_txt call AH_fnc_logs};
			if (_data == 8) exitWith {_txt call AH_fnc_toChat};
			if (_data == 9) exitWith {_txt call admin_spawnBox};
			if (_data == 10) exitWith {_txt call admin_spawnSafe};
			if (_data == 11) exitWith {_txt call admin_time};
			if (_data == 12) exitWith {_txt call admin_weather};
			if (_data == 13) exitWith {_txt call admin_spawnEvent};
			if (_data == 14) exitWith {_txt call admin_spawnMission};
		};
	};

	AH_fnc_getTarget = {
		local _tar = objNull;
		local _sel = lbData [1500, lbCurSel 1500];

		{
			if ((name _x + getPlayerUID _x) == _sel) exitWith {_tar = _x};
		} count playableUnits;

		_tar
	};

	AH_fnc_infoPanel = {
		{
			ctrlSetText [_x, format['%1', _this select _forEachIndex]];
		} forEach [1400,1401,1402,1403,1404,1405,1406,1407,1408,1409,1410,1411,1412];
	};
");
//---Pull menu code from respective files
_AH_Admin = _AH_Admin + ("
	AH_fnc_initialize = {
		admin_toggled = []; admin_spectating = false; admin_tempSpawn = false;
		admin_tpkeybind = false; admin_flykeybind = false; admin_vehBoost = false;
		admin_waibandit = false; admin_wmags = false;

		local _rank = player call AH_fnc_rank;
		[format['Welcome %1! Loading admin tools...', _rank], 2] call "+_kfc_msg+";

		local _keys = []; local _main = []; local _targ = []; local _logs = []; local _spwn = []; local _envi = [];

		if (_rank == 'Owner') then {
");
#include "menus\owner.sqf"
_AH_Admin = _AH_Admin + ("
		};

		if (_rank == 'Head Admin') then {
");
#include "menus\head_admin.sqf"
_AH_Admin = _AH_Admin + ("
		};

		if (_rank == 'Admin') then {
");
#include "menus\admin.sqf"
_AH_Admin = _AH_Admin + ("
		};

		if (_rank == 'Moderator') then {
");
#include "menus\moderator.sqf"
_AH_Admin = _AH_Admin + ("
		};

		if (admin_forceTemp) then {admin_tempSpawn = true};

		if ({(_x select 0) == '>> Cache Toggle Configuration'} count _main > 0) then {
			local _cache = profileNameSpace getVariable ['ATCACHE', []];
			if (typeName _cache == 'ARRAY' && {count _cache > 0}) then {
				{_x call AH_fnc_toggle} forEach _cache;
			};
		};

		"+_kfc_keys+" set ["+str _menuKey+", AH_fnc_open];
		if ('Delete' in _keys) then {
			"+_kfc_keys+" set [0xD3, admin_delete];
		};
		if ('Execute' in _keys) then {
			"+_kfc_keys+" set [0x42, {call compile preprocessFileLineNumbers 'antihack\test.sqf'}];
		};
		if ('Generate' in _keys) then {
			"+_kfc_keys+" set [0x16, admin_generate];
		};
		if ('Info' in _keys) then {
			"+_kfc_keys+" set [0x17, admin_info];
		};
		if ('Lock' in _keys) then {
			"+_kfc_keys+" set [0x03, admin_lock];
		};
		if ('Unlock' in _keys) then {
			"+_kfc_keys+" set [0x02, admin_unlock];
		};
		"+_kfc_keys+" set [0x43, {
			if (admin_spectating) then {
				closeDialog 0;
				createGearDialog [admin_specTarget, 'RscDisplayGear'];
				format['Viewed the gear of ""%1 (%2)""', name admin_specTarget, getPlayerUID admin_specTarget] call AH_fnc_adminLog;
			};
		}];
		"+_kfc_keys+" set [0x05, admin_fly];
		"+_kfc_keys+" set [0x06, admin_forward];
		"+_kfc_keys+" set [0x44, AH_fnc_cancelSpec];
		"+_kfc_keys+" set [0x12, {
			local _veh = vehicle player; local _vel = velocity _veh;
			if (admin_vehBoost && {isEngineOn _veh}) then {
				_veh setVelocity [(_vel select 0) * 1.035, (_vel select 1) * 1.035, _vel select 2];
			};
		}];
		"+_kfc_keys+" set [0x39, {
			local _veh = vehicle player; local _vel = velocity _veh;
			if (admin_vehBoost && {isEngineOn _veh}) then {
				_veh setVelocity [(_vel select 0) * 0.97, (_vel select 1) * 0.97, _vel select 2];
			};
		}];

		local _puid = getPlayerUID player;
		if (((name player + _puid) in "+str (_sorted select 7)+") || {_puid in "+str (_sorted select 7)+"}) then {
			"+_kfc_keys+" set [0x29, admin_execute];
		};

		['Admin tools loaded successfully! Press F2 to activate.', 2] call "+_kfc_msg+";
	};
");
_AH_Admin = _AH_Admin + ("
	AH_fnc_logs = {
		_this = call AH_fnc_removePrefix;

		if (isNil 'admin_logs') then {
			admin_logs = [];
			'AHPV_Logs' addPublicVariableEventHandler {
				AHPV_Logs = nil; local _in = _this select 1; local _add = [];

				_add set [count _add, ['===============================================================', 0, []]];
				_add set [count _add, ['<< Back', 0, [], {'Log Menu' call admin_back}]];
				_add set [count _add, ['>> Search', 0, [], admin_search]];
				_add set [count _add, ['===============================================================', 0, []]];

				if ((_in select 0) == 'Admin Logs') then {
					_add set [count _add, ['                              Admin Logs', 0, []]];
					{admin_logs set [count admin_logs, _x]} count (_in select 1);
					{_add set [count _add, [_x, 8, []]]} count admin_logs;
				};
				if ((_in select 0) == 'Hack Logs') then {
					_add set [count _add, ['                                Hack Logs', 0, []]];
					{hack_logs set [count hack_logs, _x]} count (_in select 1);
					{_add set [count _add, [_x, 8, []]]} count hack_logs;
				};
				if ((_in select 0) == 'New Player Logs') then {
					_add set [count _add, ['                            New Player Logs', 0, []]];
					{newPlayer_logs set [count newPlayer_logs, _x]} count (_in select 1);
					{_add set [count _add, [_x, 8, []]]} count newPlayer_logs;
				};
				if ((_in select 0) == 'Safe Zone Logs') then {
					_add set [count _add, ['                            Safe Zone Logs', 0, []]];
					{safeZone_logs set [count safeZone_logs, _x]} count (_in select 1);
					{_add set [count _add, [_x, 8, []]]} count safeZone_logs;
				};
				if ((_in select 0) == 'Trader Logs') then {
					_add set [count _add, ['                              Trader Logs', 0, []]];
					{trader_logs set [count trader_logs, _x]} count (_in select 1);
					{_add set [count _add, [_x, 8, []]]} count trader_logs;
				};
				if ((_in select 0) == 'Lock/Unlock Logs') then {
					_add set [count _add, ['                            Lock/Unlock Logs', 0, []]];
					{lockUnlock_logs set [count lockUnlock_logs, _x]} count (_in select 1);
					{_add set [count _add, [_x, 8, []]]} count lockUnlock_logs;
				};
				if ((_in select 0) == 'Maintenance Logs') then {
					_add set [count _add, ['                            Maintenance Logs', 0, []]];
					{maintenance_logs set [count maintenance_logs, _x]} count (_in select 1);
					{_add set [count _add, [_x, 8, []]]} count maintenance_logs;
				};
				if ((_in select 0) == 'Player Logs') then {
					_add set [count _add, ['                              Player Logs', 0, []]];
					{player_logs set [count player_logs, _x]} count (_in select 1);
					{_add set [count _add, [_x, 8, []]]} count player_logs;
				};
				if ((_in select 0) == 'Surveillance Logs') then {
					_add set [count _add, ['                            Surveillance Logs', 0, []]];
					{surveillance_logs set [count surveillance_logs, _x]} count (_in select 1);
					{_add set [count _add, [_x, 8, []]]} count surveillance_logs;
				};
				if ((_in select 0) == 'Death Logs') then {
					_add set [count _add, ['                              Death Logs', 0, []]];
					{death_logs set [count death_logs, _x]} count (_in select 1);
					{_add set [count _add, [_x, 8, []]]} count death_logs;
				};

				[format['%1 synchronized successfully.', (_in select 0) call AH_fnc_grammar], 4] call "+_kfc_msg+";
				_add call AH_fnc_add; call AH_fnc_refresh;
			};
		};

		{
			if (isNil _x) then {call compile (_x + '= [];')};
		} forEach ['hack_logs', 'newPlayer_logs', 'safeZone_logs', 'trader_logs', 'lockUnlock_logs', 'maintenance_logs', 'player_logs', 'surveillance_logs', 'death_logs'];

		local _get = call {
			if (_this == 'Admin Logs') exitWith {count admin_logs};
			if (_this == 'Hack Logs') exitWith {count hack_logs};
			if (_this == 'New Player Logs') exitWith {count newPlayer_logs};
			if (_this == 'Safe Zone Logs') exitWith {count safeZone_logs};
			if (_this == 'Trader Logs') exitWith {count trader_logs};
			if (_this == 'Lock/Unlock Logs') exitWith {count lockUnlock_logs};
			if (_this == 'Maintenance Logs') exitWith {count maintenance_logs};
			if (_this == 'Player Logs') exitWith {count player_logs};
			if (_this == 'Surveillance Logs') exitWith {count surveillance_logs};
			if (_this == 'Death Logs') exitWith {count death_logs};
		};

		[format['Synchronizing %1, please wait...', toLower _this], 4] call "+_kfc_msg+";
		['LOG_VIEW', [_this, _get]] call AH_fnc_adminReq;
	};

	AH_fnc_noBrackets = {
		local _ret = str _this;
		_ret = toArray _ret;

		{_ret = _ret - [_x]} count [91,93];

		toString _ret;
	};

	AH_fnc_open = {
		if (!isNull (findDisplay 6969)) exitWith {closeDialog 0};
		disableSerialization;

		createDialog 'StaffDialog';
		local _display = findDisplay 6969;
		local _rank = player call AH_fnc_rank;

		local _ctrl = _display displayCtrl 1001;
		_ctrl ctrlSetText format['%1 Menu', _rank];

		_ctrl = _display displayCtrl 2100;
		_ctrl ctrlSetEventHandler ['LBSelChanged', '(_this select 1) call AH_fnc_switchMenu;'];
		{
			local _index = _ctrl lbAdd (_x select 0);
			if (_index == 0) then {
				_ctrl lbSetCurSel _index;
				_index call AH_fnc_switchMenu;
			};
		} forEach admin_menus;

		_ctrl = _display displayCtrl 1500;
		_ctrl ctrlSetFontHeight 0.03;
		_ctrl ctrlSetEventHandler ['LBSelChanged', 'call AH_fnc_selTarget;'];
		_ctrl ctrlSetEventHandler ['LBDblClick', ""'Spectate' call AH_fnc_target;""];

		_ctrl = _display displayCtrl 1501;
		_ctrl ctrlSetFontHeight 0.035;
		_ctrl ctrlSetEventHandler ['LBSelChanged', 'call AH_fnc_selCMD;'];
		_ctrl ctrlSetEventHandler ['LBDblClick', 'call AH_fnc_exeCMD;'];

		ctrlShow [1417, false];

		if (admin_adjblood) then {
			(_display displayCtrl 1403) ctrlSetEventHandler ['KeyDown', ""
				if ((_this select 1) == 0x1C) then {
					[parseNumber ctrlText(_this select 0), 'USEC_BloodQty', 'blood'] call AH_fnc_adjust;
				};
			""];
		};
		if (admin_adjhumanity) then {
			(_display displayCtrl 1404) ctrlSetEventHandler ['KeyDown', ""
				if ((_this select 1) == 0x1C) then {
					[parseNumber ctrlText(_this select 0), 'humanity', 'humanity'] call AH_fnc_adjust;
				};
			""];
		};
		if (admin_adjcoins) then {
			(_display displayCtrl 1405) ctrlSetEventHandler ['KeyDown', ""
				if ((_this select 1) == 0x1C) then {
					[parseNumber ctrlText(_this select 0), """+str _cashvar+""", 'wallet'] call AH_fnc_adjust;
				};
			""];
		};
		if (admin_adjbank) then {
			(_display displayCtrl 1406) ctrlSetEventHandler ['KeyDown', ""
				if ((_this select 1) == 0x1C) then {
					[parseNumber ctrlText(_this select 0), """+str _bankvar+""", 'bank'] call AH_fnc_adjust;
				};
			""];
		};

		{
			(_display displayCtrl (_x select 0)) ctrlSetText (_x select 1);
		} count [
			[1003, 'Information Panel'],
			[1004, '*Ctrl + C to Copy'],
			[1005, '*Double Click to Spectate'],
			[1006, 'Target:'],
			[1007, 'UID:'],
			[1008, 'Vehicle:'],
			[1009, 'Blood:'],
			[1010, 'Humanity:'],
			[1011, 'Coins:'],
			[1012, 'Bank:'],
			[1013, 'Position:'],
			[1014, 'Map Grid:'],
			[1015, 'Group:'],
			[1016, 'Weapons:'],
			[1017, 'Magazines:'],
			[1018, 'Nearby:'],
			[1019, 'Uptime:'],
			[1020, 'AI:'],
			[1021, 'Vehicles:'],
			[1022, 'Zombies:'],
			[1023, 'Antihack v1.0.3 | Compiled N/A | By BigEgg & MG'],
			[1417, 'Write code and press ""Enter"" to execute!'],
			[1600, 'X']
		];

		_ctrl = _display displayCtrl 1700;
		_ctrl ctrlSetText 'Disconnect';
		_ctrl buttonSetAction ""call player_forceSave; endMission 'END1';"";

		_ctrl = _display displayCtrl 1701;
		_ctrl ctrlSetText 'Refresh';
		_ctrl buttonSetAction 'call AH_fnc_refresh;';

		_ctrl = _display displayCtrl 1600;
		_ctrl buttonSetAction 'closeDialog 0;';

		call AH_fnc_refresh;
	};

	AH_fnc_rank = {
		local _puid = getPlayerUID _this;
		local _plr = name _this + _puid;

		if ((_plr in ("+str _sorted+" select 0)) || {_puid in ("+str _sorted+" select 0)}) exitWith {'Moderator'};
		if ((_plr in ("+str _sorted+" select 1)) || {_puid in ("+str _sorted+" select 1)}) exitWith {'Admin'};
		if ((_plr in ("+str _sorted+" select 2)) || {_puid in ("+str _sorted+" select 2)}) exitWith {'Head Admin'};
		if ((_plr in ("+str _sorted+" select 3)) || {_puid in ("+str _sorted+" select 3)}) exitWith {'Owner'};

		'Player'
	};

	AH_fnc_refresh = {
		disableSerialization;

		local _display = findDisplay 6969;
		if (isNull _display) exitWith {};

		local _ctrl = _display displayCtrl 1002;
		_ctrl ctrlSetText format['Players Online: %1', count playableUnits];

		_ctrl = _display displayCtrl 1413;
		_ctrl ctrlSetText (call AH_fnc_uptime);

		_ctrl = _display displayCtrl 1414;
		_ctrl ctrlSetText format['%1', {!isPlayer _x} count allUnits];

		_ctrl = _display displayCtrl 1415;
		_ctrl ctrlSetText format['%1', count(entities 'Air' + entities 'LandVehicle' + entities 'Ship')];

		_ctrl = _display displayCtrl 1416;
		_ctrl ctrlSetText format['%1', dayz_currentGlobalZombies];

		_ctrl = _display displayCtrl 1501;
		lbClear _ctrl;

		call AH_fnc_selTarget;
		call AH_fnc_addTargets;
		call AH_fnc_addCommands;
	};

	AH_fnc_removePrefix = {
		local _ret = toArray _this;

		if ((_ret select 0) == 32) then {
			{_ret set [_forEachIndex, -1]} forEach [0,1,2,3];
			_ret = _ret - [-1];
		};

		if ((_ret select 0) == 62) then {
			{_ret set [_forEachIndex, -1]} forEach [0,1,2];
			_ret = _ret - [-1];
		};

		toString _ret
	};

	AH_fnc_search = {
		local _find = _this;
		local _found = [];

		[format['Searching for all items containing ""%1"".', _find], 2] call "+_kfc_msg+";

		{
			if ([_find, _x select 0] call fnc_inString && {(_x select 1) != 0}) then {
				_found set [count _found, _x];
			};
		} count admin_options;

		admin_optionsS = admin_options;

		[
			['===============================================================', 0, []],
			['>> Search Again', 0, [], {admin_options = admin_optionsS; admin_optionsS = nil; call AH_fnc_refresh; call admin_search}],
			['===============================================================', 0, []]
		] + _found call AH_fnc_add;

		call AH_fnc_refresh;
	};

	AH_fnc_selCMD = {
		local _txt = lbText [1501, lbCurSel 1501];

		local _add = false;
		{
			if (isClass(configFile >> _x >> _txt)) exitWith {_add = true};
		} count ['CfgVehicles', 'CfgMagazines', 'CfgWeapons'];

		if (_add) then {[_txt,'N/A','N/A','N/A','N/A','N/A','N/A','N/A','N/A','N/A','N/A','N/A','N/A'] call AH_fnc_infoPanel};
	};

	AH_fnc_selTarget = {
		local _tar = call AH_fnc_getTarget;
		if (isNull _tar) then {_tar = player};

		local _grp = [];
		{
			if (_x != _tar) then {
				_grp set [count _grp, name _x + ' ' + format['(%1)', getPlayerUID _x]];
			};
		} count (units group _tar);

		local _mag = [];
		{
			if !(['Swing', _x] call fnc_inString) then {
				_mag set [count _mag, _x];
			};
		} count (magazines _tar);

		local _ner = [];
		{
			local _dis = _x distance _tar;
			if (_x != _tar && {_dis <= 500}) then {
				_ner set [count _ner, name _x + ' ' + format['(%1)', getPlayerUID _x] + ' ' + format['%1m', round _dis]];
			};
		} count playableUnits;

		[
			name _tar,
			getPlayerUID _tar,
			typeOf (vehicle _tar),
			[(_tar getVariable ['USEC_BloodQty', 0])] call BIS_fnc_numberText,
			[(_tar getVariable ['humanity', 0])] call BIS_fnc_numberText,
			[(_tar getVariable ["+str _cashvar+", 0])] call BIS_fnc_numberText,
			[(_tar getVariable ["+str _bankvar+", 0])] call BIS_fnc_numberText,
			getPosATL _tar,
			mapGridPosition _tar,
			_grp call AH_fnc_noBrackets,
			(weapons _tar) call AH_fnc_noBrackets,
			_mag call AH_fnc_noBrackets,
			_ner call AH_fnc_noBrackets
		] call AH_fnc_infoPanel;
	};

	AH_fnc_sortArray = {
		disableSerialization;

		local _ctrl = findDisplay ((_this select 1) select 0) displayCtrl ((_this select 1) select 1);
		lbClear _ctrl;

		{_ctrl lbAdd _x} forEach (_this select 0);
		lbSort _ctrl;

		local _ret = [];
		for '_x' from 0 to (lbsize _ctrl)-1 do {
			_ret set [count _ret, _ctrl lbText _x];
		};

		lbClear _ctrl;
		_ret
	};

	AH_fnc_switchMenu = {
		local _opt = [];
		{
			if (_this == _forEachIndex) exitWith {_opt = _x};
		} forEach admin_menus;

		local _data = _opt select 1;
		if (typeName _data == 'CODE') then {call _data} else {_data call AH_fnc_add};

		call AH_fnc_refresh;
	};

	AH_fnc_loadouts = {
		admin_loadouts = [];
		admin_loadout_index = [];
		{
			admin_loadouts set [count admin_loadouts, 'Give ' + (_x select 0) + ' Loadout'];
			admin_loadout_index set [count admin_loadout_index, _x select 0];
		} forEach "+str _loadouts+";
	};

	AH_fnc_target = {
		local _target = call AH_fnc_getTarget;
		if (isNull _target) exitWith {['No target selected!', 2] call "+_kfc_msg+"};
		if (isNil 'admin_loadouts') then {call AH_fnc_loadouts};

		local _name = name _target;
		local _puid = getPlayerUID _target;

		_this = call AH_fnc_removePrefix;
		if (_this == 'Teleport to Target') exitWith {
			local _veh = vehicle _target;
			local _veh2 = vehicle player;

			local _pos = [_veh] call FNC_getPos;
			local _dir = getDir _veh;
			local _dis = if (_veh2 == player) then {-5} else {-10};

			_pos = [(_pos select 0) + _dis * sin(_dir), (_pos select 1) + _dis * cos(_dir), _pos select 2];
			_veh2 setPosATL _pos;
			_veh2 setDir _dir;

			{player reveal _x} count (player nearEntities ['All', 50]);

			[format['You have teleported to ""%1 (%2)"" @ %3.', _name, _puid, mapGridPosition player], 4] call "+_kfc_msg+";
			format['Teleported to ""%1 (%2)"" @ %3', _name, _puid, mapGridPosition player] call AH_fnc_adminLog;
		};
		if (_this == 'Teleport Target to You') exitWith {
			local _veh = vehicle player;

			local _pos = [_veh] call FNC_getPos;
			local _dir = getDir _veh;
			local _dis = if (vehicle _target == _target) then {5} else {10};

			_pos = [(_pos select 0) + _dis * sin(_dir), (_pos select 1) + _dis * cos(_dir), _pos select 2];

			['TAR_TP2U', [_target, _pos, _dir]] call AH_fnc_adminReq;

			[format['You teleported ""%1 (%2)"" to you.', _name, _puid], 4] call "+_kfc_msg+";
			format['Teleported to ""%1 (%2)"" @ %3', _name, _puid, mapGridPosition _target] call AH_fnc_adminLog;
		};
		if (_this == 'Heal Target') exitWith {
			['TAR_HEAL', [_target]] call AH_fnc_adminReq;
			[format['You healed ""%1 (%2).""', _name, _puid], 4] call "+_kfc_msg+";
			format['Healed ""%1 (%2)"" @ %3', _name, _puid, mapGridPosition _target] call AH_fnc_adminLog;
		};
		if (_this == 'Adjust Target Bank') exitWith {
			['Adjusting Bank', 'Amount:', format[""
				local _qty = parseNumber(ctrlText 1400);
				if (_qty == 0) exitWith {['You must enter an amount!', 2] call "+_kfc_msg+"};
				['TAR_BANK', ['%1%2', _qty]] call AH_fnc_adminReq;
				['You added '+([_qty] call BIS_fnc_numberText)+' '+CurrencyName+' to the bank of """"%1 (%2).""""', 4] call "+_kfc_msg+";
				'Added '+([_qty] call BIS_fnc_numberText)+' '+CurrencyName+' to the bank of """"%1 (%2)""""' call AH_fnc_adminLog;
			"", _name, _puid], 'Adjust', format['Target: %1 (%2)', _name, _puid], format['Current: %1', [_target getVariable ["+str _bankvar+", 0]] call BIS_fnc_numberText]] call AH_fnc_display;
		};
		if (_this == 'Adjust Target Wallet') exitWith {
			['Adjusting Wallet', 'Amount:', format[""
				local _qty = parseNumber(ctrlText 1400);
				if (_qty == 0) exitWith {['You must enter an amount!', 2] call "+_kfc_msg+"};
				['TAR_WALLET', ['%1%2', _qty]] call AH_fnc_adminReq;
				['You added '+([_qty] call BIS_fnc_numberText)+' '+CurrencyName+' to the wallet of """"%1 (%2).""""', 4] call "+_kfc_msg+";
				'Added '+([_qty] call BIS_fnc_numberText)+' '+CurrencyName+' to the wallet of """"%1 (%2)""""' call AH_fnc_adminLog;
			"", _name, _puid], 'Adjust', format['Target: %1 (%2)', _name, _puid], format['Current: %1', [_target getVariable ["+str _cashvar+", 0]] call BIS_fnc_numberText]] call AH_fnc_display;
		};
		if (_this == 'Adjust Target Humanity') exitWith {
			['Adjusting Humanity', 'Amount:', format[""
				local _qty = parseNumber(ctrlText 1400);
				if (_qty == 0) exitWith {['You must enter an amount!', 2] call "+_kfc_msg+"};
				['TAR_HUMANITY', ['%1%2', _qty]] call AH_fnc_adminReq;
				['You gave '+([_qty] call BIS_fnc_numberText)+' humanity to """"%1 (%2).""""', 4] call "+_kfc_msg+";
				'Gave '+([_qty] call BIS_fnc_numberText)+' humanity to """"%1 (%2)""""' call AH_fnc_adminLog;
			"", _name, _puid], 'Adjust', format['Target: %1 (%2)', _name, _puid], format['Current: %1', [_target getVariable ['humanity', 0]] call BIS_fnc_numberText]] call AH_fnc_display;
		};
		if (_this == 'Give Target Ammo') exitWith {
			['Giving Ammo', 'Amount:', format[""
				local _qty = parseNumber(ctrlText 1400);
				if (_qty == 0) exitWith {['You must enter an amount!', 2] call "+_kfc_msg+"};
				['TAR_AMMO', ['%1%2', _qty]] call AH_fnc_adminReq;
				['You gave '+([_qty] call BIS_fnc_numberText)+' mags to """"%1 (%2).""""', 4] call "+_kfc_msg+";
				'Gave '+([_qty] call BIS_fnc_numberText)+' mags to """"%1 (%2)""""' call AH_fnc_adminLog;
			"", _name, _puid], 'Give', format['Target: %1 (%2)', _name, _puid], ''] call AH_fnc_display;
		};
		if (_this == 'Spectate') exitWith {
			if (isNil 'admin_specTarget') then {
				admin_specTarget = objNull;
				"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
					if (isNull admin_specTarget) exitWith {if (admin_spectating) then {call AH_fnc_cancelSpec}};
					[format[""<t size='0.5'>%1 (%2)</t><br/><t size='0.5'>Bank: %3 - Wallet: %4 - Blood: %5 - Humanity: %6</t><br/><t size='0.5'>Position: %7 - Weapon: %8</t>"",
						name admin_specTarget,
						getPlayerUID admin_specTarget,
						[admin_specTarget getVariable ["+str _bankvar+", 0]] call BIS_fnc_numberText,
						[admin_specTarget getVariable ["+str _cashvar+", 0]] call BIS_fnc_numberText,
						[admin_specTarget getVariable ['USEC_BloodQty', 0]] call BIS_fnc_numberText,
						[admin_specTarget getVariable ['humanity', 0]] call BIS_fnc_numberText,
						mapGridPosition admin_specTarget,
						currentWeapon admin_specTarget
					], -1, safeZoneY, 0.2, 0, 0, 170] spawn BIS_fnc_dynamicText;
				}, 0.1, 0]];
			};
			if (_target == player) exitWith {if (!isNull admin_specTarget) then {call AH_fnc_cancelSpec} else {['You are not spectating anyone!', 2] call "+_kfc_msg+"}};
			(vehicle _target) switchCamera 'EXTERNAL';
			admin_specTarget = _target; admin_spectating = true;
			[format['Spectating ""%1 (%2).""', _name, _puid], 4] call "+_kfc_msg+";
			format['Spectated ""%1 (%2)""', _name, _puid] call AH_fnc_adminLog;
		};
		if (_this == 'Join Target Vehicle') exitWith {
			if (vehicle _target == _target) exitWith {['Target is not in a vehicle!', 2] call "+_kfc_msg+"};
			if (vehicle player != player) exitWith {['You are in a vehicle!', 2] call "+_kfc_msg+"};
			player moveInCargo (vehicle _target);
			[format['You joined the vehicle of ""%1 (%2).""', _name, _puid], 4] call "+_kfc_msg+";
			format['Joined the vehicle of ""%1 (%2)""', _name, _puid] call AH_fnc_adminLog;
		};
		if (_this == 'Move Target into Your Vehicle') exitWith {
			if (vehicle _target != _target) exitWith {['Target is in a vehicle!', 2] call "+_kfc_msg+"};
			if (vehicle player == player) exitWith {['You are not in a vehicle!', 2] call "+_kfc_msg+"};
			['TAR_MOVINVEH', [_target]] call AH_fnc_adminReq;
			[format['You moved ""%1 (%2)"" into your vehicle.', _name, _puid], 4] call "+_kfc_msg+";
			format['Moved ""%1 (%2)"" into their vehicle', _name, _puid] call AH_fnc_adminLog;
		};
		if (_this == 'Repair Target Vehicle') exitWith {
			if (vehicle _target == _target) exitWith {['Target is not in a vehicle!', 2] call "+_kfc_msg+"};
			['TAR_REPAIR', [_target]] call AH_fnc_adminReq;
			[format['You repaired the vehicle of ""%1 (%2).""', _name, _puid], 4] call "+_kfc_msg+";
			format['Repaired the vehicle of ""%1 (%2)""', _name, _puid] call AH_fnc_adminLog;
		};
		if (_this == 'Unfreeze Target') exitWith {
			if (_target == player) exitWith {['This cannot be used on yourself!', 2] call "+_kfc_msg+"};
			['TAR_FREEZE', [_target, 0]] call AH_fnc_adminReq;
			[format['You unfroze ""%1 (%2).""', _name, _puid], 4] call "+_kfc_msg+";
			format['Unfroze ""%1 (%2)""', _name, _puid] call AH_fnc_adminLog;
		};
		if (_this == 'Freeze Target') exitWith {
			if (_target == player) exitWith {['This cannot be used on yourself!', 2] call "+_kfc_msg+"};
			['TAR_FREEZE', [_target, 1]] call AH_fnc_adminReq;
			[format['You froze ""%1 (%2).""', _name, _puid], 4] call "+_kfc_msg+";
			format['Froze ""%1 (%2)""', _name, _puid] call AH_fnc_adminLog;
		};
		if (_this == 'Kill Target') exitWith {
			['TAR_KILL', [_target]] call AH_fnc_adminReq;
			[format['You killed ""%1 (%2).""', _name, _puid], 4] call "+_kfc_msg+";
			format['Killed ""%1 (%2)""', _name, _puid] call AH_fnc_adminLog;
		};
		if (_this == 'Make Target Commit Suicide') exitWith {
			['TAR_SUICIDE', [_target]] call AH_fnc_adminReq;
			[format['You made ""%1 (%2)"" commit suicide.', _name, _puid], 4] call "+_kfc_msg+";
			format['Made ""%1 (%2)"" commit suicide', _name, _puid] call AH_fnc_adminLog;
		};
		if (_this == 'Disconnect Target') exitWith {
			['TAR_DISCONNECT', [_target]] call AH_fnc_adminReq;
			[format['You disconnected ""%1 (%2).""', _name, _puid], 4] call "+_kfc_msg+";
			format['Disconnected ""%1 (%2)""', _name, _puid] call AH_fnc_adminLog;
		};
		if (_this == 'Remove Target Gear') exitWith {
			['TAR_RMGEAR', [_target]] call AH_fnc_adminReq;
			[format['You removed the gear of ""%1 (%2).""', _name, _puid], 4] call "+_kfc_msg+";
			format['Removed the gear of ""%1 (%2)""', _name, _puid] call AH_fnc_adminLog;
		};
		if (_this == 'Send Target Up') exitWith {
			['Launching', 'Distance:', format[""
				local _qty = parseNumber(ctrlText 1400);
				if (_qty == 0) exitWith {['You must enter an amount!', 2] call "+_kfc_msg+"};
				['TAR_SENDUP', ['%1%2', _qty]] call AH_fnc_adminReq;
				['You sent """"%1 (%2)"""" up '+([_qty] call BIS_fnc_numberText)+' meters.', 4] call "+_kfc_msg+";
				'Sent """"%1 (%2)"""" up '+([_qty] call BIS_fnc_numberText)+' meters' call AH_fnc_adminLog;
			"", _name, _puid], 'Launch', format['Target: %1 (%2)', _name, _puid], ''] call AH_fnc_display;
		};
		if (_this == 'Send Target to Ocean') exitWith {
			['TAR_SENDOCEAN', [_target]] call AH_fnc_adminReq;
			[format['You sent ""%1 (%2)"" to the ocean.', _name, _puid], 4] call "+_kfc_msg+";
			format['Sent ""%1 (%2)"" to the ocean', _name, _puid] call AH_fnc_adminLog;
		};
		if (_this == 'Eject Target') exitWith {
			if (vehicle _target == _target) exitWith {['Target is not in a vehicle!', 2] call "+_kfc_msg+"};
			['TAR_EJECT', [_target]] call AH_fnc_adminReq;
			[format['You ejected ""%1 (%2)"" from their vehicle.', _name, _puid], 4] call "+_kfc_msg+";
			format['Ejected ""%1 (%2)"" from their vehicle', _name, _puid] call AH_fnc_adminLog;
 		};
		if (_this in admin_loadouts) exitWith {
			local _loadout = 0; {if (_this == _x) exitWith {_loadout = _forEachIndex}} forEach admin_loadouts;
			['TAR_LOADOUT', [_target,_loadout]] call AH_fnc_adminReq;
			_loadout = admin_loadout_index select _loadout;
			[format['You gave ""%1 (%2)"" the %3 loadout.', _name, _puid, _loadout], 4] call "+_kfc_msg+";
			format['Gave ""%1 (%2)"" the %3 loadout', _name, _puid, _loadout] call AH_fnc_adminLog;
		};
	};

	AH_fnc_toggle = {
		_this = call AH_fnc_removePrefix;

		local _change = if (_this in admin_toggled) then {'Disabled'} else {'Enabled'};
		local _enabled = _change == 'Enabled';

		if (_change == 'Disabled') then {admin_toggled = admin_toggled - [_this]} else {admin_toggled set [count admin_toggled, _this]};

		local _count = {count _x > 3 && {(_x select 4) == _this}} count "+_kfc_atrd_cfg+";

		local _fn_alterLoop = {
			local _bool = if ((_this select 1) == 1) then {true} else {false};
			{
				if (count _x > 3 && {(_this select 0) == (_x select 4)}) exitWith {
					if (!_bool) then {_x set [2, 0]}; comment 'Reset time so the code in the loop begins immediately when toggled';
					_x set [3, _bool];
				};
			} count "+_kfc_atrd_cfg+";
		};

		call {
			if (_this == 'God Mode') exitWith {
				if (_enabled) then {
					if (isNil 'fnc_usec_damageHandler1') then {fnc_usec_damageHandler1 = fnc_usec_damageHandler};
					if (isNil 'BIS_Effects_EH_Killed1') then {BIS_Effects_EH_Killed1 = BIS_Effects_EH_Killed};
					BIS_Effects_EH_Killed = {
						comment 'Prevent player from dying in vehicle crashes';
						local _veh = _this select 0;
						if (({_veh isKindOf _x} count ['Helicopter','Plane','Tank','Car','Ship'] > 0) && {player in (crew _veh)}) then {
							player action ['Eject', _veh];
						};
					};
					{call compile (_x + ' = false;')} count [
						'r_player_infected', 'r_player_injured', 'r_player_handler', 'r_player_unconscious', 'r_player_cardiac', 'r_fracture_legs', 'r_fracture_arms', 'r_player_inpain', 'R3F_TIRED_Accumulator'
					];
					{player setVariable [_x, false, true]} count ['USEC_infected', 'NORRN_unconscious', 'USEC_isCardiac', 'USEC_inPain'];
					dayz_sourceBleeding = objNull; call fnc_usec_resetWoundPoints;
					{player setHit [_x, 0]} count ['legs', 'hands'];
					{player setVariable [_x, 0, true]} count ['hit_legs', 'hit_hands'];
					R3F_TIRED_Accumulator = 0;
					if (_count == 0) then {
						"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
							local _veh = vehicle player;
							dayz_temperatur = 36;
							dayz_hunger = 0;
							dayz_thirst = 0;
							fnc_usec_damageHandler = {0};
							r_player_blood = 12000;
							r_player_unconscious = false;
							r_player_cardiac = false;
							player allowDamage false;
							player setVariable ['combattimeout', 0];
						}, 0.1, 0, true, _this]];
					} else {
						[_this, 1] call _fn_alterLoop;
					};
				} else {
					[_this, 2] call _fn_alterLoop;
					player allowDamage true;
					fnc_usec_damageHandler = fnc_usec_damageHandler1;
					BIS_Effects_EH_Killed = BIS_Effects_EH_Killed1;
				};
			};
			if (_this == 'Vehicle God Mode') exitWith {
				if (_enabled) then {
					if (_count == 0) then {
						"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
							local _veh = vehicle player;
							if (_veh != player) then {_veh setDamage 0; _veh setFuel 1};
						}, 0.1, 0, true, _this]];
					} else {
						[_this, 1] call _fn_alterLoop;
					};
				} else {
					[_this, 2] call _fn_alterLoop;
				};
			};
			if (_this == 'Zombie Shield') exitWith {
				if (_enabled) then {
					if (_count == 0) then {
						"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
							{deleteVehicle _x} count ((vehicle player) nearEntities ['zZombie_Base', 50]);
						}, 3, 0, true, _this]];
					} else {
						[_this, 1] call _fn_alterLoop;
					};
				} else {
					[_this, 2] call _fn_alterLoop;
				};
			};
			if (_this == 'No Zombie Aggro') exitWith {
				if (_enabled) then {
					if (isNil 'player_alertZombies1') then {player_alertZombies1 = player_alertZombies};
					player_alertZombies = {};
					if (isNil 'player_zombieAttack1') then {player_zombieAttack1 = player_zombieAttack};
					player_zombieAttack = {};
					if (isNil 'player_zombieCheck1') then {player_zombieCheck1 = player_zombieCheck};
					player_zombieCheck = {false};
				} else {
					player_zombieAttack = player_zombieAttack1;
					player_zombieCheck = player_zombieCheck1;
					player_alertZombies = player_alertZombies1;
				};
			};
			if (_this == 'Invisibility') exitWith {
				['TOG_INVIS', if (_enabled) then {true} else {false}] call AH_fnc_adminReq;
			};
			if (_this == '[Alt + Left Click] Map Teleport') exitWith {
				disableSerialization;

				local _ctrl = (findDisplay 12) displayCtrl 51;
				if (_enabled) then {
					if !('ItemMap' in weapons player) then {player addWeapon 'ItemMap'};
					_ctrl ctrlSetEventHandler ['MouseButtonUp', ""
						if (_this select 6) then {
							local _veh = vehicle player;
							local _ini = mapGridPosition player;

							local _pos = (_this select 0) ctrlMapScreenToWorld [_this select 2, _this select 3];
							_pos = [_pos select 0, _pos select 1, if (_veh isKindOf 'Air' && {isEngineOn _veh}) then {150} else {1}];

							preloadCamera _pos;
							_veh setPosATL _pos;
							openMap [false, false];

							{player reveal _x} count (player nearEntities ['All', 50]);

							[format['Teleported to %1.', mapGridPosition player], 4] call "+_kfc_msg+";
							format['Teleported from %1 to %2', _ini, mapGridPosition player] call AH_fnc_adminLog;
						};
					""];
				} else {
					_ctrl ctrlSetEventHandler ['MouseButtonUp', ''];
				};
			};
			if (_this == 'Player ESP') exitWith {
				if (_enabled) then {
					if (_count == 0) then {
						"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
							local _layer = 69;
							disableSerialization;
							for '_x' from 69 to 169 do {_x cutText ['', 'PLAIN']}; comment 'cutRsc Default caused a lot of flickering';
							{
								local _dis = _x distance cameraOn;
								if (!isNull _x && {alive _x} && {vehicle _x != cameraOn} && {!visibleMap} && {_dis <= viewDistance}) then {
									local _pos = [_x] call FNC_getPos;
									_pos = [_pos select 0, _pos select 1, (_pos select 2) + 2];
									_pos = worldToScreen _pos;

									if (count _pos > 0) then {
										local _clr = if (vehicle _x == _x) then {'#FFFFFF'} else {'#FFA500'};
										local _prm = if (vehicle _x == _x) then {getText(configFile >> 'CfgWeapons' >> currentWeapon _x >> 'displayName')} else {getText(configFile >> 'CfgVehicles' >> typeOf (vehicle _x) >> 'displayName')};
										local _txt = parseText format[""<t size='0.35' color='%1'>%2 [%3m]</t><br/><t size='0.35' color='%1'>(%4)</t>"", _clr, name _x, round _dis, _prm];
										_layer cutRsc ['RscDynamicText', 'PLAIN']; _layer = _layer + 1;
										_ctrl = (uiNamespace getVariable 'BIS_dynamicText') displayCtrl 9999;
										_ctrl ctrlSetPosition [(_pos select 0) - (safeZoneW / 2), _pos select 1, safeZoneW, safeZoneH];
										_ctrl ctrlSetStructuredText _txt;
										_ctrl ctrlSetFade 0; _ctrl ctrlCommit 0;
									};
								};
							} count playableUnits;
						}, 0.05, 0, true, _this]];
					} else {
						[_this, 1] call _fn_alterLoop;
					};
				} else {
					[_this, 2] call _fn_alterLoop;
					for '_x' from 69 to 169 do {_x cutRsc ['Default', 'PLAIN']};
				};
			};
			if (_this == 'Door Admin') exitWith {
				if (_enabled) then {
					DZE_doorManagementAdmins set [count DZE_doorManagementAdmins, getPlayerUID player];
				} else {
					DZE_doorManagementAdmins = DZE_doorManagementAdmins - [getPlayerUID player];
				};
			};
			if (_this == 'Plot Admin') exitWith {
				if (_enabled) then {
					DZE_PlotManagementAdmins set [count DZE_PlotManagementAdmins, getPlayerUID player];
				} else {
					DZE_PlotManagementAdmins = DZE_PlotManagementAdmins - [getPlayerUID player];
				};
			};
			if (_this == 'Instant Build') exitWith {
				if (_enabled) then {
					fn_loopAction1 = fn_loopAction;
					fn_loopAction = {true};
				} else {
					fn_loopAction = fn_loopAction1;
					fn_loopAction1 = nil;
				};
			};
			if (_this == 'No Build Restrictions') exitWith {
				if (_enabled) then {
					canbuild1 = canbuild;
					canbuild = true;
					DZE_BuildOnRoads1 = DZE_BuildOnRoads;
					DZE_BuildOnRoads = true;
					DZE_BuildHeightLimit1 = DZE_BuildHeightLimit;
					DZE_BuildHeightLimit = 0;
					DZE_BuildingLimit1 = DZE_BuildingLimit;
					DZE_BuildingLimit = 9999;
					DZE_NoBuildNear1 = DZE_NoBuildNear;
					DZE_NoBuildNear = [];
					DZE_MaxPlotFriends1 = DZE_MaxPlotFriends;
					DZE_MaxPlotFriends = 99;
					DZE_doorManagementMaxFriends1 = DZE_doorManagementMaxFriends;
					DZE_doorManagementMaxFriends = 99;
					DZE_limitPlots1 = DZE_limitPlots;
					DZE_limitPlots = false;
					DZE_requireplot1 = DZE_requireplot;
					DZE_requireplot = 0;
					dze_buildChecks1 = dze_buildChecks;

					dze_buildChecks = {
						local _item =	_this select 1;
						local _classname = getText (configFile >> 'CfgMagazines' >> _item >> 'ItemActions' >> 'Build' >> 'create');
						local _isPole = (_classname == 'Plastic_Pole_EP1_DZ');

						[true, _isPole]
					};

					if (!isNil 'BlacklistedBuildings') then {
						BlacklistedBuildings1 = BlacklistedBuildings;
						BlacklistedBuildings = [];
					};

					if (!isNil 'RestrictedBuildingZones') then {
						RestrictedBuildingZones1 = RestrictedBuildingZones;
						RestrictedBuildingZones = [];
					};
				} else {
					canbuild = canbuild1;
					DZE_BuildOnRoads = DZE_BuildOnRoads1;
					DZE_BuildHeightLimit = DZE_BuildHeightLimit1;
					DZE_BuildingLimit = DZE_BuildingLimit1;
					DZE_NoBuildNear = DZE_NoBuildNear1;
					DZE_MaxPlotFriends = DZE_MaxPlotFriends1;
					DZE_doorManagementMaxFriends = DZE_doorManagementMaxFriends1;
					DZE_limitPlots = DZE_limitPlots1;
					DZE_requireplot = DZE_requireplot1;
					dze_buildChecks = dze_buildChecks1;

					{
						call compile (_x + '= nil;');
					} count ['canbuild1', 'DZE_BuildOnRoads1', 'DZE_BuildHeightLimit1', 'DZE_BuildingLimit1', 'DZE_NoBuildNear1', 'DZE_MaxPlotFriends1', 'DZE_doorManagementMaxFriends1', 'DZE_limitPlots1', 'DZE_requireplot1', 'dze_buildChecks1'];

					if (!isNil 'BlacklistedBuildings') then {
						BlacklistedBuildings = BlacklistedBuildings1;
						BlacklistedBuildings1 = nil;
					};

					if (!isNil 'RestrictedBuildingZones') then {
						RestrictedBuildingZones = RestrictedBuildingZones1;
						RestrictedBuildingZones1 = nil;
					};
				};
			};
			if (_this == 'No Recoil') exitWith {
				if (_enabled) then {player setUnitRecoilCoefficient 0} else {player setUnitRecoilCoefficient 1};
			};
			if (_this == 'Rapid Fire') exitWith {
				if (_enabled) then {
					if (_count == 0) then {
						"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
							local _veh = vehicle player;
							_veh setWeaponReloadingTime [_veh, currentWeapon _veh, 0];
						}, 0.01, 0, true, _this]];
					} else {
						[_this, 1] call _fn_alterLoop;
					};
				} else {
					[_this, 2] call _fn_alterLoop;
				};
			};
			if (_this == 'Unlimited Ammo') exitWith {
				if (_enabled) then {
					if (_count == 0) then {
						"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
							(vehicle player) setVehicleAmmo 1;
						}, 0.1, 0, true, _this]];
					} else {
						[_this, 1] call _fn_alterLoop;
					};
				} else {
					[_this, 2] call _fn_alterLoop;
				};
			};
			if (_this == 'Target Spawning') exitWith {
				admin_targetSpawn = if (_enabled) then {true} else {false};
			};
			if (_this == 'Unit Icons') exitWith {
				if (isNil 'admin_unitIcons' && {isNil 'admin_vehicleIcons'}) then {
					disableSerialization;
					((findDisplay 12) displayCtrl 51) ctrlSetEventHandler ['Draw', '(_this select 0) call admin_drawIcons;'];
				};
				admin_unitIcons = if (_enabled) then {true} else {false};
			};
			if (_this == 'Vehicle Icons') exitWith {
				if (isNil 'admin_unitIcons' && {isNil 'admin_vehicleIcons'}) then {
					disableSerialization;
					((findDisplay 12) displayCtrl 51) ctrlSetEventHandler ['Draw', '(_this select 0) call admin_drawIcons;'];
				};
				admin_vehicleIcons = if (_enabled) then {true} else {false};
			};
			if (_this == 'Animal Markers') exitWith {
				if (_enabled) then {
					if (_count == 0) then {
						if (isNil 'admin_animals') then {admin_animals = []};
						"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
							[2, admin_animals, 'Animal'] call admin_marker;
							admin_animals = []; {if (alive _x) then {admin_animals set [count admin_animals, _x]}} count (entities 'Animal');
							[1, admin_animals, 'Animal', 'ColorYellow', 'typeOf _x'] call admin_marker;
						}, 5, 0, true, _this]];
					} else {
						[_this, 1] call _fn_alterLoop;
					};
				} else {
					[_this, 2] call _fn_alterLoop;
					[2, admin_animals, 'Animal'] call admin_marker;
				};
			};
			if (_this == 'Body Markers') exitWith {
				if (_enabled) then {
					if (_count == 0) then {
						if (isNil 'admin_bodies') then {admin_bodies = []};
						"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
							[2, admin_bodies, 'Body'] call admin_marker;
							admin_bodies = [];
							{
								if (_x getVariable ['bodyName', ''] != '') then {
									admin_bodies set [count admin_bodies, _x];
								};
							} count allDead;
							[1, admin_bodies, 'Body', 'ColorRed', ""_x getVariable ['bodyName', '']""] call admin_marker;
						}, 7, 0, true, _this]];
					} else {
						[_this, 1] call _fn_alterLoop;
					};
				} else {
					[_this, 2] call _fn_alterLoop;
					[2, admin_bodies, 'Body'] call admin_marker;
				};
			};
			if (_this == 'Plot Markers') exitWith {
				if (_enabled) then {
					if (_count == 0) then {
						if (isNil 'admin_plots') then {admin_plots = []};
						"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
							[2, admin_plots, 'Plot'] call admin_marker;
							admin_plots = entities 'Plastic_Pole_EP1_DZ';
							[1, admin_plots, 'Plot', 'ColorOrange', ""toString(((_x getVariable ['plotfriends', []]) select 0) select 1) + 's Plot'""] call admin_marker;
						}, 15, 0, true, _this]];
					} else {
						[_this, 1] call _fn_alterLoop;
					};
				} else {
					[_this, 2] call _fn_alterLoop;
					[2, admin_plots, 'Plot'] call admin_marker;
				};
			};
			if (_this == 'Vault Markers') exitWith {
				if (_enabled) then {
					if (_count == 0) then {
						if (isNil 'admin_vaults') then {admin_vaults = []};
						"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
							[2, admin_vaults, 'Vault'] call admin_marker;
							admin_vaults = nearestObjects [getMarkerPos 'center', ['VaultStorage', 'VaultStorageLocked', 'VaultStorage2Locked', 'TallSafeLocked'], ((getMarkerSize 'center') select 1) * 2];
							[1, admin_vaults, 'Vault', 'ColorPink', 'typeOf _x'] call admin_marker;
						}, 30 + random 30, 0, true, _this]];
					} else {
						[_this, 1] call _fn_alterLoop;
					};
				} else {
					[_this, 2] call _fn_alterLoop;
					[2, admin_vaults, 'Vault'] call admin_marker;
				};
			};
			if (_this == 'Lockbox Markers') exitWith {
				if (_enabled) then {
					if (_count == 0) then {
						if (isNil 'admin_lockbox') then {admin_lockbox = []};
						"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
							[2, admin_lockbox, 'Lockbox'] call admin_marker;
							admin_lockbox = nearestObjects [getMarkerPos 'center', ['LockboxStorage', 'LockboxStorageLocked', 'LockboxStorage2Locked', 'LockboxStorageWinterLocked', 'LockboxStorageWinter2Locked'], ((getMarkerSize 'center') select 1) * 2];
							[1, admin_lockbox, 'Lockbox', 'ColorPink', 'typeOf _x'] call admin_marker;
						}, 30 + random 30, 0, true, _this]];
					} else {
						[_this, 1] call _fn_alterLoop;
					};
				} else {
					[_this, 2] call _fn_alterLoop;
					[2, admin_lockbox, 'Lockbox'] call admin_marker;
				};
			};
			if (_this == 'Storage Markers') exitWith {
				if (_enabled) then {
					if (_count == 0) then {
						if (isNil 'admin_storage') then {admin_storage = []};
						"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
							[2, admin_storage, 'Storage'] call admin_marker;
							admin_storage = nearestObjects [getMarkerPos 'center', ['GunRack_DZ', 'GunRack2_DZ', 'Wooden_shed_DZ', 'Wooden_shed2_DZ', 'StorageShed_DZ', 'StorageShed2_DZ', 'WoodCrate_DZ', 'WoodCrate2_DZ', 'StorageCrate_DZ', 'CamoStorageCrate_DZ', 'TentStorage', 'DomeTentStorage', 'DesertTentStorage', 'TentStorageWinter', 'WinterDomeTentStorage'], ((getMarkerSize 'center') select 1) * 2];
							[1, admin_storage, 'Storage', 'ColorPink', 'typeOf _x'] call admin_marker;
						}, 30 + random 30, 0, true, _this]];
					} else {
						[_this, 1] call _fn_alterLoop;
					};
				} else {
					[_this, 2] call _fn_alterLoop;
					[2, admin_storage, 'Storage'] call admin_marker;
				};
			};
			if (_this == 'Player Markers') exitWith {
				if (_enabled) then {
					if (_count == 0) then {
						if (isNil 'admin_units') then {admin_units = []};
						"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
							[2, admin_units, 'Unit'] call admin_marker;
							admin_units = [];
							{
								if (_x != player && {effectiveCommander (vehicle _x) == _x}) then {
									admin_units set [count admin_units, _x];
								};
							} count playableUnits;
							[1, admin_units, 'Unit', 'ColorGreen', ""
								local _veh = vehicle _x;
								if (_veh == _x) then {name _x} else {
									if (effectiveCommander _veh == _x) then {
										local _crew = [];
										{
											_crew set [count _crew, name _x];
										} count (crew _veh);
										format['%1%2', typeOf _veh, _crew]
									};
								};
							""] call admin_marker;
						}, 3, 0, true, _this]];
					} else {
						[_this, 1] call _fn_alterLoop;
					};
				} else {
					[_this, 2] call _fn_alterLoop;
					[2, admin_units, 'Unit'] call admin_marker;
				};
			};
			if (_this == 'Vehicle Markers') exitWith {
				if (_enabled) then {
					if (_count == 0) then {
						if (isNil 'admin_vehicles2') then {admin_vehicles2 = []};
						"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
							[2, admin_vehicles2, 'Vehicle'] call admin_marker;
							admin_vehicles2 = entities 'Air' + entities 'LandVehicle' + entities 'Ship';
							[1, admin_vehicles2, 'Vehicle', 'ColorBrown', 'typeOf _x'] call admin_marker;
						}, 3, 0, true, _this]];
					} else {
						[_this, 1] call _fn_alterLoop;
					};
				} else {
					[_this, 2] call _fn_alterLoop;
					[2, admin_vehicles2, 'Vehicle'] call admin_marker;
				};
			};
			if (_this == 'Temporary Spawning') exitWith {
				admin_tempSpawn = if (_enabled) then {true} else {false};
			};
			if (_this == 'TP Forward Keybind') exitWith {
				admin_tpkeybind = if (_enabled) then {true} else {false};
			};
			if (_this == 'Fly Keybind') exitWith {
				admin_flykeybind = if (_enabled) then {true} else {false};
			};
			if (_this == 'Vehicle Boost') exitWith {
				admin_vehBoost = if (_enabled) then {true} else {false};
			};
			if (_this == 'Spawn Bandit Missions') exitWith {
				admin_waibandit = if (_enabled) then {true} else {false};
			};
			if (_this == 'Spawn with Mags') exitWith {
				admin_wmags = if (_enabled) then {true} else {false};
			};
		};

		[format['%1 %2.', _this call AH_fnc_grammar, toLower _change], 4] call "+_kfc_msg+";
		format['%1 %2 @ %3', _change, toLower _this, mapGridPosition player] call AH_fnc_adminLog;

		if (_this == 'Vehicle Boost') then {
			['Press ""E"" to speed up and ""Space"" to slow down.', 4] call "+_kfc_msg+";
		};

		call AH_fnc_refresh;
	};

	AH_fnc_traderItems = {
		local _arr = [];
		{
			local _cat = format['menu_%1', _x];
			if (!isNil _cat) then {
				_cat = (call compile _cat) select 0;
				{_arr set [count _arr, _x]} count _cat;
			};
		} forEach serverTraders;

		local _ret = [];
		{
			local _inv = missionConfigFile >> 'CfgTraderCategory' >> format['Category_%1', _x select 1];
			if (isNumber(_inv >> 'duplicate')) then {
				_inv = missionConfigFile >> 'CfgTraderCategory' >> format['Category_%1', getNumber(_inv >> 'duplicate')];
			};

			for '_i' from 0 to (count _inv)-1 do
			{
				local _item = configName(_inv select _i);
				local _type = getText(_inv >> _item >> 'type');

				if (_type == _this && {!(_item in _ret)}) then {
					_ret set [count _ret, _item];
				};
			};
		} count _arr;

		_ret
	};

	admin_back = {
		local _index = 0;
		{
			if ((_x select 0) == _this) exitWith {_index = _forEachIndex};
		} forEach admin_menus;
		_index call AH_fnc_switchMenu;
	};

	admin_backpacks = {
		if (isNil 'admin_allBps') then {
			admin_traderBps = 'trade_backpacks'	call AH_fnc_traderItems;
			if (!admin_limitLists) then {
				admin_allBps = [];

				local _cfg = configFile >> 'CfgVehicles';
				for '_b' from 0 to (count _cfg)-1 do
				{
					local _bp = _cfg select _b;
					local _type = configName _bp;

					if (isClass _bp && {getNumber(_bp >> 'scope') >= 2} && {getText(_bp >> 'picture') != ''} && {getText(_bp >> 'vehicleClass') == 'Backpacks'} && {_type != 'IED_placement_BAF'}) then {
						admin_allBps set [count admin_allBps, _type];
					};
				};
			} else {
				admin_allBps = admin_traderBps;
				admin_traderBps = nil;
			};
			admin_allBps = [admin_allBps, [6969, 1501]] call AH_fnc_sortArray;
		};
		if (isNil 'admin_bpMenu') then {
			local _backpacks = [];
			{
				_backpacks set [count _backpacks, [_x, 5, if (!admin_limitLists && {_x in admin_traderBps}) then {[0,1,0,1]} else {[]}]];
			} count admin_allBps;

			admin_bpMenu = [
				['===============================================================', 0, []],
				['>> Search', 0, [], admin_search],
				['Target Spawning', 1, []],
				['===============================================================', 0, []],
				['                              Backpacks', 0, []]
			] + _backpacks + [['', 0, []]];
		};
		admin_bpMenu call AH_fnc_add;
	};

	admin_cache = {
		profileNameSpace setVariable ['ATCACHE', admin_toggled];
		saveProfileNameSpace;
		['Current toggle configuration cached successfully.', 4] call "+_kfc_msg+";
	};

	admin_coords = {
		local _txt = format['Coords: %1 - Direction: %2', [player] call FNC_getPos, getDir player];
		_txt call AH_fnc_toChat;
		[_txt, 1] call "+_kfc_msg+";
	};

	admin_delete = {
		admin_cursorTarget = cursorTarget;
		if (isNull admin_cursorTarget) exitWith {['Target is null!', 2] call "+_kfc_msg+";};

		local _fnc_delete = {
			['KEY_DEL', admin_cursorTarget] call AH_fnc_adminReq;
			[format['Deleted ""%1"" successfully.', typeOf admin_cursorTarget], 4] call "+_kfc_msg+";
			format['Deleted ""%1"" @ %2', typeOf admin_cursorTarget, mapGridPosition player] call AH_fnc_adminLog;
		};

		[format['Are you sure you want to delete ""%1""?', typeOf admin_cursorTarget], 4] call "+_kfc_msg+";

		admin_choice = [
			['', true],
			['Are you sure?', [0], '', -5, [['expression', '']], '1', '0'],
			['Yes', [2], '', -5, [['expression', format['call %1;', _fnc_delete]]], '1', '1'],
			['No', [3], '', -5, [['expression', '']], '1', '1']
		];
		showCommandingMenu '#USER:admin_choice';
	};

	admin_drawIcons = {
		if (admin_unitIcons) then {
			{
				_this drawIcon ['\ca\ui\data\iconman_ca.paa', if (!isPlayer _x) then {[1,0,0,1]} else {[0,1,0,1]}, [_x] call FNC_getPos, 20, 20, getDir _x, '', 0];
			} count allUnits;
		};
		if (admin_vehicleIcons) then {
			{
				_this drawIcon [getText(configFile >> 'CfgVehicles' >> typeOf _x >> 'icon'), if (locked _x) then {[1,0,0,1]} else {[0,0,1,1]}, [_x] call FNC_getPos, 20, 20, getDir _x, '', 0];
			} count (entities 'Air' + entities 'LandVehicle' + entities 'Ship');
		};
	};

	admin_execute = {
		disableSerialization;

		createDialog 'InjectorDialog';
		local _display = findDisplay 6971;

		comment 'Title text';
		local _ctrl = _display displayCtrl 1001;
		_ctrl ctrlSetText 'Authorized SQF Injector';

		comment 'Server button';
		_ctrl = _display displayCtrl 1700;
		_ctrl ctrlSetText 'Server';
		_ctrl buttonSetAction ""
			['MENU_CODE', [toArray(ctrlText 1400), 1]] call AH_fnc_adminReq;
			['Code executed on the server.', 2] call "+_kfc_msg+";
		"";

		comment 'Local button';
		_ctrl = _display displayCtrl 1701;
		_ctrl ctrlSetText 'Local';
		_ctrl buttonSetAction ""
			call compile ctrlText 1400;
			format['Executed the following code locally: %1', ctrlText 1400] call AH_fnc_adminLog;
			['Code executed locally.', 2] call "+_kfc_msg+";
		"";

		comment 'Global button';
		_ctrl = _display displayCtrl 1702;
		_ctrl ctrlSetText 'Global';
		_ctrl buttonSetAction ""
			['MENU_CODE', [toArray(ctrlText 1400), 2]] call AH_fnc_adminReq;
			['Code executed globally.', 2] call "+_kfc_msg+";
		"";

		comment 'X button';
		_ctrl = _display displayCtrl 1600;
		_ctrl ctrlSetText 'X';
		_ctrl buttonSetAction 'closeDialog 0';
	};

	admin_fly = {
		if (!admin_flykeybind) exitWith {};

		if (isNil 'admin_flycnt') then {
			admin_flycnt = 0;
			"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
				if (admin_flycnt < 1) exitWith {};
				format['Flew up %1 times within 30 seconds', admin_flycnt] call AH_fnc_adminLog;
				admin_flycnt = 0;
			}, 30, 0]];
		};

		local _veh = vehicle player;
		local _vel = velocity _veh;
		_veh setVelocity [_vel select 0, _vel select 1, 10];

		admin_flycnt = admin_flycnt + 1;
	};

	admin_forward = {
		if (!admin_tpkeybind) exitWith {};

		local _veh = vehicle player;
		local _dir = getDir _veh;
		local _pos = getPos _veh;

		_veh setPos [(_pos select 0) + 5 * sin(_dir), (_pos select 1) + 5 * cos(_dir), _pos select 2];

		if (isNil 'admin_forwardcnt') then {
			admin_forwardcnt = 0;
			"+_kfc_atrd_cfg+" set [count "+_kfc_atrd_cfg+", [{
				if (admin_forwardcnt < 1) exitWith {};
				format['Teleported forward %1 times in 30 seconds', [admin_forwardcnt] call BIS_fnc_numberText] call AH_fnc_adminLog;
				admin_forwardcnt = 0;
			}, 30, 0]];
		};

		admin_forwardcnt = admin_forwardcnt + 1;
	};

	admin_generate = {
		local _ct = cursorTarget;
		if (!isNull _ct && {player distance _ct < 10}) then {
			if (_ct isKindOf 'Air' || {_ct isKindOf 'LandVehicle'} || {_ct isKindOf 'Ship'}) then {
				local _charID = parseNumber(_ct getVariable ['CharacterID', '0']);
				if (_charID != 0) then {
					local _key = '';
					call {
						if (_charID > 0 && {_charID <= 2500}) exitWith {_key = format['ItemKeyGreen%1', _charID]};
						if (_charID > 2500 && {_charID <= 5000}) exitWith {_key = format['ItemKeyRed%1', _charID - 2500]};
						if (_charID > 5000 && {_charID <= 7500}) exitWith {_key = format['ItemKeyBlue%1', _charID - 5000]};
						if (_charID > 7500 && {_charID <= 10000}) exitWith {_key = format['ItemKeyYellow%1', _charID - 7500]};
						if (_charID > 10000 && {_charID <= 12500}) exitWith {_key = format['ItemKeyBlack%1', _charID - 10000]};
					};

					false call dz_fn_meleeMagazines;
					local _isOk = [player, _key] call BIS_fnc_invAdd;
					true call dz_fn_meleeMagazines;

					if (_isOk) then {
						[format['You added ""%1"" to your inventory.', getText(configFile >> 'CfgWeapons' >> _key >> 'displayName')], 4] call "+_kfc_msg+";
						format['Added a key for ""%1"" to their inventory @ %2', typeOf _ct, mapGridPosition player] call AH_fnc_adminLog;
					} else {
						['You do not have enough room on your toolbelt!', 2] call "+_kfc_msg+";
					};
				} else {
					['You cannot create a key for this vehicle.', 2] call "+_kfc_msg+";
				};
			};
		};
	};

	admin_info = {
		local _ct = cursorTarget;
		if (isNull _ct) exitWith {['Target is null!', 2] call "+_kfc_msg+"};

		local _type = typeOf _ct;
		local _charID = _ct getVariable ['CharacterID', '0'];
		local _parse = parseNumber _charID;
		local _coins = _ct getVariable ["+str _cashvar+", -1];
		local _opuid = _ct getVariable ['ownerPUID', '0'];
		local _friends = call {
			if (_type == 'Plastic_Pole_EP1_DZ') exitWith {_ct getVariable ['plotfriends', []]};
			if (_type in DZE_DoorsLocked) exitWith {_ct getVariable ['doorfriends', []]};
			[]
		};

		local _fnc_getCombo = {
			if !(typeOf _this in ['LockboxStorage','LockboxStorageLocked']) exitWith {_charID};
			local _combo = _parse - 10000;
			local _color = '';

			comment 'Credits to salival (https://www.github.com/oiad) for the formula';
			if (_combo <= 99) then {_color = 'Red';};
			if (_combo >= 100 && {_combo <= 199}) then {_color = 'Green'; _combo = _combo - 100;};
			if (_combo >= 200) then {_color = 'Blue'; _combo = _combo - 200;};
			if (_combo <= 9) then {_combo = format['0%1', _combo];};

			format['%1%2', _color, _combo]
		};

		local _txt = format['Name: %1 ', if (isPlayer _ct) then {name _ct} else {_type}];
		if (_type in DZE_LockableStorage || {_type in DZE_DoorsLocked}) then {
			_txt = _txt + format['Combo: %1 ', _ct call _fnc_getCombo];
		} else {
			_txt = _txt + format['CharID: %1 ', _charID];
		};
		if (_coins > -1) then {_txt = _txt + format['Coins: %1 ', _coins]};
		_txt = _txt + format['ID: %1 ', _ct getVariable ['ObjectID', '0']];
		_txt = _txt + format['UID: %1 ', if (isPlayer _ct) then {getPlayerUID _ct} else {_ct getVariable ['ObjectUID', '0']}];
		if (_opuid != '0') then {_txt = _txt + format['OwnerUID: %1 ', _opuid]};
		if ((_type isKindOf 'Air' || {_type isKindOf 'LandVehicle'} || {_type isKindOf 'Ship'}) && {_parse > 0}) then {
			local _key = format['ItemKey%1%2', DZE_keyColors select floor(_parse / 2500), _parse - (floor(_parse / 2500) * 2500)];
			_txt = _txt + format['Key: %1 (%2) ', getText(configFile >> 'CfgWeapons' >> _key >> 'displayName'), _key];
		};
		if (count _friends > 0) then {
			local _arr = _friends;
			_friends = [];
			{
				_friends set [count _friends, (toString(_x select 1) + format[' (%1)', _x select 0])];
			} count _arr;
			_txt = _txt + format['Friends: %1 ', _friends];
		};
		_txt = _txt + format['Position: %1', [_ct] call FNC_getPos];

		[_txt, 5] call "+_kfc_msg+";
		format['Viewed the information of ""%1"" @ %2', _type, mapGridPosition player] call AH_fnc_adminLog;
	};

	admin_killai = {
		['Killing AI', 'Radius:', ""
			local _rad = parseNumber(ctrlText 1400);
			if (_rad == 0) exitWith {['You must enter a radius!', 2] call "+_kfc_msg+"};
			['TOOL_KILLAI', _rad] call AH_fnc_adminReq;
			[format['You removed all AI within %1 meter(s) of your location.', [_rad] call BIS_fnc_numberText], 4] call "+_kfc_msg+";
		"", 'Kill', '', ''] call AH_fnc_display;
	};

	admin_lock = {
		local _ct = cursorTarget;
		local _type = typeOf _ct;

		if (!isNull _ct && {player distance _ct < 10}) then {
			if !(locked _ct) then {
				if (_type in DZE_UnLockedStorage) then {
					dayz_combination = _ct getVariable ['CharacterID', '0'];
					_ct spawn player_lockVault;
				};
				if (_type in DZE_DoorsLocked) then {
					{_ct animate [_x, 0]} count ['Open_door', 'Open_latch'];
				};
				if (_type isKindOf 'Air' || {_type isKindOf 'LandVehicle'} || {_type isKindOf 'Ship'}) then {
					[nil, nil, nil, _ct] execVM '\z\addons\dayz_code\actions\lock_veh.sqf';
				};
				[format['You locked target ""%1"".', _type], 4] call "+_kfc_msg+";
				format['Locked ""%1"" @ %2', _type, mapGridPosition player] call AH_fnc_adminLog;
			} else {
				['Target is not unlocked!', 2] call "+_kfc_msg+";
			};
		} else {
			['Target is null!', 2] call "+_kfc_msg+";
		};
	};

	admin_magazines = {
		if (isNil 'admin_allMags') then {
			admin_traderMags = 'trade_items' call AH_fnc_traderItems;
			if (!admin_limitLists) then {
				admin_allMags = [];

				local _cfg = configFile >> 'CfgMagazines';
				for '_m' from 0 to (count _cfg)-1 do
				{
					local _mag = _cfg select _m;
					local _type = configName _mag;

					if (isClass _mag && {getNumber(_mag >> 'scope') >= 2} && {getText(_mag >> 'picture') != ''}) then {
						admin_allMags set [count admin_allMags, _type];
					};
				};
			} else {
				admin_allMags = admin_traderMags;
				admin_traderMags = nil;
			};
			admin_allMags = [admin_allMags, [6969, 1501]] call AH_fnc_sortArray;
		};
		if (isNil 'admin_magMenu') then {
			local _magazines = [];
			{
				_magazines set [count _magazines, [_x, 4, if (!admin_limitLists && {_x in admin_traderMags}) then {[0,1,0,1]} else {[]}]];
			} count admin_allMags;

			admin_magMenu = [
				['===============================================================', 0, []],
				['>> Search', 0, [], admin_search],
				['Target Spawning', 1, []],
				['===============================================================', 0, []],
				['                              Magazines', 0, []]
			] + _magazines + [['', 0, []]];
		};
		admin_magMenu call AH_fnc_add;
	};

	admin_marker = {
		local _id = _this select 0;
		local _arr = _this select 1;
		if (_id == 1) exitWith {
			{
				local _marker = createMarkerLocal [format['%1Marker%2', _this select 2, _forEachIndex], getPos _x];
				_marker setMarkerTypeLocal 'DestroyedVehicle';
				_marker setMarkerColorLocal (_this select 3);
				_marker setMarkerTextLocal (call compile (_this select 4));
			} forEach _arr;
		};
		if (_id == 2) exitWith {
			{
				deleteMarkerLocal format['%1Marker%2', _this select 2, _forEachIndex];
			} forEach _arr;
		};
	};

	admin_nets = {
		['Removing Camo Nets', 'Radius:', ""
			local _rad = parseNumber(ctrlText 1400);
			if (_rad == 0) exitWith {['You must enter a radius!', 2] call "+_kfc_msg+"};
			if (_rad > Z_VehicleDistance) exitWith {[format['Maximum radius is %1m. Please try again.', Z_VehicleDistance], 2] call "+_kfc_msg+"};
			local _nets = nearestObjects [player, ['DesertCamoNet_DZ', 'ForestCamoNet_DZ', 'DesertLargeCamoNet_DZ', 'ForestLargeCamoNet_DZ'], _rad];
			if (count _nets < 1) exitWith {['There are no camo nets within the defined radius.', 2] call "+_kfc_msg+"};
			{
				PVDZ_obj_Destroy = [_x getVariable ['ObjectID', '0'], _x getVariable ['ObjectUID', '0'], player, _x, dayz_authKey];
				publicVariableServer 'PVDZ_obj_Destroy';
			} count _nets;
			[format['You removed %1 camo nets within %2 meter(s) of your location.', count _nets, [_rad] call BIS_fnc_numberText], 4] call "+_kfc_msg+";
			format['Removed %1 camo nets within %2 meter(s) of %3', count _nets, [_rad] call BIS_fnc_numberText, mapGridPosition player] call AH_fnc_adminLog;
		"", 'Remove', '', ''] call AH_fnc_display;
	};

	admin_poles = {
		['Removing Plot Poles', 'Radius:', ""
			local _rad = parseNumber(ctrlText 1400);
			if (_rad == 0) exitWith {['You must enter a radius!', 2] call "+_kfc_msg+"};
			if (_rad > Z_VehicleDistance) exitWith {[format['Maximum radius is %1m. Please try again.', Z_VehicleDistance], 2] call "+_kfc_msg+"};
			local _poles = player nearEntities ['Plastic_Pole_EP1_DZ', _rad];
			if (count _poles < 1) exitWith {['There are no plot poles within the defined radius.', 2] call "+_kfc_msg+"};
			{
				PVDZ_obj_Destroy = [_x getVariable ['ObjectID', '0'], _x getVariable ['ObjectUID', '0'], player, _x, dayz_authKey];
				publicVariableServer 'PVDZ_obj_Destroy';
			} count _poles;
			[format['You removed %1 plot poles within %2 meter(s) of your location.', count _poles, [_rad] call BIS_fnc_numberText], 4] call "+_kfc_msg+";
			format['Removed %1 plot pole(s) within %2 meter(s) of %3', count _poles, [_rad] call BIS_fnc_numberText, mapGridPosition player] call AH_fnc_adminLog;
		"", 'Remove', '', ''] call AH_fnc_display;
	};

	admin_search = {['Search', 'Find:', '(ctrlText 1400) call AH_fnc_search;', 'Search', '', ''] call AH_fnc_display};

	admin_spawnBox = {
		_this = call AH_fnc_removePrefix;

		local _pos = [player] call FNC_getPos;
		local _dir = getDir player;
		local _pos = [(_pos select 0) + 3 * sin(_dir), (_pos select 1) + 3 * cos(_dir), _pos select 2];

		_arrow = 'Sign_arrow_down_large_EP1' createVehicleLocal _pos;
		['DZ_CardboardBox', _arrow] call fn_waitForObject;

		['SPWN_BOX', [_this, _pos]] call AH_fnc_adminReq;
		[format['You spawned a ""%1"" nearby.', _this], 4] call "+_kfc_msg+";
		format['Spawned a ""%1"" @ %2', _this, mapGridPosition player] call AH_fnc_adminLog;
	};

	admin_spawnBp = {
		if (admin_targetSpawn && {isNull admin_curTarget}) exitWith {['No target selected!', 2] call "+_kfc_msg+"};
		if (admin_targetSpawn) then {
			['BP_GIVE', [admin_curTarget, _this]] call AH_fnc_adminReq;
			[format['You gave backpack ""%1"" to ""%2 (%3).""', _this, name admin_curTarget, getPlayerUID admin_curTarget], 4] call "+_kfc_msg+";
			format['Gave backpack ""%1"" to ""%2 (%3)""', _this, name admin_curTarget, getPlayerUID admin_curTarget] call AH_fnc_adminLog;
		} else {
			player addBackpack _this;
			call player_forceSave;
			[format['You added ""%1"" to your back.', _this], 4] call "+_kfc_msg+";
			format['Spawned backpack ""%1"" @ %2', _this, mapGridPosition player] call AH_fnc_adminLog;
		};
	};

	admin_spawnEvent = {
		_this = call AH_fnc_removePrefix;
		['SPWN_EVENT', _this] call AH_fnc_adminReq;
		[format['You spawned Epoch Event ""%1.""', _this], 4] call "+_kfc_msg+";
		format['Spawned Epoch Event ""%1"" @ %2', _this, mapGridPosition player] call AH_fnc_adminLog;
	};

	admin_spawnMag = {
		if (admin_targetSpawn && {isNull admin_curTarget}) exitWith {['No target selected!', 2] call "+_kfc_msg+"};
		['Spawning Magazine', 'Amount:', format[""
			local _qty = parseNumber(ctrlText 1400);
			if (_qty == 0) then {_qty = 1};

			if (admin_targetSpawn) then {
				['MAG_GIVE', [admin_curTarget, _qty, %1]] call AH_fnc_adminReq;
				admin_curTarget = name admin_curTarget + ' ' + '('+getPlayerUID admin_curTarget+')';
				['You gave '+str _qty+' '+str %1+' to '+str admin_curTarget+'.', 4] call "+_kfc_msg+";
				'Gave '+str _qty+' '+str %1+' to '+str admin_curTarget+' @ '+mapGridPosition player+'' call AH_fnc_adminLog;
				admin_curTarget = nil;
			} else {
				for '_x' from 1 to _qty do {player addMagazine %1};
				call player_forceSave;
				['Added '+str _qty+' '+str %1+' to your inventory.', 4] call "+_kfc_msg+";
				'Added '+str _qty+' '+str %1+' to their inventory @ '+mapGridPosition player+'' call AH_fnc_adminLog;
			};
		"", str _this], 'Spawn', format['Magazine: %1', _this], ''] call AH_fnc_display;
	};

	admin_spawnMission = {
		_this = call AH_fnc_removePrefix;
		['SPWN_WAI', [_this, admin_waibandit]] call AH_fnc_adminReq;
		[format['You spawned %1 mission ""%2.""', if (admin_waibandit) then {'Bandit'} else {'Hero'}, _this], 4] call "+_kfc_msg+";
		format['Spawned %1 mission ""%2"" @ %3', if (admin_waibandit) then {'Bandit'} else {'Hero'}, _this, mapGridPosition player] call AH_fnc_adminLog;
	};

	admin_spawnSafe = {
		if (!DZE_permanentPlot) exitWith {['This feature currently requires that DZE_permanentPlot be enabled.', 2] call "+_kfc_msg+"};
		local _target = call AH_fnc_getTarget;
		if (isNull _target) exitWith {['Please select the target that will own the safe!', 2] call "+_kfc_msg+"};

		_this = call AH_fnc_removePrefix;

		local _pos = [player] call FNC_getPos;
		local _dir = (getDir player);
		_pos = [(_pos select 0) + 3 * sin(_dir), (_pos select 1) + 3 * cos(_dir), _pos select 2];

		local _combo = format['%1%2%3%4', floor(random 10), floor(random 10), floor(random 10), floor(random 10)];

		local _arrow = 'Sign_arrow_down_large_EP1' createVehicleLocal _pos;
		['VaultStorageLocked', _arrow] call fn_waitForObject;

		['SPWN_VAULT', [_combo, _this, [_dir, _pos, getPlayerUID _target]]] call AH_fnc_adminReq;
		[format['You spawned a ""%1"" nearby.', _this], 4] call "+_kfc_msg+";
		format['Spawned a ""%1"" @ %2', _this, mapGridPosition player] call AH_fnc_adminLog;
	};

	admin_spawnVeh = {
		if (vehicle player != player) exitWith {['You cannot spawn vehicles while you are in a vehicle.', 2] call "+_kfc_msg+";};
		local _pos = [player] call fnc_getPos;
		local _dir = getDir player;

		_pos = [(_pos select 0) + 5 * sin(_dir), (_pos select 1) + 5 * cos(_dir), (_pos select 2) + 1];

		local _arr = 'Sign_arrow_down_large_EP1' createVehicleLocal _pos;
		[_this, _arr] call fn_waitForObject;

		if (admin_tempSpawn) then {
			['VEH_TMPSPAWN', [toArray _this, _pos, _dir]] call AH_fnc_adminReq;
			[format['You spawned temporary vehicle ""%1"" nearby.', _this], 4] call "+_kfc_msg+";
			format['Spawned a temporary ""%1"" @ %2', _this, mapGridPosition player] call AH_fnc_adminLog;
		} else {
			local _key = call epoch_generateKey;
			PVDZE_veh_Publish2 = [[0, _pos], _this, if (_this isKindOf 'Bicycle') then {true} else {false}, if (_this isKindOf 'Bicycle') then {'0'} else {_key select 1}, player, dayz_authKey];
			publicVariableServer 'PVDZE_veh_Publish2';
			[format['You spawned vehicle ""%1"" nearby.', _this], 4] call "+_kfc_msg+";
			format['Spawned a ""%1"" @ %2', _this, mapGridPosition player] call AH_fnc_adminLog;
		};
	};

	admin_spawnWep = {
		if (admin_targetSpawn && {isNull admin_curTarget}) exitWith {['No target selected!', 2] call "+_kfc_msg+"};
		local _mags = getArray(configFile >> 'CfgWeapons' >> _this >> 'magazines');

		if (admin_targetSpawn) then {
			['WEP_GIVE', [admin_curTarget, _this, if (count _mags > 0) then {_mags select 0} else {'none'}, admin_wmags]] call AH_fnc_adminReq;
			if (admin_wmags && {count _mags > 0}) then {
				[format['You gave one ""%1"" with ammo to ""%2 (%3)"".', _this, name admin_curTarget, getPlayerUID admin_curTarget], 4] call "+_kfc_msg+";
				format['Gave one ""%1"" with ammo to ""%2 (%3)""', _this, name admin_curTarget, getPlayerUID admin_curTarget] call AH_fnc_adminLog;
			} else {
				[format['You gave one ""%1"" to ""%2 (%3)"".', _this, name admin_curTarget, getPlayerUID admin_curTarget], 4] call "+_kfc_msg+";
				format['Gave one ""%1"" to ""%2 (%3)""', _this, name admin_curTarget, getPlayerUID admin_curTarget] call AH_fnc_adminLog;
			};
		} else {
			player addWeapon _this;
			player selectWeapon _this;

			if (admin_wmags && {count _mags > 0}) then {
				for '_x' from 1 to 4 do {player addMagazine (_mags select 0)};
				[format['You added weapon ""%1"" with mags to your inventory.', _this], 4] call "+_kfc_msg+";
				format['Spawned weapon ""%1"" with mags @ %2', _this, mapGridPosition player] call AH_fnc_adminLog;
			} else {
				[format['You added weapon ""%1"" to your inventory.', _this], 4] call "+_kfc_msg+";
				format['Spawned weapon ""%1"" @ %2', _this, mapGridPosition player] call AH_fnc_adminLog;
			};
			call player_forceSave;
		};
	};

	admin_time = {
		_this = call AH_fnc_removePrefix;

		local _hour = call {
			if (_this == '12:00 a.m.') exitWith {0};
			if (_this == '02:00 a.m.') exitWith {2};
			if (_this == '04:00 a.m.') exitWith {4};
			if (_this == '06:00 a.m.') exitWith {6};
			if (_this == '08:00 a.m.') exitWith {8};
			if (_this == '10:00 a.m.') exitWith {10};
			if (_this == '12:00 p.m.') exitWith {12};
			if (_this == '02:00 p.m.') exitWith {14};
			if (_this == '04:00 p.m.') exitWith {16};
			if (_this == '06:00 p.m.') exitWith {18};
			if (_this == '08:00 p.m.') exitWith {20};
			if (_this == '10:00 p.m.') exitWith {22};
		};

		['ENV_TIME', _hour] call AH_fnc_adminReq;

		[format['You adjusted server time to %1', _this], 4] call "+_kfc_msg+";
		format['Adjusted server time to %1', _this] call AH_fnc_adminLog;
	};

	admin_unlock = {
		local _ct = cursorTarget;
		local _type = typeOf _ct;

		if (!isNull _ct && {player distance _ct < 10}) then {
			if (locked _ct || {_type in (DZE_LockedStorage + DZE_DoorsLocked)}) then {
				if (_type in DZE_LockedStorage) then {
					dayz_combination = _ct getVariable ['CharacterID', '0'];
					_ct spawn player_unlockVault;
				};
				if (_type in DZE_DoorsLocked) then {
					{_ct animate [_x, 1]} count ['Open_door', 'Open_latch'];
				};
				if (_type isKindOf 'Air' || {_type isKindOf 'LandVehicle'} || {_type isKindOf 'Ship'}) then {
					[nil, nil, nil, [_ct, 'Admin override']] execVM '\z\addons\dayz_code\actions\unlock_veh.sqf';
				};
				[format['You unlocked target ""%1"".', _type], 4] call "+_kfc_msg+";
				format['Unlocked ""%1"" @ %2', _type, mapGridPosition player] call AH_fnc_adminLog;
			} else {
				['Target is not locked!', 2] call "+_kfc_msg+";
			};
		} else {
			['Target is null!', 2] call "+_kfc_msg+";
		};
	};

	admin_vehicles = {
		if (isNil 'admin_allVehs') then {
			admin_traderVehs = [];
			{
				admin_traderVehs = admin_traderVehs + (_x call AH_fnc_traderItems);
			} count DZE_tradeVehicle;
			if (!admin_limitLists) then {
				admin_allVehs = [];

				local _cfg = configFile >> 'CfgVehicles';
				for '_v' from 0 to (count _cfg)-1 do
				{
					local _veh = _cfg select _v;
					local _type = configName _veh;

					if (isClass _veh && {getNumber(_veh >> 'scope') >= 2} && {getText(_veh >> 'picture') != ''} && {_type isKindOf 'Air' || {_type isKindOf 'LandVehicle'} || {_type isKindOf 'Ship'}}) then {
						admin_allVehs set [count admin_allVehs, _type];
					};
				};
			} else {
				admin_allVehs = admin_traderVehs;
				admin_traderVehs = nil;
			};
			admin_allVehs = [admin_allVehs, [6969, 1501]] call AH_fnc_sortArray;
		};
		if (isNil 'admin_vehMenu') then {
			local _air = [];local _land = [];local _water = [];
			{
				local _clr = if (!admin_limitLists && {_x in admin_traderVehs}) then {[0,1,0,1]} else {[]};
				call {
					if (_x isKindOf 'Air') exitWith {_air set [count _air, [_x, 2, _clr]]};
					if (_x isKindOf 'LandVehicle') exitWith {_land set [count _land, [_x, 2, _clr]]};
					if (_x isKindOf 'Ship') exitWith {_water set [count _water, [_x, 2, _clr]]};
				};
			} count admin_allVehs;

			admin_vehMenu = [
				['===============================================================', 0, []],
				['>> Search', 0, [], admin_search]
			];
			if (!admin_forceTemp) then {admin_vehMenu set [count admin_vehMenu, ['Temporary Spawning', 1, []]]};
			admin_vehMenu = admin_vehMenu + [
				['===============================================================', 0, []],
				['                             Air Vehicles', 0, []]
			] + _air + [
				['===============================================================', 0, []],
				['                             Land Vehicles', 0, []]
			] + _land + [
				['===============================================================', 0, []],
				['                            Water Vehicles', 0, []]
			] + _water + [['', 0, []]];
		};
		admin_vehMenu call AH_fnc_add;
	};

	admin_weapons = {
		if (isNil 'admin_allWeps') then {
			admin_traderWeps = 'trade_weapons' call AH_fnc_traderItems;
			if (!admin_limitLists) then {
				admin_allWeps = [];

				local _cfg = configFile >> 'CfgWeapons';
				for '_w' from 0 to (count _cfg)-1 do
				{
					local _wep = _cfg select _w;
					local _type = configName _wep;

					if (isClass _wep && {getNumber(_wep >> 'scope') >= 2} && {getText(_wep >> 'picture') != ''} && {!isNumber(_wep >> 'keyid') && {isNumber(_wep >> 'type')}}) then {
						if !(['_base', _type] call fnc_inString) then {
							admin_allWeps set [count admin_allWeps, _type];
						};
					};
				};
			} else {
				admin_allWeps = admin_traderWeps;
				admin_traderWeps = nil;
			};
			admin_allWeps = [admin_allWeps, [6969, 1501]] call AH_fnc_sortArray;
		};
		if (isNil 'admin_wepMenu') then {
			local _weapons = [];
			{
				_weapons set [count _weapons, [_x, 3, if (!admin_limitLists && {_x in admin_traderWeps}) then {[0,1,0,1]} else {[]}]];
			} count admin_allWeps;

			admin_wepMenu = [
				['===============================================================', 0, []],
				['>> Search', 0, [], admin_search],
				['Spawn with Mags', 1, []],
				['Target Spawning', 1, []],
				['===============================================================', 0, []],
				['                               Weapons', 0, []]
			] + _weapons + [['', 0, []]];
		};
		admin_wepMenu call AH_fnc_add;
	};

	admin_weather = {
		_this = call AH_fnc_removePrefix;

		local _sky = call {
			if (_this == 'Clear Weather') exitWith {[0,0,0,0,0,0,'OVERCAST',false]};
			if (_this == 'Cloudy Weather') exitWith {[0.5,0,0,0,0,0,'OVERCAST',false]};
			if (_this == 'Rainy Weather') exitWith {[0.8,0,0.25,0,0,0,'OVERCAST',false]};
			if (_this == 'Stormy Weather') exitWith {[1,0,0.5,0,0,0,'OVERCAST',false]};
		};

		['ENV_WEATHER', _sky] call AH_fnc_adminReq;

		[format['You changed the server weather to %1.', toLower _this], 4] call "+_kfc_msg+";
		format['Changed the server weather to %1', toLower _this] call AH_fnc_adminLog;
	};

	[] spawn {
		waitUntil {uiSleep 0.1; (!isNil 'Dayz_loginCompleted' && !isNil '"+_kfc_keys+"')};
		call AH_fnc_initialize;
	};
");
call compile (_kfc_sclnt + " = {" + _AH_Admin + "}");
diag_log (_diag_prefix + "Staff client compiled successfully");

/* ********** Server Code (runs on server only) ********** */

//---Define and start server thread
local _AH_Server = ("
	{
		if (isNil _x) then {call compile (_x + '= [];')};
	} forEach ['at_adminlogs', 'at_hacklogs', 'at_newPlayerlogs', 'at_safeZonelogs', 'at_traderlogs', 'at_lockUnlocklogs', 'at_maintenancelogs', 'at_playerlogs', 'at_surveillancelogs', 'at_deathlogs'];
	"+_kfc_strd_cfg+" = [];
	"+_kfc_strd+" = [] spawn {
		while {69 == 69} do {
			{
				if (diag_tickTime - (_x select 1) >= (_x select 2)) then {
					call (_x select 0); _x set [2, diag_tickTime];
				};
			} count "+_kfc_strd_cfg+";
			uiSleep 0.1;
		};
	};
");
_AH_Server = _AH_Server + ("
	AH_fnc_alertAdmins = {
		local _admins = [];
		local _puid = getPlayerUID _x;
		{
			if (((name _x + _puid) in "+str (_sorted select 4)+") || {_puid in "+str (_sorted select 4)+"}) then {
				_admins set [count _admins, _x];
			};
		} count playableUnits;
		[_admins, _this] call AH_fnc_msg;
	};

	AH_fnc_deleteObj = {
		local _obj = _this select 0;
		local _del = _this select 1;

		local _id = _obj getVariable ['ObjectID', '0'];
		local _uid = _obj getVariable ['ObjectUID', '0'];

		if (_del) then {deleteVehicle _obj};
		local _key = if (parseNumber _id > 0) then {format['CHILD:304:%1:', _id]} else {format['CHILD:310:%1:', _uid]};
		_key call server_hiveWrite;

		['SERVER', 1, format['Deleted object with %1', if (parseNumber _id > 0) then {format['ID: %1', _id]} else {format['UID: %1', _uid]}]] call AH_fnc_log;
	};

	AH_fnc_grammar = {
		local _ret = toArray (toLower _this);
		_ret set [0, (toArray(toUpper(toString [_ret select 0]))) select 0];
		toString _ret
	};
	publicVariable 'AH_fnc_grammar';

	AH_fnc_msg = {
		local _send = _this select 0;
		"+_kfc_msg1+" = toArray (_this select 1);

		if (typeName _send == 'ARRAY') exitWith {
			{
				(owner _x) publicVariableClient '"+_kfc_msg1+"';
			} count _send;
			"+_kfc_msg1+" = nil;
		};
		if (typeName _send == 'STRING') exitWith {
			publicVariable '"+_kfc_msg1+"'; "+_kfc_msg1+" = nil;
		};
		(owner _send) publicVariableClient '"+_kfc_msg1+"';
		"+_kfc_msg1+" = nil;
	};

	AH_fnc_uptime = {
		local _serverTime = if (serverTime > 33666) then {time + 30} else {serverTime};

		local _hours = floor(_serverTime / 60 / 60);
		local _minutes = floor((_serverTime / 60) - (_hours * 60));
		local _seconds = floor(_serverTime - (_hours * 60 * 60) - (_minutes * 60));

		if (_hours < 10) then {
			_hours = '0' + (str _hours);
		};
		if (_minutes < 10) then {
			_minutes = '0' + (str _minutes);
		};
		if (_seconds < 10) then {
			_seconds = '0' + (str _seconds);
		};

		format['%1:%2:%3', _hours, _minutes, _seconds]
	};
	publicVariable 'AH_fnc_uptime';

	AH_fnc_log = {
		local _obj = _this select 0;
		local _opt = _this select 1;
		local _log = _this select 2;

		local _name = ''; local _puid = '';

		if (typeName _log == 'ARRAY') then {_log = toString _log};
		local _id = if (typeName _obj == 'STRING') then {_obj} else {_name = name _obj; _puid = getPlayerUID _obj; format['%1 (%2)', _name, _puid]};

		if (((_name + _puid) in "+str (_sorted select 6)+") || {_puid in "+str (_sorted select 6)+"}) exitWith {};

		if !(_opt in [10,11]) then {_log = format['%1: %2', _id, _log]};
		if ("+str _rptall+") then {
			diag_log format['"+_diag_prefix+"%1', _log];
		} else {
			if (_opt == 1) then {
				diag_log format['"+_diag_prefix+"%1', _log];
			};
		};

		if (_opt > 1) then {
			local _type = call {
				if (_opt == 2) exitWith {
					at_adminlogs set [count at_adminlogs, format['%1: %2', call AH_fnc_uptime, _log]];
					'Admin'
				};
				if (_opt == 3) exitWith {
					at_hacklogs set [count at_hacklogs, format['%1: %2', call AH_fnc_uptime, _log]];
					'Hack'
				};
				if (_opt == 4) exitWith {
					at_safeZonelogs set [count at_safeZonelogs, format['%1: %2', call AH_fnc_uptime, _log]];
					'SafeZone'
				};
				if (_opt == 5) exitWith {
					at_traderlogs set [count at_traderlogs, format['%1: %2', call AH_fnc_uptime, _log]];
					'Trader'
				};
				if (_opt == 6) exitWith {
					at_lockUnlocklogs set [count at_lockUnlocklogs, format['%1: %2', call AH_fnc_uptime, _log]];
					'Lock-Unlock'
				};
				if (_opt == 7) exitWith {
					at_maintenancelogs set [count at_maintenancelogs, format['%1: %2', call AH_fnc_uptime, _log]];
					'Maintenance'
				};
				if (_opt == 8) exitWith {
					at_playerlogs set [count at_playerlogs, format['%1: %2', call AH_fnc_uptime, _log]];
					'Player'
				};
				if (_opt == 9) exitWith {
					at_surveillancelogs set [count at_surveillancelogs, format['%1: %2', call AH_fnc_uptime, _log]];
					'Surveillance'
				};
				if (_opt == 10) exitWith {
					_log call AH_fnc_alertAdmins;
					at_newPlayerlogs set [count at_newPlayerlogs, format['%1: %2', call AH_fnc_uptime, _log]];
					'New-Player'
				};
				if (_opt == 11) exitWith {
					at_deathlogs set [count at_deathlogs, format['%1: %2', call AH_fnc_uptime, _log]];
					'Death'
				};
			};
			'Antihack' callExtension format['Log|%1|%2%3', _type, _log, format[' | Uptime: %1 Map: %2-%3', call AH_fnc_uptime, dayZ_instance, worldName]];
		};
	};

	AH_fnc_ban = {
		local _name = _this select 0;
		local _puid = _this select 1;
		local _log = _this select 2;

		if (typeName _log == 'ARRAY') then {_log = toString _log};

		local _dur = -1; local _why = '';
		local _id = 'AH' + str(100000 + random 899999);

		if (count _this < 4) then {
			_why = format['Antihack Auto-Ban ID: %1', _id];
		} else {
			_dur = _this select 3;
			_why = format['%1 (ID: %2)', _this select 4, _id];
		};

		'Antihack' callExtension format['Ban|%1|%2|%3', _puid, _dur, _why];

		if (count _this > 3) exitWith {};
		_log = format['Banned (ID: %1) for: %2', _id, _log];
		[format['%1 (%2)', _name, _puid], 3, _log] call AH_fnc_log;
	};

	onPlayerConnected {
		if (_name == '__SERVER__') exitWith {};
		[format['%1 (%2)', _name, _uid], 8, 'Connected to the server'] call AH_fnc_log;"); if (_apj) then {_AH_Server = _AH_Server + ("
		['ALL', format['%1 CONNECTED', toUpper _name]] call AH_fnc_msg;");}; _AH_Server = _AH_Server + ("
	};

	"+_kfc_strd_cfg+" set [count "+_kfc_strd_cfg+", [{
		['SERVER', 1, format['FPS: %1 | AI: %2 | Players: %3 | Uptime: %4',
			round diag_fps,
			{!isPlayer _x} count allUnits,
			count playableUnits,
			call AH_fnc_uptime
		]] call AH_fnc_log;
	}, 123, 0]];
");
//---Admin Requests
_AH_Server = _AH_Server + ("
	AH_fnc_procAdminReq = {
		local _pobj = _this select 0;
		local _id = toString(_this select 1);
		local _param = _this select 2;

		local _fnc_getKey = {
			local _target = _this;
			local _key = '';

			local _index = dayz_serverPUIDArray find (getPlayerUID _target);

			if !(_index < 0) then {
				local _check = ((dayz_serverClientKeys select _index) select 0) == (owner _target);
				if (_check) then {
					_key = (dayz_serverClientKeys select _index) select 1;
				};
			};

			_key
		};

		local _fnc_sendRE = {
			local _target = (_this select 1) select 0;
			if (typeName _target == 'STRING') then {{if (name _x + getPlayerUID _x == _target) exitWith {_target = _x}} count playableUnits;};
			local _params = _this;

			local _id = _params select 2;
			_id = toArray _id;
			_params set [2,_id];
			
			_params set [count _params, toArray(_target call _fnc_getKey)];

			"+_kfc_rekey+" = _params;
			(owner _target) publicVariableClient '"+_kfc_rekey+"';

			['SERVER', 1, format['RE request forwarded to player ""%1 (%2)""', name _target, getPlayerUID _target]] call AH_fnc_log;
		};

		if (_id == 'TOG_INVIS') exitWith {
			if (_param) then {_pobj setVehicleInit 'this hideObject true;'} else {_pobj setVehicleInit 'this hideObject false;'};
			processInitCommands;
			clearVehicleInit _pobj;
		};
		if (_id == 'KEY_DEL') exitWith {[_param, true] call AH_fnc_deleteObj};
		if (_id == 'TAR_TP2U') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'TAR_HEAL') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'MAG_GIVE') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'WEP_GIVE') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'BP_GIVE') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'TAR_BANK') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'TAR_WALLET') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'TAR_HUMANITY') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'TAR_AMMO') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'TAR_MOVINVEH') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'TAR_REPAIR') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'TAR_FREEZE') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'TAR_KILL') exitWith {(_param select 0) setDamage 1};
		if (_id == 'TAR_SUICIDE') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'TAR_DISCONNECT') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'TAR_RMGEAR') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'TAR_SENDUP') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'TAR_SENDOCEAN') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'TAR_EJECT') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'TAR_LOADOUT') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'LOG_VIEW') exitWith {
			local _get = call {
				if ((_param select 0) == 'Admin Logs') exitWith {at_adminlogs};
				if ((_param select 0) == 'Hack Logs') exitWith {at_hacklogs};
				if ((_param select 0) == 'New Player Logs') exitWith {at_newPlayerlogs};
				if ((_param select 0) == 'Safe Zone Logs') exitWith {at_safeZonelogs};
				if ((_param select 0) == 'Trader Logs') exitWith {at_traderlogs};
				if ((_param select 0) == 'Lock/Unlock Logs') exitWith {at_lockUnlocklogs};
				if ((_param select 0) == 'Maintenance Logs') exitWith {at_maintenancelogs};
				if ((_param select 0) == 'Player Logs') exitWith {at_playerlogs};
				if ((_param select 0) == 'Surveillance Logs') exitWith {at_surveillancelogs};
				if ((_param select 0) == 'Death Logs') exitWith {at_deathlogs};
			};
			AHPV_Logs = [_param select 0, []];
			{
				if (_forEachIndex >= (_param select 1)) then {
					(AHPV_Logs select 1) set [count (AHPV_Logs select 1), _x];
				};
			} forEach _get;
			(owner _pobj) publicVariableClient 'AHPV_Logs';
		};
		if (_id == 'SPWN_BOX') exitWith {
			local _type = _param select 0;

			local _box = 'DZ_CardboardBox' createVehicle (_param select 1);

			local _id = str ceil(random 8000);
			_box setVariable ['CharacterID', _id, true];
			_box setVariable ['ObjectUID', _id, true];
			_box setVariable ['lastUpdate', diag_ticktime, false];

			clearBackpackCargoGlobal _box;
			clearMagazineCargoGlobal _box;
			clearWeaponCargoGlobal _box;

			dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _box];

			local _toAdd = call {
				if (_type == 'Starter Build Box') exitWith {"+str _starterBox+"};
				if (_type == 'Small Build Box') exitWith {"+str _smallBox+"};
				if (_type == 'Medium Build Box') exitWith {"+str _mediumBox+"};
				if (_type == 'Large Build Box') exitWith {"+str _largeBox+"};
			};

			{
				local _item = _x;
				local _amount = 1;

				if (typeName _item == 'ARRAY') then {
					_item = _x select 0;
					_amount = _x select 1;
				};

				call {
					if (isClass(configFile >> 'CfgWeapons' >> _item)) exitWith {_box addWeaponCargoGlobal [_item, _amount]};
					if (isClass(configFile >> 'CfgMagazines' >> _item)) exitWith {_box addMagazineCargoGlobal [_item, _amount]};
					if (isClass(configFile >> 'CfgVehicles' >> _item)) exitWith {_box addBackpackCargoGlobal [_item, _amount]};
				};
			} count _toAdd;
		};
		if (_id == 'SPWN_VAULT') exitWith {
			comment 'Spawns a safe with supplied contents. Safe is persistent and the owner is set to the supplied target';
			
			local _combo = _param select 0;
			local _type = _param select 1;
			local _pos = _param select 2;

			local _safe = 'VaultStorageLocked' createVehicle [0,0,0];
			_safe setPosATL (_pos select 1);
			_safe setDir (_pos select 0);

			local _uid = _pos call dayz_objectUID2;

			_safe setVariable ['OEMPos', _pos select 1, true];
			_safe setVariable ['memDir', _pos select 0, true];
			_safe setVariable ['ObjectUID', _uid, true];
			_safe setVariable ['CharacterID', _combo, true];
			_safe setVariable ['ownerPUID', _pos select 2, true];

			_safe enableSimulation false;
			dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _safe];

			local _toAdd = call {
				if (_type == 'Starter Build Safe') exitWith {"+str _starterSafe+"};
				if (_type == 'Small Build Safe') exitWith {"+str _smallSafe+"};
				if (_type == 'Medium Build Safe') exitWith {"+str _mediumSafe+"};
				if (_type == 'Large Build Safe') exitWith {"+str _largeSafe+"};
			};

			local _inventory = [];

			local _weapons = [[],[]];
			local _magazines = [[],[]];
			local _backpacks = [[],[]];
			{
				local _item = _x;
				local _amount = 1;

				if (typeName _item == 'ARRAY') then {
					_item = _x select 0;
					_amount = _x select 1;
				};

				call {
					if (isClass(configFile >> 'CfgWeapons' >> _item)) exitWith {
						if !(_item in (_weapons select 0)) then {
							(_weapons select 0) set [count (_weapons select 0), _item];
							(_weapons select 1) set [count (_weapons select 1), _amount];
						};
					};
					if (isClass(configFile >> 'CfgMagazines' >> _item)) exitWith {
						if !(_item in (_magazines select 0)) then {
							(_magazines select 0) set [count (_magazines select 0), _item];
							(_magazines select 1) set [count (_magazines select 1), _amount];
						};
					};
					if (isClass(configFile >> 'CfgVehicles' >> _item)) exitWith {
						if !(_item in (_backpacks select 0)) then {
							(_backpacks select 0) set [count (_backpacks select 0), _item];
							(_backpacks select 1) set [count (_backpacks select 1), _amount];
						};
					};
				};
			} count _toAdd;

			{
				_inventory set [count _inventory, _x];
			} count [_weapons, _magazines, _backpacks];

			_safe setVariable ['WeaponCargo', _weapons, false];
			_safe setVariable ['MagazineCargo', _magazines, false];
			_safe setVariable ['BackpackCargo', _backpacks, false];

			local _key = str formatText['CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:', dayZ_instance, 'VaultStorageLocked', 0, _combo, _pos call AN_fnc_formatWorldspace, _inventory, [], 0, _uid];
			_key call server_hiveWrite;
		};
		if (_id == 'ENV_TIME') exitWith {
			AH_timeOverride = _param;
			dayzSetDate = [2012, 8, 2, _param, 1];
			dayz_storeTimeDate = [2012, 8, 2, _param, 1];
			publicVariable 'dayzSetDate';
			setDate dayzSetDate;
		};
		if (_id == 'ENV_WEATHER') exitWith {
			PVDZE_SetWeather = _param;
			publicVariable 'PVDZE_SetWeather';
		};
		if (_id == 'TOOL_KILLAI') exitWith {
			local _cnt = 0;
			{
				if (!isPlayer _x && {_x distance _pobj <= _param}) then {
					_x setDamage 1; _cnt = _cnt + 1;
				};
			} count allUnits;
			[_pobj, 2, format['Deleted %1 AI within %2 meter(s) of %3', _cnt, _param, mapGridPosition _pobj]] call AH_fnc_log;
		};
		if (_id == 'MENU_ADJUST') exitWith {[_pobj, _param, _id] call _fnc_sendRE};
		if (_id == 'VEH_TMPSPAWN') exitWith {
			comment 'Spawns a temporary vehicle (not saved to the database)';
			local _veh = toString(_param select 0);
			local _pos = _param select 1;
			local _dir = _param select 2;

			_veh = _veh createVehicle _pos;
			_veh setDir _dir;

			dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _veh];

			_veh setVariable ['ObjectID', '0', true];
			_veh setVariable ['ObjectUID', '0', true];

			clearWeaponCargoGlobal _veh;
			clearMagazineCargoGlobal _veh;

			_veh call fnc_veh_ResetEH;
			PVDZE_veh_Init = _veh;
			publicVariable 'PVDZE_veh_Init';
		};
		if (_id == 'SPWN_EVENT') exitWith {
			[] execVM '\z\addons\dayz_server\modules\' + _param + '.sqf';
		};
		if (_id == 'MENU_CODE') exitWith {
			if ((_param select 1) == 1) then {
				call compile toString(_param select 0);
				[_pobj, 2, format['Executed the following code on the server: %1', toString(_param select 0)]] call AH_fnc_log;
			} else {
				local _re = 'HeliHEmpty' createVehicle [100000,100000,100000];
				_re setVehicleInit str formatText['%1', toString(_param select 0)];
				processInitCommands; deleteVehicle _re;
				[_pobj, 2, format['Executed the following code globally: %1', toString(_param select 0)]] call AH_fnc_log;
			};
		};
"); if (_wai) then {_AH_Server = _AH_Server + ("
		if (_id == 'SPWN_WAI') exitWith {
			comment 'Spawns WAI mission as selected by admin';
			local _type = [];
			if (_param select 1) then {
				h_missionsrunning = h_missionsrunning + 1;
				wai_h_starttime = diag_tickTime;
				wai_mission_markers set [(count wai_mission_markers), ('MainHero' + str(count wai_mission_data))];
				_type = ['MainHero','Bandit'];
			} else {
				b_missionsrunning = b_missionsrunning + 1;
				wai_b_starttime = diag_tickTime;
				wai_mission_markers set [(count wai_mission_markers), ('MainBandit' + str(count wai_mission_data))];
				_type = ['MainBandit','Hero'];
			};
			wai_mission_data = wai_mission_data + [[0,[],[],[],[],[],[]]];
			_type execVM format ['\z\addons\dayz_server\WAI\missions\missions\%1.sqf', _param select 0];
		};")}; _AH_Server = _AH_Server + ("
	};
");
//---Safe Zones
if (_safezones) then {
	if (_bubbles) then {
		_AH_Server = _AH_Server + ("
			local _cnt = 0;
			{
				local _pos = _x select 0;
				local _rad = _x select 1;

				for '_i' from 0 to 360 step (1440 / _rad) do
				{
					local _loc = [(_pos select 0) + ((cos _i) * _rad), (_pos select 1) + ((sin _i) * _rad), 0];
					local _obj = 'Sign_sphere100cm_EP1' createVehicle [0,0,0];
					_obj setPosATL _loc;
					_cnt = _cnt + 1;
				};
			} count DZE_SafeZonePosArray;
			['SERVER', 1, format['Created %1 safe zone bubbles', _cnt]] call AH_fnc_log;
		");
	};
	if (_antized) then {
		_AH_Server = _AH_Server + ("
			"+_kfc_strd_cfg+" set [count "+_kfc_strd_cfg+", [{
				local _cnt = 0;
				{
					local _zed = _x;
					{
						if (_zed distance (_x select 0) <= (_x select 1)) then {deleteVehicle _zed; _cnt = _cnt + 1};
					} forEach DZE_SafeZonePosArray;
				} count (entities 'zZombie_Base');
				if (_cnt < 1) exitWith {};
				['SERVER', 1, format['Deleted %1 zombies from safe zones', _cnt]] call AH_fnc_log;
			}, 3.3, 0]];
		");
	};
	if (_antiai) then {
		_AH_Server = _AH_Server + ("
			"+_kfc_strd_cfg+" set [count "+_kfc_strd_cfg+", [{
				local _cnt = 0;
				{
					local _ai = _x;
					{
						if (!isPlayer _ai && {_ai distance (_x select 0) <= (_x select 1)}) then {_ai setDamage 1; _cnt = _cnt + 1};
					} forEach DZE_SafeZonePosArray;
				} count allUnits;
				if (_cnt < 1) exitWith {};
				['SERVER', 1, format['Deleted %1 AI from safe zones', _cnt]] call AH_fnc_log;
			}, 3.3, 0]];
		");
	};
};
//---Voting
if ("day/night" in _chatcmds) then {
	_AH_Server = _AH_Server + ("
		AH_fnc_vote = {
			local _vote = _this select 0;
			local _pobj = _this select 1;
			local _puid = getPlayerUID _pobj;

			local _time = diag_tickTime - AH_lastVote;
			if (_time < "+str _votedelay+") exitWith {
				[_pobj, format['Please wait %1 second(s) before a vote can be held.', round("+str _votedelay+" - _time)]] call AH_fnc_msg;
			};

			if (isNil 'AH_voteInit') then {
				AH_voteInit = -1;
				"+_kfc_strd_cfg+" set [count "+_kfc_strd_cfg+", [{
					if (AH_voteInit < 0) exitWith {};
					if (diag_tickTime - AH_voteInit >= "+str _votetime+") then {
						['All', 'Vote time limit reached - required number of total votes not met.'] call AH_fnc_msg;
						AH_voteInit = -1; AH_votes = []; AH_lastVote = diag_tickTime;
					};
				}, 4.3, 0]];
			};

			if (AH_voteInit < 0) then {
				AH_voteInit = diag_tickTime;
				['All', 'Day/Night voting initialized, cast your vote now!'] call AH_fnc_msg;
			};

			if (isNil 'AH_votes') then {AH_votes = []};
			if (_puid in AH_votes) exitWith {
				[_pobj, 'You have already cast a vote!'] call AH_fnc_msg;
			};

			{AH_votes set [count AH_votes, _x]} count [_vote, _puid];

			[_pobj, 9, format['Cast their vote for %1', if (_vote == 0) then {'night'} else {'day'}]] call AH_fnc_log;

			local _needed = round((count playableUnits) * "+str _votepercent+");
			local _total = {typeName _x == 'SCALAR'} count AH_votes;
			local _day = {str _x == '1'} count AH_votes;
			local _night = {str _x == '0'} count AH_votes;

			['All', format['Current vote tally: %1 Day | %2 Night', _day, _night]] call AH_fnc_msg;

			if (_total < _needed) exitWith {};

			['All', format['The votes have been tallied! Results: %1 Day | %2 Night', _day, _night]] call AH_fnc_msg;

			local _hour = call {
				if (_day > _night) exitWith {12};
				if (_night > _day) exitWith {0};
				if (_day == _night) exitWith {
					local _rnd = [0,12] call BIS_fnc_selectRandom;
					['All', format['The vote was equally divided - server chose %1.', if (_rnd > 0) then {'day'} else {'night'}]] call AH_fnc_msg;
					_rnd
				};
			};

			AH_timeOverride = _hour;

			dayzSetDate = [2012,8,2,_hour,1];
			dayz_storeTimeDate = [2012,8,2,_hour,1];
			publicVariable 'dayzSetDate';
			setDate dayzSetDate;

			AH_votes = [];
			AH_voteInit = -1;
			AH_lastVote = diag_tickTime;
		};
	");
};
//---Wait before loading certain items
_AH_Server = _AH_Server + ("
	[] spawn {
		waitUntil {initialized};
		AH_lastVote = diag_tickTime;");
		if (_safezones) then {_AH_Server = _AH_Server + ("
			fnc_veh_handleDam1 = fnc_veh_handleDam;
			fnc_veh_handleDam = {
				if ({(_this select 0) distance (_x select 0) <= (_x select 1)} count DZE_SafeZonePosArray > 0 || {(_this select 0) getVariable ['"+_kfc_sz+"', false]}) exitWith {0};
				_this call fnc_veh_handleDam1;
			};
		")}; _AH_Server = _AH_Server + ("
		onPlayerDisconnected {
			[_uid,_name] call server_onPlayerDisconnect;
			[format['%1 (%2)', _name, _uid], 8, 'Disconnected from the server'] call AH_fnc_log;");if (_apj) then {_AH_Server = _AH_Server + ("
			['ALL', format['%1 DISCONNECTED', toUpper _name]] call AH_fnc_msg;");}; _AH_Server = _AH_Server + ("
		};
		server_tradeObj1 = server_tradeObj;
		server_tradeObj = {
			_this call server_tradeObj1;

			local _bors = _this select 2;
			local _curr = _this select 5;
			local _cost = _this select 6;

			if (typeName _curr == 'STRING') then {_cost = format['%1 %2', _cost, _curr]};

			local _qty = 1; local _cont = 'gear';
			if (count _this > 7) then {
				_qty = _this select 7;
				_cont = _this select 8;
			};

			local _log = format['%1 %2 ""%3"" %4 %5 @ %6 for %7', if (_bors == 0) then [{'Purchased'}, {'Sold'}], _qty, _this select 3, if (_bors == 0) then [{'into'}, {'from'}], _cont, _this select 4, _cost];
			[_this select 0, 5, _log] call AH_fnc_log;
		};
		local_lockUnlock = {
			local _veh = _this select 0;
			local _lock = if (_this select 1) then {'LOCKED'} else {'UNLOCKED'};

			if (local _veh) then {
				_veh setVehicleLock _lock;
				['SERVER', 6, format['%1 ""%2"" @ %3', _lock call AH_fnc_grammar, typeOf _veh, mapGridPosition _veh]] call AH_fnc_log;
			};
		};
		server_handleSafeGear1 = server_handleSafeGear;
		server_handleSafeGear = {
			_this call server_handleSafeGear1;

			local _obj = _this select 1;
			local _status = _this select 2;

			local _fnc_lockCode = {
				if (_this == '') exitWith {0};

				local _code = if (typeName _this == 'STRING') then {parseNumber _this} else {_this};
				if (_code < 10000 || {_code > 10299}) exitWith {0};

				local _color = '';
				_code = _code - 10000;

				if (_code <= 99) then {_color = 'Red';};
				if (_code >= 100 && _code <= 199) then {_color = 'Green'; _code = _code - 100;};
				if (_code >= 200) then {_color = 'Blue'; _code = _code - 200;};
				if (_code <= 9) then {_code = format['0%1', _code];};
				_code = format ['%1%2',_color,_code];

				_code
			};

			local _charID = _obj getVariable ['CharacterID', '0'];
			local _code = _charID;

			if (count _this > 3) then {
				_sent = _this select 3;
				if (_status != 3 && {_status != 6}) then {_code = _sent};
			};

			local _type = typeOf _obj;
			_type = call {
				if (_type == 'VaultStorage' || {_type == 'VaultStorageLocked'}) exitWith {'Safe'};
				if (_type == 'LockboxStorage' || {_type == 'LockboxStorageLocked'}) exitWith {
					_code = _charID call _fnc_lockCode;
					if (_status == 3) then {_sent = _sent call _fnc_lockCode};
					'LockBox'
				};
				_type
			};

			local _txt = switch (_status) do {
				case 0: {'UNLOCKED'};
				case 1: {'LOCKED'};
				case 2: {'PACKED'};
				case 3: {'FAILED unlocking'};
				case 4: {'LOCKED'};
				case 5: {'UNLOCKED'};
				case 6: {'FAILED unlocking'};
			};

			local _log = format['%1 a %2 located @ %3 and owned by UID: %4 - Correct Code: %5',
				_txt call AH_fnc_grammar,
				_type,
				mapGridPosition (_obj getVariable ['OEMPos', getPosATL _obj]),
				_obj getVariable ['ownerPUID', '0'],
				_code,
				if (count _this > 3) then {format[' - Code Given: %1', _sent]}
			];
			[_this select 0, 6, _log] call AH_fnc_log;
		};
		server_maintainArea1 = server_maintainArea;
		server_maintainArea = {
			_this call server_maintainArea1;

			local _pobj = _this select 0;
			local _objs = _this select 2;

			local _log = if ((_this select 1) == 1) then {
				format['Maintained %1 objects located @ %2', count _objs, mapGridPosition _pobj];
			} else {
				format['Maintained ""%1"" located @ %2', typeOf(_objs select 0), mapGridPosition _pobj];
			};
			[_pobj, 7, _log] call AH_fnc_log;
		};
		server_playerDied1 = server_playerDied;
		server_playerDied = {
			local _pname = toString(_this select 4);
			local _sname = toString(_this select 6);
			local _wep = _this select 7;
			local _dis = _this select 8;
			local _why = _this select 9;
			local _param = [];

			['', 11, format['%1 (%2) died at %3', _pname, _this select 3, mapGridPosition (getPosATL (_this select 2))]] call AH_fnc_log;

			local _suicide = _sname == _pname || {_why == 'suicide'};

			if (_why in ['explosion','melee','shot','shothead','shotheavy','suicide'] && {!(_why == 'explosion' && {_suicide or _sname == 'unknown'})}) then {
				if (_suicide) then {
					_param = ['suicide', _pname];
				} else {
					if (_wep == '') then {_wep = 'unknown weapon'};
					_param = ['killed', _pname, _sname, _wep, _dis];
				};
			} else {
				_param = ['died', _pname, _why];
			};

			if (_pname != 'unknown' || {_sname != 'unknown'}) then {
				local _type = _param select 0;

				if (_type == 'killed' && {_sname == 'AI'}) then {
					_param set [2, localize 'STR_PLAYER_AI'];
				};

				_param = switch _type do
				{
					case 'died': {format [localize 'str_player_death_died', _pname, localize format['str_death_%1', _param select 2]]};
					case 'killed': {format [localize 'str_player_death_killed', _pname, _param select 2, _param select 3, _param select 4]};
					case 'suicide': {format [localize 'str_player_death_suicide', _pname]};
				};

				['', 11, _param] call AH_fnc_log;
			};

			_this call server_playerDied1;
		};"); if (_bvc) then {_AH_Server = _AH_Server + ("
		if (isNil 'serverTraders') exitWith {
			['SERVER', 1, 'Bad vehicle check exiting! serverTraders variable does not exist! Trader file moved!'] call AH_fnc_log;
		};
		DZE_tradeVehicle = ['trade_any_vehicle','trade_any_vehicle_free','trade_any_vehicle_old','trade_any_bicycle','trade_any_bicycle_old','trade_any_boat','trade_any_boat_old'];
		local _fn_traderVehs = {
			local _arr = [];
			{
				local _cat = format['menu_%1', _x];
				if (!isNil _cat) then {
					_cat = (call compile _cat) select 0;
					{_arr set [count _arr, _x]} count _cat;
				} else {
					['SERVER', 1, format['NPC class ""%1"" does not have an associated trader menu. Please remove from serverTraders array.', _x]] call AH_fnc_log;
				};
			} forEach serverTraders;

			local _ret = [];
			{
				local _inv = missionConfigFile >> 'CfgTraderCategory' >> format['Category_%1', _x select 1];
				if (isNumber(_inv >> 'duplicate')) then {
					_inv = missionConfigFile >> 'CfgTraderCategory' >> format['Category_%1', getNumber(_inv >> 'duplicate')];
				};

				for '_i' from 0 to (count _inv)-1 do
				{
					local _item = configName(_inv select _i);
					local _type = getText(_inv >> _item >> 'type');

					if (_type == _this && {!(_item in _ret)}) then {
						_ret set [count _ret, _item];
					};
				};
			} count _arr;

			_ret
		};

		if (isNil 'AH_allowedVehs') then {AH_allowedVehs = []};
		{
			AH_allowedVehs = AH_allowedVehs + (_x call _fn_traderVehs);
		} count DZE_tradeVehicle;
		AH_allowedVehs = AH_allowedVehs + "+str _vehWhiteList+";

		AH_allowedVehs1 = AH_allowedVehs; AH_allowedVehs = [];
		{
			AH_allowedVehs set [count AH_allowedVehs, toLower _x];
		} count AH_allowedVehs1;
		AH_allowedVehs1 = nil;

		"+_kfc_strd_cfg+" set [count "+_kfc_strd_cfg+", [{
			if (isNil 'allowConnection') exitWith {};
			local _arr = entities 'Air' + entities 'LandVehicle' + entities 'Ship';
			{
				local _type = typeOf _x;
				if (!(toLower _type in AH_allowedVehs) && {!(toLower(getText(configFile >> 'CfgVehicles' >> _type >> 'original')) in AH_allowedVehs)} && {!(_type in DZE_safeVehicle)} && {!(_type isKindOf 'StaticWeapon')} && {!(['Parachute', _type] call fnc_inString)}) then {
					local _veh = _x; local _plrs = [];
					{
						local _dis = _x distance _veh;
						if (_dis < 100) then {
							_plrs set [count _plrs, format['%1 (%2) [%3m]', name _x, getPlayerUID _x, round _dis]];
						};
					} count playableUnits;

					['SERVER', 3, format['Deleted unauthorized vehicle ""%1"" @ %2 - nearby players: %3', _type, mapGridPosition _veh, _plrs]] call AH_fnc_log;
					[_veh, true] call AH_fnc_deleteObj; comment 'Must go below the log so we can pull the mapGridPosition of the vehicle while it exists';
				};
			} count _arr;
		}, 15.3, 0]];")}; _AH_Server = _AH_Server + ("
	};
");
//---Mission Check
if (_mic) then {_AH_Server = _AH_Server + ("
	[] spawn {
		local _counts = [];
		['SERVER', 1, 'Processing mission files...'] call AH_fnc_log;
		{
			local _arr = []; for '_i' from 0 to 128 do {_arr set [_i, 0]};
			local _file = toArray(preprocessFile _x);

			{_x = _x min 128; _arr set [_x, ((_arr select _x) mod 100) + _forEachIndex]} forEach _file;
			_arr set [128, 0];
			
			_counts set [count _counts, _arr];
		} count "+str _missionFiles+";
		['SERVER', 1, 'Mission files processed successfully'] call AH_fnc_log;
		"+_kfc_mic+" = _counts; publicVariable '"+_kfc_mic+"';
	};
")};
//---Antihack server PVEH
_AH_Server = _AH_Server + ("
	AH_fnc_pveh = {
		local _fnc = toString (_this select 0);
		local _prm = _this select 1;
		local _plr = _this select 2;

		if (_fnc == 'LOG') exitWith {[_plr, _prm select 1, _prm select 0] call AH_fnc_log};
		if (_fnc == 'BAN') exitWith {_prm call AH_fnc_ban};
		if (_fnc == 'VOTE') exitWith {[_prm, _plr] call AH_fnc_vote};
		if (_fnc == "+str (toUpper _kfc_akey)+") exitWith {[_plr, _prm select 0, _prm select 1] call AH_fnc_procAdminReq};
	};
	'AHPV_"+_kfc_pveh+"' addPublicVariableEventHandler {(_this select 1) call AH_fnc_pveh; AHPV_"+_kfc_pveh+" = nil};
");
//---Sends appropriate clients to players
_AH_Server = _AH_Server + ("
	"+_kfc_re+" = {
		local _re = 'HeliHEmpty' createVehicle [0,0,0];
		_re setVehicleInit str formatText['if (isServer) exitWith {}; if (isNil "+str _kfc_got+") then {"+_kfc_got+" = true; call %1};', "+_kfc_gclnt+"];
		_re setVariable ["+str _kfc_re+", true];
		processInitCommands;
	};

	'"+_kfc_get+"' addPublicVariableEventHandler {
		local _pobj = _this select 1;

		local _name = name _pobj;
		local _puid = getPlayerUID _pobj;

		if (((_name + _puid in ("+str _sorted+" select 4)) || {_puid in ("+str _sorted+" select 4)}) && {!((_name + _puid) in ("+str _sorted+" select 8))}) then {
			"+_kfc_get+" = "+_kfc_sclnt+";
			['SERVER', 1, format['Staff client sent to %1 (%2)', _name, _puid]] call AH_fnc_log;
		} else {
			"+_kfc_get+" = "+_kfc_nclnt+";
			['SERVER', 1, format['Normal client sent to %1 (%2)', _name, _puid]] call AH_fnc_log;
			"+_kfc_info+" = [_name, _puid]; (owner _pobj) publicVariableClient '"+_kfc_info+"';
		};
		if (_puid in "+str _headless+") exitWith {"+_kfc_get+" = {"+_kfc_msg+" = nil; terminate "+_kfc_gtrd+"}};

		(owner _pobj) publicVariableClient '"+_kfc_get+"';
	};

	call "+_kfc_re+";
	"+_kfc_strd_cfg+" set [count "+_kfc_strd_cfg+", [{
		if ({_x getVariable ["+str _kfc_re+", false]} count ([0,0,0] nearObjects ['HeliHEmpty', 100]) > 0) exitWith {};
		call "+_kfc_re+";
		['SERVER', 3, 'Antihack RE deleted by hacker! A new RE has been created. Fix BE filters to prevent!'] call AH_fnc_log;
	}, 1, 0]];
");

call compile _AH_Server;
diag_log (_diag_prefix + "Server code compiled successfully");
diag_log (_diag_prefix + "Epoch Antihack/Admin Tools Initialized");

/* ******************************************************* */
/* ******************************************************* */
/* ******************************************************* */
/* ******************************************************* */
