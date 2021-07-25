/* ******************************************************* */
/*             Created for the Epoch Community             */
/*                By BigEgg and Movinggun                  */
/* ******************************************************* */

_AH_Admin = _AH_Admin + ("
	_keys = ['Execute','Delete','Unlock','Lock','Info','Generate'];

	comment ('
		Execute: Allows the admin to press F8 and execute antihack\test.sqf in their game files
		Delete: Allows the admin to press DEL and deleted objects
		Unlock: Allows the admin to press 1 and unlock targets
		Lock: Allows the admin to press 2 and lock targets
		Info: Allows the admin to press I and get information on a target
		Generate: Allows the admin to press U and generate a key for a vehicle
	');

	admin_limitLists = false; comment 'If true, the admin can only spawn items that are in server traders';
	admin_adjblood = true; comment 'If true, the admin can adjust the blood of a target through the info panel';
	admin_adjhumanity = true; comment 'If true, the admin can adjust the humanity of a target through the info panel';
	admin_adjcoins = true; comment 'If true, the admin can adjust the wallet of a target through the info panel';
	admin_adjbank = true; comment 'If true, the admin can adjust the bank of a target through the info panel';
	admin_forceTemp = false; comment 'If true, the admin cannot spawn permanent vehicles';

	_main set [count _main, ['===============================================================', 0, []]];
	_main set [count _main, ['                             Quick Access', 0, []]];
	_main set [count _main, ['>> Teleport to Target', 6, []]];
	_main set [count _main, ['>> Teleport Target to You', 6, []]];
	_main set [count _main, ['===============================================================', 0, []]];
	_main set [count _main, ['                            Toggle Scripts', 0, []]];
	_main set [count _main, ['Keybinds:', 0, []]];
	_main set [count _main, ['    TP Forward Keybind', 1, []]];
	_main set [count _main, ['    Fly Keybind', 1, []]];
	_main set [count _main, ['', 0, []]];
	_main set [count _main, ['Base Tools:', 0, []]];
	_main set [count _main, ['    Door Admin', 1, []]];
	_main set [count _main, ['    Plot Admin', 1, []]];
	_main set [count _main, ['    Instant Build', 1, []]];
	_main set [count _main, ['    No Build Restrictions', 1, []]];
	_main set [count _main, ['', 0, []]];
	_main set [count _main, ['Protection:', 0, []]];
	_main set [count _main, ['    God Mode', 1, []]];
	_main set [count _main, ['    Vehicle God Mode', 1, []]];
	_main set [count _main, ['    Invisibility', 1, []]];
	_main set [count _main, ['    No Zombie Aggro', 1, []]];
	_main set [count _main, ['    Zombie Shield', 1, []]];
	_main set [count _main, ['', 0, []]];
	_main set [count _main, ['Special Abilities:', 0, []]];
	_main set [count _main, ['    [Alt + Left Click] Map Teleport', 1, []]];
	_main set [count _main, ['    Player ESP', 1, []]];
	_main set [count _main, ['    No Recoil', 1, []]];
	_main set [count _main, ['    Rapid Fire', 1, []]];
	_main set [count _main, ['    Unlimited Ammo', 1, []]];
	_main set [count _main, ['    Vehicle Boost', 1, []]];
	_main set [count _main, ['', 0, []]];
	_main set [count _main, ['Map Markers:', 0, []]];
	_main set [count _main, ['    Animal Markers', 1, []]];
	_main set [count _main, ['    Body Markers', 1, []]];
	_main set [count _main, ['    Plot Markers', 1, []]];
	_main set [count _main, ['    Vault Markers', 1, []]];
	_main set [count _main, ['    Lockbox Markers', 1, []]];
	_main set [count _main, ['    Storage Markers', 1, []]];
	_main set [count _main, ['    Player Markers', 1, []]];
	_main set [count _main, ['    Vehicle Markers', 1, []]];
	_main set [count _main, ['', 0, []]];
	_main set [count _main, ['Map Icons:', 0, []]];
	_main set [count _main, ['    Unit Icons', 1, []]];
	_main set [count _main, ['    Vehicle Icons', 1, []]];
	_main set [count _main, ['===============================================================', 0, []]];
	_main set [count _main, ['                                  Tools', 0, []]];
	_main set [count _main, ['>> Cache Toggle Configuration', 0, [], admin_cache]];
	_main set [count _main, ['>> Copy Coords to Chat', 0, [], admin_coords]];
	_main set [count _main, ['>> Kill AI', 0, [], admin_killai]];
	_main set [count _main, ['>> Remove Camo Nets', 0, [], admin_nets]];
	_main set [count _main, ['>> Remove Plot Poles', 0, [], admin_poles]];
	_main set [count _main, ['', 0, []]];

	_targ set [count _targ, ['===============================================================', 0, []]];
	_targ set [count _targ, ['                            Target Actions', 0, []]];
	if (Z_SingleCurrency) then {
		_targ set [count _targ, ['>> Adjust Target Bank', 6, []]];
		_targ set [count _targ, ['>> Adjust Target Wallet', 6, []]];
	};
	_targ set [count _targ, ['>> Adjust Target Humanity', 6, []]];
	_targ set [count _targ, ['', 0, []]];
	_targ set [count _targ, ['>> Teleport to Target', 6, []]];
	_targ set [count _targ, ['>> Teleport Target to You', 6, []]];
	_targ set [count _targ, ['', 0, []]];
	_targ set [count _targ, ['Friendly:', 0, [0.118,0.565,1,1]]];
	_targ set [count _targ, ['    >> Give Target Ammo', 6, [0.118,0.565,1,1]]];
	_targ set [count _targ, ['    >> Heal Target', 6, [0.118,0.565,1,1]]];
	_targ set [count _targ, ['    >> Join Target Vehicle', 6, [0.118,0.565,1,1]]];
	_targ set [count _targ, ['    >> Move Target into Your Vehicle', 6, [0.118,0.565,1,1]]];
	_targ set [count _targ, ['    >> Repair Target Vehicle', 6, [0.118,0.565,1,1]]];
	_targ set [count _targ, ['    >> Unfreeze Target', 6, [0.118,0.565,1,1]]];
	_targ set [count _targ, ['', 0, []]];
	_targ set [count _targ, ['Malicious:', 0, [1,0,0,1]]];
	_targ set [count _targ, ['    >> Disconnect Target', 6, [1,0,0,1]]];
	_targ set [count _targ, ['    >> Eject Target', 6, [1,0,0,1]]];
	_targ set [count _targ, ['    >> Freeze Target', 6, [1,0,0,1]]];
	_targ set [count _targ, ['    >> Kill Target', 6, [1,0,0,1]]];
	_targ set [count _targ, ['    >> Make Target Commit Suicide', 6, [1,0,0,1]]];
	_targ set [count _targ, ['    >> Remove Target Gear', 6, [1,0,0,1]]];
	_targ set [count _targ, ['    >> Send Target Up', 6, [1,0,0,1]]];
	_targ set [count _targ, ['    >> Send Target to Ocean', 6, [1,0,0,1]]];
	_targ set [count _targ, ['', 0, []]];
	_targ set [count _targ, ['Loadouts:', 0, []]];
	{
		_targ set [count _targ, ['    >> Give ' + (_x select 0) + ' Loadout', 6, []]];
	} forEach "+str _loadouts+";

	_logs set [count _logs, ['===============================================================', 0, []]];
	_logs set [count _logs, ['                      Select which Logs to View', 0, []]];
	_logs set [count _logs, ['>> Admin Logs', 7, []]];
	_logs set [count _logs, ['>> Death Logs', 7, []]];
	_logs set [count _logs, ['>> Hack Logs', 7, []]];
	_logs set [count _logs, ['>> Lock/Unlock Logs', 7, []]];
	_logs set [count _logs, ['>> Maintenance Logs', 7, []]];
	_logs set [count _logs, ['>> New Player Logs', 7, []]];
	_logs set [count _logs, ['>> Player Logs', 7, []]];
	_logs set [count _logs, ['>> Safe Zone Logs', 7, []]];
	_logs set [count _logs, ['>> Surveillance Logs', 7, []]];
	_logs set [count _logs, ['>> Trader Logs', 7, []]];

	_spwn set [count _spwn, ['===============================================================', 0, []]];
	_spwn set [count _spwn, ['                             Spawn Boxes', 0, []]];
	_spwn set [count _spwn, ['>> Starter Build Box', 9, []]];
	_spwn set [count _spwn, ['>> Small Build Box', 9, []]];
	_spwn set [count _spwn, ['>> Medium Build Box', 9, []]];
	_spwn set [count _spwn, ['>> Large Build Box', 9, []]];
	_spwn set [count _spwn, ['===============================================================', 0, []]];
	_spwn set [count _spwn, ['                             Spawn Safes', 0, []]];
	_spwn set [count _spwn, ['>> Starter Build Safe', 10, []]];
	_spwn set [count _spwn, ['>> Small Build Safe', 10, []]];
	_spwn set [count _spwn, ['>> Medium Build Safe', 10, []]];
	_spwn set [count _spwn, ['>> Large Build Safe', 10, []]];
	if (count "+str EpochEvents+" > 0) then {
		_spwn set [count _spwn, ['===============================================================', 0, []]];
		_spwn set [count _spwn, ['                            Spawn Events', 0, []]];
		{
			_spwn set [count _spwn, [format['>> %1', _x select 5], 13, []]];
		} count "+str EpochEvents+";
	};
	if ("+str _wai+") then {
		_spwn set [count _spwn, ['===============================================================', 0, []]];
		_spwn set [count _spwn, ['                           Spawn Missions', 0, []]];
		_spwn set [count _spwn, ['Spawn Bandit Missions', 1, []]];
		{
			_spwn set [count _spwn, [format['>> %1', _x], 14, []]];
		} count [
			'patrol','black_hawk_crash','armed_vehicle','base',
			'captured_mv22','scout_patrol','ikea_convoy','medi_camp',
			'broken_down_ural','sniper_extraction','mayors_mansion',
			'weapon_cache','gem_tower','cannibal_cave','crop_raider',
			'drone_pilot','slaughter_house','drugbust','armybase',
			'abandoned_trader','lumberjack','presidents_mansion',
			'tankcolumn','macdonald','radioshack','junkyard','outpost',
			'farmer','firestation','vehicle_drop'
		];
	};

	_envi set [count _envi, ['===============================================================', 0, []]];
	_envi set [count _envi, ['                          Adjust Server Time', 0, []]];
	_envi set [count _envi, ['>> 12:00 a.m.', 11, []]];
	_envi set [count _envi, ['>> 02:00 a.m.', 11, []]];
	_envi set [count _envi, ['>> 04:00 a.m.', 11, []]];
	_envi set [count _envi, ['>> 06:00 a.m.', 11, []]];
	_envi set [count _envi, ['>> 08:00 a.m.', 11, []]];
	_envi set [count _envi, ['>> 10:00 a.m.', 11, []]];
	_envi set [count _envi, ['>> 12:00 p.m.', 11, []]];
	_envi set [count _envi, ['>> 02:00 p.m.', 11, []]];
	_envi set [count _envi, ['>> 04:00 p.m.', 11, []]];
	_envi set [count _envi, ['>> 06:00 p.m.', 11, []]];
	_envi set [count _envi, ['>> 08:00 p.m.', 11, []]];
	_envi set [count _envi, ['>> 10:00 p.m.', 11, []]];
	_envi set [count _envi, ['===============================================================', 0, []]];
	_envi set [count _envi, ['                         Adjust Server Weather', 0, []]];
	_envi set [count _envi, ['>> Clear Weather', 12, []]];
	_envi set [count _envi, ['>> Cloudy Weather', 12, []]];
	_envi set [count _envi, ['>> Rainy Weather', 12, []]];
	_envi set [count _envi, ['>> Stormy Weather', 12, []]];

	admin_menus = [
		['Main Menu', _main],
		['Backpack Menu', admin_backpacks],
		['Environment Menu', _envi],
		['Log Menu', _logs],
		['Magazine Menu', admin_magazines],
		['Spawn Menu', _spwn],
		['Target Menu', _targ],
		['Vehicle Menu', admin_vehicles],
		['Weapon Menu', admin_weapons]
	];
");