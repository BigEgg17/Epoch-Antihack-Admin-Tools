
# Epoch Antihack / Admin Tools
Compatible with DayZ Epoch 1.0.7 +

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
In init.sqf:

Find:
```
dayz_antihack = 1;
```
Change it to:
```
dayz_antihack = 0;
```
Note: ```dayz_REsec``` can remain at its default value of 1 (this is also recommended)

#### Step 7
Copy the Antihack.dll, Antihack.ini, and Newtonsoft.Json.dll files into your server's root folder.

#### Step 8
Adjust the settings in the Antihack.ini file to fit your server.

Keep in mind the following:
* The paths for the log files can be both relative and absolute:
	* ```antihack\Admin.log``` will send the log file to a folder called "antihack" in your server's root.
	* ```C:\antihack\Admin.log``` will send the log file to a folder called "antihack" in your C drive.
* Please make sure the path to your **bans.txt** is correct.
* The [API] section is disabled until you request login information from Movinggun (contact BigEgg if MG is not available).
	* This will log you into the global ban system. Once logged in, your server will participate in log sharing. All logs will be sent to our API for us to evaluate. Hackers will be globally banned.
	* Participation is optional. You can use the global ban system with the default settings and no logs will be sent to us.

#### Step 9
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
[Name (can be a single string or an array of names) - can be empty to allow admin client on any name, UID (string), Hide from Lower Ranks (bool), Disable Logging (bool), Allow Execution on Dialog (bool), Player Name (or test account name) - only useful if Name field is empty]
```
Examples:

Name of the admin must be "BigEgg" in order to use powers. Admin is hidden from lower ranks in menu, is not logged, and has access to the code execution box on the menu.
```
["BigEgg", "76561198115492831", true, true, true, ""]
```
Name of the admin must be either "BigEgg", "FatEgg", or "TwinkieDestroyer" in order to use powers. Admin is not hidden from lower ranks in the menu, is logged, but has access to the code execution box on the menu.
```
[["BigEgg", "FatEgg", "TwinkieDestroyer"], "76561198115492831", false, false, true, ""]
```
Name of the admin can be anything. Admin powers are not given if name is BillyBob. Admin is not hidden from lower ranks in the menu, is logged, but has access to the code execution box on the menu.
```
["", "76561198115492831", false, false, true, "BillyBob"]
```
#### Configuration Settings:
|Setting|Description|
|--|--|
|_menuKey|Key that will open the menu|
|_mod|List of moderators following the above configuration formats|
|_admin|List of admins following the above configuration formats|
|_headAdmin|List of head admins following the above configuration formats|
|_owner|List of owners following the above configuration formats|
|_diag_prefix|This prefix will appear before all diag_log messages on all clients and the server|
|_rptall|If true, all logs will be sent to the rpt as well as their respective designations|
|_headless|List UIDs of headless clients here. They will be sent no client code and global code will be terminated|
|_apj|If true, announces when a player has connected or disconnected in systemChat|
|_bvc|If true, will delete any vehicles not in server traders or the whitelist below|
|_egb|If true, syncs KFC global bans. Useful for banning hackers from other servers. Will likely be depricated in the future - disabled by default|
|_vehWhiteList|Add any additional vehicles that shouldn't be deleted here (special mission vehicles etc...). Only used if _bvc = true|
|_voteplayers|Number of players that must be online before a vote can be held|
|_votedelay|Amount of time (in seconds) to wait between day/night votes|
|_votetime|Amount of time to wait before cancelling a vote due to lack of majority|
|_votepercent|Percentage of the server population that must vote before a decision is reached (0-1)|
|_chat_prefix|This prefix will appear before all systemChat messages on clients|
|_viewDistance|Default view distance. This will only be set on login (set to -1 to disable)|
|_grassLevel|Default grass level. Options are: 3.125 (Highest performance hit), 6.25, 12.5, 25 (multiplayer default), and 50 (No grass). This will only be set on login (set to -1 to disable)|
|_bfs|If true, scans the client's game directory for the files listed in _badFiles below|
|_bvs|If true, checks for bad variables listed in _badVars below|
|_oef|If true, makes sure that onEachFrame isn't modified (esp scripts sometimes use this)|
|_bdc|If true, checks for bad displays listed in _badDisplays|
|_bsc|If true, makes sure the player isn't wearing a forbidden skin listed in _badSkins|
|_upc|If true, prevents urban prone actions near plot poles|
|_mic|If true, checks the integrity of the mission file. If a file is modified, the player is banned|
|_bwc|If true, makes sure the player doesn't have an illegal weapon listed in _badWeapons|
|_mev|Depricated 1.0.7|
|_sev|If true, switches client to 3rd person automatically upon login|
|_badDisplays|List of bad displays (displays that should be restricted on normal clients like the admin menu etc...)|
|_badSkins|List of forbidden skins|
|_badWeapons|List of illegal weapons|
|_discord|This will be displayed when a player types !discord or /discord in chat. Leave empty to disable|
|_teamspeak|This will be displayed when a player types !teamspeak or /teamspeak in chat. Leave empty to disable|
|_website|This will be displayed when a player types !website or /website in chat. Leave empty to disable|
|_chatcmds|List of chat scripts players can use (currently "day/night" and "suicide" are the only possible commands|
|_chatbanned|List of UIDs that are banned from chatting in any channel|
|_debug|Determines if debug monitor will be used (true = enabled | false = disabled)|
|_dkey|Key used to activate / deactivate debug monitor|
|_drestart|Restart time in minutes (will be used to calculate time till restart on debug monitor)|
|_dtext|This text will appear at the bottom of the debug monitor|
|_safezones|If true, enables safe zones|
|_bubbles|If true, marks safe zone boundaries with bubbles|
|_antized|If true, deletes zombies that walk into the safe zone|
|_antitheft|If true, prevents theft of vehicles and gear in the safe zones|
|_speedLimit|If greater than 0, speed of vehicles in the safe zone will be limited to this number|
|_timer|If greater than 0, safe zone protection will remain in affect for this number of seconds after leaving|
|_disableWeps|If true, makes the player drop any weapon listed in _dropWeps while in safe zone|
|_dropWeps|Will remove these weapons from the player if they try to select them in a safe zone|
|_escTopT|Text at the top of the escape menu|
|_escTopC|Color of the text at the top of the escape menu|
|_escMidT|Text in the middle of the escape menu|
|_escLUPT|Lower-upper text of the escape menu|
|_escLUPC|Color of the lower-upper text of the escape menu|
|_escLBOT|Lower-bottom text of the escape menu|
|_escLBOC|Color of the lower-bottom text of the escape menu|
|_starterBox|Items in the starter build box|
|_smallBox|Items in the small build box|
|_mediumBox|Items in the medium build box|
|_largeBox|Items in the large build box|
|_starterSafe|Items in the starter build safe|
|_smallSafe|Items in the small build safe|
|_mediumSafe|Items in the medium build safe|
|_largeSafe|Items in the large build safe|
|_missionFiles|List of files within your mission. Antihack will make sure that none have been changed.|
|_badChat|List of chat commands that will be logged in surveillance log|
|_badFiles|List of bad files that will be scanned for in client game directories|
|_badVars|List of bad files to be checked for|
#### Understanding the Menu:
There are some useful features included in the menu:
* All items that are listen in green within the Backpack, Magazine, Vehicle, and Weapon menus are items that are within the traders on your server. Items listed in white are not in your server traders. The items shown in green will be the only ones shown to admin ranks with ```admin_limitLists``` enabled.
* The following values can be adjusted in the information panel: Blood, Humanity, Coins, and Bank. Adjusting these numbers and pressing "Enter" when you have a target selected will adjust the respective variable on their client to the value you entered.
* In the log menu, double clicking a log that is listed will automatically paste the log into your chat box, allowing you to easily view the whole log or copy / paste it.

## Change Log
#### [v1.0.1] - TBD
##### Additions:
- None

##### Changes:
- Removed all ```private``` arrays and converted to more efficient ```local _var```.
- Updated README.md with more documentation and additional instruction for ```dayz_antihack```.
- Staff members can now have an empty name field, such that any name grants admin permissions.
- Staff members can now have a registered player name if their required name field is blank, giving them no powers when on the player name.

##### Fixes:
- Fixed an issue with the "No Zombie Aggro" menu option.
- Fixed multiple incompatibilities with Epoch 1.0.7

#### [v1.0.0.9] - 8/24/2019 (Final 1.0.6.2 release)
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