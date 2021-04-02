
# Epoch Antihack / Admin Tools
Compatible with DayZ Epoch 1.0.6.2 +

## Dependencies

#### BEC:
You need a program to reload your **bans.txt** file so that all bans written by the AH will take immediate effect. This can be done with BEC by adding the following line to your config file:
```
AutoLoadBans = True
```
It should look something like this:

![alt text][pic1]

[pic1]: https://i.imgur.com/a3qjFkb.png "BEC Config Example"

## Installation

#### Step 1
Copy the antihack folder into your dayz_server folder.

#### Step 2
In \z\addons\dayz_server\init\server_functions.sqf:

Find:
```
#include "\z\addons\dayz_server\compile\server_toggle_debug.hpp"
```
Below it, add:
```
#include "\z\addons\dayz_server\antihack\antihack.sqf"
```

#### Step 3
In \z\addons\dayz_server\system\scheduler\sched_sync.sqf:

Find:
```
// RESYNC TIME WITH HIVE DLL SYSTEM CALL
```
Below it, add:
```
if (!isNil "AH_timeOverride") exitWith {objNull};
```

#### Step 4
Copy the antihack.hpp file into the root of your mission folder.

#### Step 5
In description.ext:

Find:
```
#include "\z\addons\dayz_code\Configs\CfgServerTrader\CfgServerTrader.hpp"
```
Below it, add:
```
#include "antihack.hpp"
```

#### Step 6
Copy the Antihack.dll, Antihack.ini, and Newtonsoft.Json.dll files into your server's root folder.

#### Step 7
Adjust the settings in the Antihack.ini file to fit your server.

Keep in mind the following:
* The paths for the log files can be both relative and absolute:
	* ```antihack\Admin.log``` will send the log file to a folder called "antihack" in your server's root.
	* ```C:\antihack\Admin.log``` will send the log file to a folder called "antihack" in your C drive.
* Please make sure the path to your **bans.txt** is correct.
* The [API] section is disabled until you request login information from Movinggun (contact BigEgg if MG is not available).
	* This will log you into the global ban system. Once logged in, your server will participate in log sharing. All logs will be sent to our API for us to evaluate. Hackers will be globally banned.
	* Participation is optional. You can use the global ban system with the default settings and no logs will be sent to us.

#### Step 8
Adjust the ```_missionFiles``` array in your config.sqf to fit your server. There is a tool included that will automatically generate the list of files in your mission.

To use the tool (named ```KFC_Array_Builder.exe```):
* Put it in your mission root (where your init.sqf is located)
* Double click it and it will automatically generate the array and copy it to your clipboard

Example:

![alt text][pic2]

[pic2]: https://i.imgur.com/4yfhsX1.png "Mission Root Example"
![alt text][pic3]

[pic3]: https://i.imgur.com/53FfkmH.png "Tool Example"
![alt text][pic4]

[pic4]: https://i.imgur.com/ksyDqoY.png "Config Example"

#### Installation completed!

## Documentation
#### Defining Admins:
Admins are defined in the following format:
```
[Name (can be a single string or an array of names), UID (string), Hide from Lower Ranks (bool), Disable Logging (bool), Allow Execution on Dialog (bool)]
```
Examples:

Name of the admin must be "BigEgg" in order to use powers. Admin is hidden from lower ranks in menu, is not logged, and has access to the code execution box on the menu.
```
["BigEgg", "76561198115492831", true, true, true]
```
Name of the admin must be either "BigEgg", "FatEgg", or "TwinkieDestroyer" in order to use powers. Admin is not hidden from lower ranks in the menu, is logged, but has access to the code execution box on the menu.
```
[["BigEgg", "FatEgg", "TwinkieDestroyer"], "76561198115492831", false, false, true]
```
#### Understanding the Menu:
There are some useful features included in the menu:
* All items that are listen in green within the Backpack, Magazine, Vehicle, and Weapon menus are items that are within the traders on your server. Items listed in white are not in your server traders. The items shown in green will be the only ones shown to admin ranks with ```admin_limitLists``` enabled.
* The following values can be adjusted in the information panel: Blood, Humanity, Coins, and Bank. Adjusting these numbers and pressing "Enter" when you have a target selected will adjust the respective variable on their client to the value you entered.
* In the log menu, double clicking a log that is listed will automatically paste the log into your chat box, allowing you to easily view the whole log or copy / paste it.

## Change Log
#### [v1.0.0.9] - 8/24/2019
##### Additions:
- Added seperate code execution dialog.
- Added option to cache toggle configuration (will automatically enable cached toggle options when loading in).
- Added ability to limit admins to spawning temporary vehicles only.
- Added option to go back to root log menu when viewing a certain log category.
- Added death logs.
- Added player object check.
- Added loop that disables bad BIS functions.

##### Changes:
- Logs now show instance number as well as map name.
- Reorganized debug monitor and changed dark blue color of humanity to a lighter blue.
- Performed a code audit.
- Brought menus up to date and decreased the powers of the lower admin levels.

##### Fixes:
- Fixed an issue with the debug monitor loading before BIS_fnc_number text was initialized.


#### [v1.0.0.8] - 6/17/2019
##### Additions:
- Added global ban system.

##### Changes:
- Added independent key bind function to avoid overwriting main keyboard_keys variable.
- Changed global thread spawn method. Code is now hidden from thread dump.
- Updated Head Admin and Admin menus to contain the key bind toggles.

