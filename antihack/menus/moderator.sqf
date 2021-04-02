/* ******************************************************* */
/*             Created for the Epoch Community             */
/*                By BigEgg and Movinggun                  */
/* ******************************************************* */

_AH_Admin = _AH_Admin + ("
	_keys = ['Delete','Unlock','Lock','Generate'];

	comment ('
		Execute: Allows the admin to press F8 and execute antihack\test.sqf in their game files
		Delete: Allows the admin to press DEL and deleted objects
		Unlock: Allows the admin to press 1 and unlock targets
		Lock: Allows the admin to press 2 and lock targets
		Info: Allows the admin to press I and get information on a target
		Generate: Allows the admin to press U and generate a key for a vehicle
	');

	admin_limitLists = true; comment 'If true, the admin can only spawn items that are in server traders';
	admin_adjblood = false; comment 'If true, the admin can adjust the blood of a target through the info panel';
	admin_adjhumanity = false; comment 'If true, the admin can adjust the humanity of a target through the info panel';
	admin_adjcoins = false; comment 'If true, the admin can adjust the wallet of a target through the info panel';
	admin_adjbank = false; comment 'If true, the admin can adjust the bank of a target through the info panel';
	admin_forceTemp = true; comment 'If true, the admin cannot spawn permanent vehicles';

	_main set [count _main, ['===============================================================', 0, []]];
	_main set [count _main, ['                            Toggle Scripts', 0, []]];
	_main set [count _main, ['Protection:', 0, []]];
	_main set [count _main, ['    No Zombie Aggro', 1, []]];
	_main set [count _main, ['', 0, []]];
	_main set [count _main, ['Special Abilities:', 0, []]];
	_main set [count _main, ['    Player ESP', 1, []]];
	_main set [count _main, ['', 0, []]];
	_main set [count _main, ['Map Markers:', 0, []]];
	_main set [count _main, ['    Animal Markers', 1, []]];
	_main set [count _main, ['    Body Markers', 1, []]];
	_main set [count _main, ['    Player Markers', 1, []]];
	_main set [count _main, ['===============================================================', 0, []]];
	_main set [count _main, ['                                  Tools', 0, []]];
	_main set [count _main, ['>> Cache Toggle Configuration', 0, [], admin_cache]];
	_main set [count _main, ['>> Copy Coords to Chat', 0, [], admin_coords]];
	_main set [count _main, ['>> Remove Camo Nets', 0, [], admin_nets]];
	_main set [count _main, ['>> Remove Plot Poles', 0, [], admin_poles]];
	_main set [count _main, ['', 0, []]];

	_targ set [count _targ, ['===============================================================', 0, []]];
	_targ set [count _targ, ['                            Target Actions', 0, []]];
	if (Z_SingleCurrency) then {
		_targ set [count _targ, ['>> Adjust Target Bank', 6, []]];
		_targ set [count _targ, ['>> Adjust Target Wallet', 6, []]];
		_targ set [count _targ, ['', 0, []]];
	};
	_targ set [count _targ, ['Friendly:', 0, [0.118,0.565,1,1]]];
	_targ set [count _targ, ['    >> Heal Target', 6, [0.118,0.565,1,1]]];
	_targ set [count _targ, ['    >> Repair Target Vehicle', 6, [0.118,0.565,1,1]]];
	_targ set [count _targ, ['', 0, []]];
	_targ set [count _targ, ['Malicious:', 0, [1,0,0,1]]];
	_targ set [count _targ, ['    >> Disconnect Target', 6, [1,0,0,1]]];
	_targ set [count _targ, ['    >> Eject Target', 6, [1,0,0,1]]];
	_targ set [count _targ, ['    >> Remove Target Gear', 6, [1,0,0,1]]];

	_logs set [count _logs, ['===============================================================', 0, []]];
	_logs set [count _logs, ['                      Select which Logs to View', 0, []]];
	_logs set [count _logs, ['>> Death Logs', 7, []]];
	_logs set [count _logs, ['>> Hack Logs', 7, []]];
	_logs set [count _logs, ['>> Maintenance Logs', 7, []]];
	_logs set [count _logs, ['>> New Player Logs', 7, []]];
	_logs set [count _logs, ['>> Player Logs', 7, []]];
	_logs set [count _logs, ['>> Surveillance Logs', 7, []]];

	_spwn set [count _spwn, ['===============================================================', 0, []]];
	_spwn set [count _spwn, ['                             Spawn Boxes', 0, []]];
	_spwn set [count _spwn, ['>> Starter Build Box', 9, []]];
	_spwn set [count _spwn, ['===============================================================', 0, []]];
	_spwn set [count _spwn, ['                             Spawn Safes', 0, []]];
	_spwn set [count _spwn, ['>> Starter Build Safe', 10, []]];

	admin_menus = [
		['Main Menu', _main],
		['Log Menu', _logs],
		['Spawn Menu', _spwn],
		['Target Menu', _targ],
		['Vehicle Menu', admin_vehicles]
	];
");