##### Fixes:
- Fixed an issue regarding bad vehicle check that gave an undefined variable error on a fresh Epoch install.
- Fixed an issue with bad vehicle check that would cause traders listed in server_traders without a corresponding menu_ variable to kill the thread.


#### [v1.0.0.7] - 5/26/2019
##### Additions:
- Added vehicle boost to Owner/Head Admin menus
- Added bad vehicle check. Enabling _bvc will make the AH scan vehicles on the server for any that are not listed within server traders or the AH whitelist. This prevents hackers from spawning malicious vehicles that are not found within the server.
- Added more log viewing options to the log menu
- Added Discord, TeamSpeak, and Website chat commands. Defining these fields allows players to type !discord, !teamspeak, and !website respectively to have the information pasted for them in chat.
- Added a function to prevent an incorrect typeName from being pulled using getVariable. It is possible to kill a thread by simply changing a variable's typeName.
- Added the ability for Owners and Head Admins to spawn Epoch Events from the spawn menu.

##### Changes:
- Removed the AH_fnc_verify function as it is no longer needed.
- Changed all getVariable code listed in threads to the new function based calls.

##### Fixes:
- Fixed an issue with logs being duplicated on the client and removed unneeded variables.
- Fixed an issue with sender verification failing and sometimes spamming hack logs


#### [v1.0.0.6] - 5/04/2019
##### Additions:
- None

##### Changes:
- Mission check no longer uses loading screen. This may return in the future as a toggle.

##### Fixes:
- Fixed an issue with ban IDs being "any"
- Applied a temporary fix to prevent the authentication errors (Failed to verify identity of PV sender)
- Fixed an issue with day/night voting that showed a number if the votes were equally divided (now shows if the server chose day or night instead of 0 or 12)


#### [v1.0.0.5] - 3/21/2019
##### Additions:
- Added check for modified Epoch variables (unsecure config variables mostly)
- Added option to automatically switch player to 3rd person mode on login
- Added ability to toggle tp/fly keybinds
- Added new player logging (sends a message to admins in game as well)
- Added help chat commands (!help & /help)
- Added temporary vehicle spawning
- Added an option to toggle player connect/disconnect announcements (BIGEGG CONNECTED/BIGEGG DISCONNECTED in system chat)

##### Changes:
- Selected targets are now cached when changing menus. Before, switching menus with a player selected could cause a different player to be selected
- God mode now prevents death from explosions in vehicles
- All public variables have been moved to a singular event handler on the server and a single command on the clients
- Safe zones are now in their own loop. Previously, when exiting the safe zone with a timer, the escape menu and debug monitor would be paused until the timer completed
- Grass and view distance overrides can now be toggled by setting each value to -1 if you want it disabled
- Vehicles are now spawned in front of the player in a clean manner (no longer in random places around the player)

##### Fixes:
- Fixed an issue with admin menus being blank if an owner with the hidden permission was online


#### [v1.0.0.4] - 3/16/2019
##### Additions:
- None

##### Changes:
- Updated mission check - it now starts a loading screen to speed up the client checks

##### Fixes:
- Fixed ridiculous ESP flickering
- Fixed mission check problems


#### [v1.0.0.3] - 1/27/2019
##### Additions:
- Added bad weapon check

##### Changes:
- Updated mission check - it now functions as an SQF hash of sorts
- Mission check is now scheduled on the server and clients for less lag during checks
- Healing a player now force saves their client

##### Fixes:
- Fixed another issue with the "Player information changed" check
- Fixed a false positive sometimes occurring with the skin check
- Fixed undefined variable ```_queue``` with safe zones


#### [v1.0.0.2] - 1/24/2019
##### Additions:
- Added urban prone block with config option
- Added a new and improved multifunction dialog for searching etc...

##### Changes:
- Added more files to the file scanner
- File scanner now only runs when the player logs in instead of in a loop
- Mission check can now be enabled or disabled via config
- Thread queues are now local variables instead of random globals to prevent modification

##### Fixes:
- Fixed an issue with the "Player information changed" check


#### [v1.0.0.1] - 1/20/2019
##### Additions:
- New Mission Check (please use instead of default - it is much faster)
- New tool included that allows server owners to generate a list of all files in their mission
- Added new restricted variables ```RhynoV1, RhynoV1ESP, RhynoV1_FNC_ESP_distance```

##### Changes:
- Backpack, Magazine, Vehicle, and Weapon menus are now cached for slightly better performance
- Removed the ```visibleMap``` check from Map Markers
- A spacer was added to the end of each menu to prevent cut off
- Removed ```allMissionObjects``` stat from performance monitor

##### Fixes:
- Fixed the vehicle counter which would show inaccurate data
- Fixed a problem with voting that would result in a player being able to vote multiple times
- Fixed an issue with logs not being converted to an array before being sent to the server, which was causing Public Variable Value filters to trigger
- Fixed the examples in the config to be accurate
- Added an attempt to fix some players receiving AI information from the server resulting in a spammed attempt to ban them
- Fixed the open gear keybind being the same as the cancel spectate keybind


#### [v1.0.0.0] - 1/13/2019
##### Additions:
- Initial Release

##### Changes:
- None
##### Fixes:
- None