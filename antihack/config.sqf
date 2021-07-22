/* ******************************************************* */
/*             Created for the Epoch Community             */
/*                By BigEgg and Movinggun                  */
/* ******************************************************* */

/* ***************** Staff Configuration ***************** */

local _menuKey = 0x3C; //---Key that will open the menu.

local _mod = []; //---Add moderators here - don't forget commas!
local _admin = []; //---Add admins here - don't forget commas!
local _headAdmin = []; //---Add head admins here - don't forget commas!
local _owner = [
	//["", "76561198115492831", true, false, true, "Test"],
	//[["BigEgg", "FatEgg", "TwinkieDestroyer"], "76561198115492831", true, false, true, ""]
]; //---Add owners here - don't forget commas!

/* ***************** Server Configuration **************** */

local _diag_prefix = "<Epoch-AH>: "; //---This prefix will appear before all diag_log messages on all clients and the server
local _rptall = true; //---If true, all logs will be sent to the rpt as well as their respective designations

local _headless = []; //---List UIDs of headless clients here. They will be sent no client code and global code will be terminated

local _apj = true; //---If true, announces when a player has connected or disconnected in systemChat
local _bvc = true; //---If true, will delete any vehicles not in server traders or the whitelist below
local _egb = false; //---If true, syncs KFC global bans. Useful for banning hackers from other servers. Will likely be depricated in the future - disabled by default
local _wai = true; //---If true, enables compatibility with Wicked AI (https://github.com/f3cuk/WICKED-AI)

local _vehWhiteList = []; //---Add any additional vehicles that shouldn't be deleted here (special mission vehicles etc...). Only used if _bvc = true

//---Note: "day/night" must be in _chatcmds in order for these work
local _voteplayers = 15; //---Number of players that must be online before a vote can be held.
local _votedelay = 900; //---Amount of time (in seconds) to wait between day/night votes.
local _votetime = 180; //---Amount of time to wait before cancelling a vote due to lack of majority.
local _votepercent = 0.5; //---Percentage of the server population that must vote before a decision is reached (0-1).

/* **************** Client Configuration ***************** */

local _chat_prefix = "<Epoch-AH>: "; //---This prefix will appear before all systemChat messages on clients

local _viewDistance = 1250; //---Default view distance. This will only be set on login (set to -1 to disable)
local _grassLevel = 25; //---Default grass level. Options are: 3.125 (Highest performance hit), 6.25, 12.5, 25 (multiplayer default), and 50 (No grass). This will only be set on login (set to -1 to disable)

local _bfs = true; //---If true, scans the client's game directory for the files listed in _badFiles below
local _bvs = true; //---If true, checks for bad variables listed in _badVars below
local _oef = true; //---If true, makes sure that onEachFrame isn't modified (esp scripts sometimes use this)
local _bdc = true; //---If true, checks for bad displays listed in _badDisplays
local _bsc = true; //---If true, makes sure the player isn't wearing a forbidden skin listed in _badSkins
local _upc = true; //---If true, prevents urban prone actions near plot poles
local _mic = true; //---If true, checks the integrity of the mission file. If a file is modified, the player is banned
local _bwc = true; //---If true, makes sure the player doesn't have an illegal weapon listed in _badWeapons
//local _mev = true; //---If true, monitors unsecure Epoch variables - Removed for 107
local _sev = true; //---If true, switches client to 3rd person automatically upon login

local _badDisplays = [30, 32, 45, 125, 140, 155, 156, 1001, 2929, 3030, 6969, 6970, 6971]; //---List of bad displays
local _badSkins = ["InvisibleManW_EP1", "GoInvisible"]; //---List of forbidden skins
local _badWeapons = ["GAU8", "MaverickLauncher", "SidewinderLaucher_AH1Z", "57mmLauncher", "GSh23L_L39", "ZiS_S_53", "M256", "MLRS", "M134", "AGS30", "MK19BC", "M2"]; //---List of illegal weapons

local _discord = ""; //---This will be displayed when a player types !discord or /discord in chat. Leave empty to disable
local _teamspeak = ""; //---This will be displayed when a player types !teamspeak or /teamspeak in chat. Leave empty to disable
local _website = ""; //---This will be displayed when a player types !website or /website in chat. Leave empty to disable

local _chatcmds = ["day/night", "suicide"]; //---List of chat scripts players can use
local _chatbanned = [ //---List of UIDs that are banned from chatting in any channel
	//"76561198115492831", //---BigEgg
	"0"
];

/* ******************** Debug Monitor ******************** */

local _debug = true; //---Determines if debug monitor will be used (true = enabled | false = disabled)
local _dkey = 0xD2; //---Key used to activate / deactivate debug monitor
local _drestart = 120; //---Restart time in minutes (will be used to calculate time till restart on debug monitor)
local _dtext = "www.epochmod.com"; //---This text will appear at the bottom of the debug monitor

/* ********************* Safe Zones ********************** */

local _safezones = true; //---If true, enables safe zones
local _bubbles = true; //---If true, marks safe zone boundaries with bubbles
local _antized = true; //---If true, deletes zombies that walk into the safe zone
local _antiai = true; //---If true, delete AI that walk into the safe zone
local _antitheft = true; //---If true, prevents theft of vehicles and gear in the safe zones
local _speedLimit = 30; //---If greater than 0, speed of vehicles in the safe zone will be limited to this number
local _timer = 10; //---If greater than 0, safe zone protection will remain in affect for this number of seconds after leaving

local _disableWeps = true; //---If true, makes the player drop any weapon listed in _dropWeps while in safe zone
local _dropWeps = [ //---Will remove these weapons from the player if they try to select them in a safe zone
	"Vil_RPG29", "Vil_RPO_A", "Vil_RPG16", "Vil_RPG7V_PGO", "Vil_Panzerfaust3", "M136", "RPG7V", "vil_CG84T", "vilas_rpg22", "vilas_rpg26", "MAAWS", "Vil_RPG7d_PGO",
	"RPG18", "MeleeHatchet", "MeleeCrowbar","MeleeMachete", "MeleeFishingPole", "MeleeSledge", "MeleeBaseBallBatNails", "MeleeBaseBallBatBarbed", "MeleeBaseBallBat"
];

/* ********************* Escape Menu ********************* */

local _escTopT = "Epoch Server"; //---Text at the top of the escape menu
local _escTopC = [1,1,1,1]; //---Color of the text at the top of the escape menu

local _escMidT = "DayZ Epoch"; //---Text in the middle of the escape menu

local _escLUPT = "For the Community"; //---Lower-upper text of the escape menu
local _escLUPC = [1,1,1,1]; //---Color of the lower-upper text of the escape menu

local _escLBOT = "By: BigEgg & MG"; //---Lower-bottom text of the escape menu
local _escLBOC = [1,1,1,1]; //---Color of the lower-bottom text of the escape menu

/* ******************** Menu Loadouts ******************** */

local _loadouts = [ //---List of defined loadouts that will appear in target menus if configured (by default, only Owner and Head Admin ranks will see)
	[
		"MK48", //---Loadout name - will appear as "Give MK48 Loadout" in admin menus
		["Mk48_CCO_DZ", "UZI_SD_EP1", "ItemFlashlight", "ItemHatchet", "ItemRadio", "ItemMap", "ItemToolbox", "ItemKnife", "ItemGPS", "Binocular_Vector", "NVGoggles", "ItemEtool", "ItemCrowbar", "ItemCompass"], //---Loadout Weapons
		["ItemAntibiotic", "ItemPainkiller", "ItemMorphine", "ItemBloodbag", "FishCookedTuna", "ItemSodaOrangeSherbet", "Skin_Sniper1_DZ", ["100Rnd_762x51_M240", 4], ["ItemBandage", 4], ["30Rnd_9x19_UZI_SD", 4]], //---Loadout Magazines
		"DZ_Backpack_EP1" //---Loadout backpack
	],
	["Anzio",["Anzio_20_DZ", "UZI_SD_EP1", "ItemFlashlight", "ItemHatchet", "ItemRadio", "ItemMap", "ItemToolbox", "ItemKnife", "ItemGPS", "Binocular_Vector", "NVGoggles", "ItemEtool", "ItemCrowbar", "ItemCompass"],["ItemAntibiotic", "ItemPainkiller", "ItemMorphine", "ItemBloodbag", "FishCookedTuna", "ItemSodaOrangeSherbet", "Skin_Sniper1_DZ", ["3rnd_Anzio_20x102mm", 4], ["ItemBandage", 4], ["30Rnd_9x19_UZI_SD", 4]],"DZ_Backpack_EP1"],
	["G36K",["G36K_Camo_DZ", "UZI_SD_EP1", "ItemFlashlight", "ItemHatchet", "ItemRadio", "ItemMap", "ItemToolbox", "ItemKnife", "ItemGPS", "Binocular_Vector", "NVGoggles", "ItemEtool", "ItemCrowbar", "ItemCompass"],["ItemAntibiotic", "ItemPainkiller", "ItemMorphine", "ItemBloodbag", "FishCookedTuna", "ItemSodaOrangeSherbet", "Skin_Sniper1_DZ", ["30Rnd_556x45_G36", 4], ["ItemBandage", 4], ["30Rnd_9x19_UZI_SD", 4]],"DZ_Backpack_EP1"],
	["DMR",["DMR_DZ", "UZI_SD_EP1", "ItemFlashlight", "ItemHatchet", "ItemRadio", "ItemMap", "ItemToolbox", "ItemKnife", "ItemGPS", "Binocular_Vector", "NVGoggles", "ItemEtool", "ItemCrowbar", "ItemCompass"],["ItemAntibiotic", "ItemPainkiller", "ItemMorphine", "ItemBloodbag", "FishCookedTuna", "ItemSodaOrangeSherbet", "Skin_Sniper1_DZ", ["20Rnd_762x51_DMR", 4], ["ItemBandage", 4], ["30Rnd_9x19_UZI_SD", 4]],"DZ_Backpack_EP1"],
	["LeeEnfield",["Mk48_CCO_DZ", "UZI_SD_EP1", "ItemFlashlight", "ItemHatchet", "ItemRadio", "ItemMap", "ItemToolbox", "ItemKnife", "ItemGPS", "Binocular_Vector", "NVGoggles", "ItemEtool", "ItemCrowbar", "ItemCompass"],["ItemAntibiotic", "ItemPainkiller", "ItemMorphine", "ItemBloodbag", "FishCookedTuna", "ItemSodaOrangeSherbet", "Skin_Sniper1_DZ", ["10Rnd_303British", 4], ["ItemBandage", 4], ["30Rnd_9x19_UZI_SD", 4]],"DZ_Backpack_EP1"],
	["M240",["M240_DZ", "UZI_SD_EP1", "ItemFlashlight", "ItemHatchet", "ItemRadio", "ItemMap", "ItemToolbox", "ItemKnife", "ItemGPS", "Binocular_Vector", "NVGoggles", "ItemEtool", "ItemCrowbar", "ItemCompass"],["ItemAntibiotic", "ItemPainkiller", "ItemMorphine", "ItemBloodbag", "FishCookedTuna", "ItemSodaOrangeSherbet", "Skin_Sniper1_DZ", ["100Rnd_762x51_M240", 4], ["ItemBandage", 4], ["30Rnd_9x19_UZI_SD", 4]],"DZ_Backpack_EP1"],
	["M24",["M24_DZ", "UZI_SD_EP1", "ItemFlashlight", "ItemHatchet", "ItemRadio", "ItemMap", "ItemToolbox", "ItemKnife", "ItemGPS", "Binocular_Vector", "NVGoggles", "ItemEtool", "ItemCrowbar", "ItemCompass"],["ItemAntibiotic", "ItemPainkiller", "ItemMorphine", "ItemBloodbag", "FishCookedTuna", "ItemSodaOrangeSherbet", "Skin_Sniper1_DZ", ["5Rnd_762x51_M24", 4], ["ItemBandage", 4], ["30Rnd_9x19_UZI_SD", 4]],"DZ_Backpack_EP1"],
	["M4A1",["M4A1_DZ", "UZI_SD_EP1", "ItemFlashlight", "ItemHatchet", "ItemRadio", "ItemMap", "ItemToolbox", "ItemKnife", "ItemGPS", "Binocular_Vector", "NVGoggles", "ItemEtool", "ItemCrowbar", "ItemCompass"],["ItemAntibiotic", "ItemPainkiller", "ItemMorphine", "ItemBloodbag", "FishCookedTuna", "ItemSodaOrangeSherbet", "Skin_Sniper1_DZ", ["30Rnd_556x45_Stanag", 4], ["ItemBandage", 4], ["30Rnd_9x19_UZI_SD", 4]],"DZ_Backpack_EP1"]
];

/* ********************* Build Boxes ********************* */

local _starterBox = [ //---Items in the starter build box
	"plot_pole_kit",
	["full_cinder_wall_kit", 3],
	["metal_floor_kit", 2],
	"cinder_door_kit",
	"ItemComboLock",
	"ItemPole",
	"ItemTankTrap",
	"ItemVault",
	"workbench_kit",
	"ItemCrowbar",
	"ItemEtool",
	"ItemToolbox",
	"DZ_Backpack_EP1"
];

local _smallBox = [ //---Items in the small build box
	"plot_pole_kit",
	"cinder_door_kit",
	["half_cinder_wall_kit", 6],
	["MortarBucket", 6],
	["CinderBlocks", 24],
	["metal_floor_kit", 6],
	["ItemComboLock", 2],
	["ItemPole", 4],
	["ItemTankTrap", 4],
	"ItemVault",
	["ItemWoodLadder", 2],
	["ItemWoodStairs", 2],
	"workbench_kit",
	"ItemCrowbar",
	"ItemEtool",
	"ItemSledge",
	"ItemToolbox",
	"DZ_Backpack_EP1"
];

local _mediumBox = [ //---Items in the medium build box
	"plot_pole_kit",
	["cinder_door_kit", 2],
	["cinder_garage_kit", 2],
	["half_cinder_wall_kit", 12],
	["MortarBucket", 12],
	["CinderBlocks", 48],
	["metal_floor_kit", 12],
	["ItemComboLock", 4],
	["ItemPole", 8],
	["ItemTankTrap", 8],
	["ItemVault", 2],
	["ItemWoodLadder", 4],
	["ItemWoodStairs", 4],
	["workbench_kit", 2],
	["ItemCrowbar", 2],
	["ItemEtool", 2],
	["ItemSledge", 2],
	["ItemToolbox", 2],
	["DZ_Backpack_EP1", 2]
];

local _largeBox = [ //---Items in the large build box
	"plot_pole_kit",
	["cinder_door_kit", 4],
	["cinder_garage_kit", 4],
	["half_cinder_wall_kit", 18],
	["MortarBucket", 18],
	["CinderBlocks", 72],
	["metal_floor_kit", 18],
	["ItemComboLock", 8],
	["ItemPole", 16],
	["ItemTankTrap", 16],
	["ItemVault", 3],
	["ItemWoodLadder", 6],
	["ItemWoodStairs", 6],
	["workbench_kit", 3],
	["ItemCrowbar", 3],
	["ItemEtool", 3],
	["ItemSledge", 3],
	["ItemToolbox", 3],
	["DZ_Backpack_EP1", 3]
];

/* ********************* Build Safes ********************* */

//---Formatting is the same as the boxes above. Condensed down to save space.
local _starterSafe = _starterBox; //---Items in the starter build safe
local _smallSafe = _smallBox; //---Items in the small build safe
local _mediumSafe = _mediumBox; //---Items in the medium build safe
local _largeSafe = _largeBox; //---Items in the large build safe

/* ********************* Large Lists ********************* */

local _missionFiles = [ //---List of files within your mission. Antihack will make sure that none have been changed.
	"description.ext", "init.sqf", "mission.sqm", "rules.sqf"
];

local _badChat = [ //---List of chat commands that will be logged in surveillance log
	".ban",".sqf","/2ndtp","/backpack","/ban","/banall","/bigbullets","/bot","/bot1brief","/bot50brief","/botbuilding","/botcheytac","/botcustom","/botdmr","/botm107","/ccgcode","/code","/delete","/destroy","/esp","/exec","/fini",
	"/finiactivatere","/finialldance","/finiinfistar","/finikillall","/finitpall","/fixvehicle","/getfile","/getvehkey","/giveammo","/givecoins","/god","/gunbox","/heal","/humanityminus","/humanityminuscurs","/humanityplus",
	"/humanitypluscurs","/infniteammo","/item","/itemmassspawn","/itemspawn","/keybind","/kickall","/menu","/morph","/nuke","/pammo","/pdel","/pepochbox","/pesp","/pgod","/pgunbox","/playermarker","/pmarkers","/pnuke",
	"/pteleportall","/ptp","/run","/safeespmap","/safemarkers","/selfkill010","/skin","/spawn100","/start","/teleport","/time","/tp","/troll","/troll funces","/troll funks","/trollf","/trollfu","/trollfuc","/trollfuck",
	"/trollfucku","/trollfuckup","/trollfun","/trollfunk","/trollfunks","/vehdelivery","/vehspawn","/zshield","3sp","4mm0","admin_start","adminstart","b0mb4ll","bbammo","bbbox","bbdel","bbesp","bbgod","bbhelp","bbtp","bbunlock",
	"bombtrgt","execu","inf4mm0","iRap3","irap3","irap35p","iRap35P","iRap37A","irap37a","irap3bt","iRap3bt","irap3d3l","iRap3d3l","irap3ex","iRap3eX","irap3mrk","iRap3mrK","j3sus","m4rk3rs","n00k3","pewpew","t3l3all","t3p3",
	"v3hj3sus","z3dz"
];

local _badFiles = [ //---List of bad files that will be scanned for in client game directories
	"!Scripts\de_cba.sqf", "#119.sqf", "#cexeetomer.sqf", "#ekun.sqf", "#gathsah.sqf", "#llabmob.sqf", "#llatropelet.sqf", "#nepo.sqf", "#pse.sqf", "#srekrampam.sqf", "#tegrat.sqf", "#tegratbmob.sqf", "#txet.sqf",
	"#yekteg.sqf", "001.sqf", "0100100110\start.sqf", "0100100110\Starts.sqf", "1.sqf", "1Brief.sqf", "2.pbo", "2dmap.sqf", "3desp.sqf", "50Brief.sqf", "@Dayz_Namalsk\HP.sqf", "@Dayz_Namalsk\menu.sqf",
	"@Hak_script\1.GLAVNOYE\000.sqf", "@Hak_script\1.Teleport.sqf", "@mHlopchik\Menu_Scripts\menu\keybind\funmenu", "@mymod\Scripts\ajmenu.sqf", "@SPX\3b.sqf", "@SPX\Spawn Weapon.sqf", "@SPX\SpawnWeapon.sqf",
	"\dz\modulesDayZ\scripts\player_queued.sqf", "\hangender\start.sqf", "\LoganNZL\LoganNZL@start.sqf", "\x_f\x_perframe.sqf", "\z\addons\ui_addons\decrypt.sqf", "A2MenuV2\ExecME.sqf", "A2MenuV2\MainFile.sqf",
	"activator_NR.exe", "addweapon.sqf", "Ahornblas.sqf", "Ahornblatt.sqf", "ahornshit.sqf", "AimJunkies.exe", "ajmenu.sqf", "allover.dll", "allover_[www.unknowncheats.me]_.dll", "ammo 2.sqf", "ammo2.sqf",
	"anti-hackloaded!Errors", "Arma 2 OA Battleye Bypass.exe", "ArmA2OA_Extars\BB_menu_BB.sqf", "ArmA2OA_Extras\ben_ex.sqf", "Arma2OABattleyeBypass.exe", "ArmA2OAHackUCReleasebyCriibyy.dll",
	"ArmA2OAHackUCReleasebyCriibyy_[www.unknowncheats.me]_.dll", "ArtyomV1\AtomicMenu.sqf", "ASM\_for_keybinds\mystuff.sqf", "ASM\startup.sqf", "Aspire Menu v.0.5\ALL TEH SCRIPTS!\esp.sqf",
	"Aspire Menu v.0.5\ALL TEH SCRIPTS!\heal.sqf", "AspireMenuv.0.5\ALLTEHSCRIPTS!\esp.sqf", "AspireMenuv.0.5\ALLTEHSCRIPTS!\heal.sqf", "battleHIGH_Menu\startup.sqf", "bb\start.sqf", "BE\update.sqf",
	"BESecureJect.exe", "Binocular\Ahornblas.sqf", "Binocular\Ahornblatt.sqf", "Binocular\ahornshit.sqf", "Binocular\fuckbitches.sqf", "Binocular\icesickles.sqf", "Binocular\vHMANITYUzu.sqf", "Binocular\vMNOEYzu.sqf",
	"Binocular\vSGHTZIzu.sqf", "Binocular\vTEELPROTzu.sqf", "blah.sqf", "boooooooobies.sqf", "bowenisthebest.sqf", "briefcases.sqf", "BuildingSupply.sqf", "bypass.dll", "C+N.sqf", "C1\compile\re.sqf", "CE_Engine-v5.exe",
	"CFF-Hook.dll", "CFF-Hook.sqf", "cheat.sqf", "CheatDayZUniversal.exe", "cheater.sqf", "ChernoNuke.sqf", "CheyTac.sqf", "crawdaunt\crawdaunt.sqf", "crinkly\keymenu.sqf", "cset.sqf", "Custom.sqf", "custom.sqf",
	"Custom_folder\scrollmenu\Click to Tp.sqf", "Custom_folder\scrollmenu\ClicktoTp.sqf", "customizethis.sqf", "D-DayZ.dll", "d3d199.dll", "dahR_E.sqf", "DarkLight\rrr333.sqf", "DarkLight\Stt3rtt.sqf", "Dayz AIM ESP Shield.exe",
	"DayZ AimJunkies.exe", "dayz cheat\lcc.exe", "Dayz Hack v 1.0.exe", "Dayz injector-by vovan.exe", "DayZ Item spawner.exe", "DayZ Private AIM,MAP,WH v1.2.exe", "DayZ-Injector cracked by vovanre.exe", "DayZ-Injector v.0.2.2.exe",
	"DayZ-Injector v0.4.exe", "DayZ-Injector.dll", "dayz-injector.sqf", "DayZ-Injectorcrackedbyvovanre.exe", "DayZ-Injectorv.0.2.2.exe", "DayZ-Injectorv0.4.exe", "Dayz_Namalsk\HP.sqf", "Dayz_Namalsk\menu.sqf", "DayZ_Settings.txt",
	"DayzAIMESPShield.exe", "DayZAimJunkies.exe", "dayzcheat\lcc.exe", "DayzHackv1.0.exe", "Dayzinjector-byvovan.exe", "DayZItemspawner.exe", "DayZLegendZ Scripts\mah.sqf", "DayZLegendZ Scripts\startMenu.sqf",
	"DayZLegendZScripts\mah.sqf", "DayZLegendZScripts\startMenu.sqf", "DayZNavigator.exe", "DayZPrivateAIM,MAP,WHv1.2.exe", "DayZZ.exe", "DCv3\dc.sqf", "de_cba.sqf", "debug_console", "decrypt.sqf", "Deluxe.sqf",
	"Deluxe_97\Deluxe.sqf", "Demonic Menu\scr\startMenu.sqf", "Demonic Menu\TM\STARTMENU.sqf", "DemonicMenu\scr\startMenu.sqf", "DemonicMenu\TM\STARTMENU.sqf", "DevCon.pbo", "dgasadsg_dasgadsg\hint.sqf", "dll\0100100110\start.sqf",
	"dll\0100100110\Starts.sqf", "dll\activator_NR.exe", "dll\BEBypass.dll", "dll\bypass.dll", "dll\D-DayZ.dll", "dll\DayZZ.exe", "dll\epoch\epochMain.sqf", "dll\epochMain.sqf", "dll\GiveItTheDLL.exe", "dll\Hack-Dayz.exe",
	"dll\HVMRuntm.dll", "dll\infiSTAR.dll", "dll\infiSTAR_[www.unknowncheats.me]_.dll", "dll\inject.bat", "dll\MedMen.exe", "dll\MyHack.dll", "dll\NR.exe", "dll\Project1_[www.unknowncheats.me]_.exe", "dll\runme.dll",
	"dll\spawner.dll", "dll\SpawnTool.exe", "dll\ss3.dll", "dll\VGLoader.exe", "dll\vgupdater.exe", "DMR.sqf", "Douggem_Beats_Infistar.dll", "Douggem_beats_infistar_2.1.dll",
	"Douggem_beats_infistar_2.1_[www.www.unknowncheats.me]_.dll", "Douggem_Beats_Infistar_2.2.dll", "Douggem_Beats_Infistar_2.2_[www.www.unknowncheats.me]_.dll", "Douggem_Beats_Infistar_[www.www.unknowncheats.me]_.dll",
	"drhack.dll", "drhack.exe", "Dta\nom.sqf", "DZ\functions\initFunctions.sqf", "EASYTM\start.sqf", "ElektroNuke.sqf", "EmptyDll.dll", "epoch.sqf", "epoch2.sqf", "epoch\epochMain.sqf", "epoch\targetall\fuckserver.sqf",
	"esp.sqf", "ESP\esp_TEST.sqf", "esp_TEST.sqf", "exam.sqf", "exec.sqf", "execl33t.sqf", "ExecMe.sqf", "executev4.sqf", "Expansion\0100100110\start.sqf", "Expansion\0100100110\Starts.sqf", "Expansion\activator_NR.exe",
	"Expansion\Addons\ui_addons.pbo", "Expansion\beta\dll\RayHook.dll", "Expansion\D-DayZ.dll", "Expansion\DayZZ.exe", "Expansion\epoch\epochMain.sqf", "Expansion\epochMain.sqf", "Expansion\GiveItTheDLL.exe",
	"Expansion\Hack-Dayz.exe", "Expansion\HVMRuntm.dll", "Expansion\infiSTAR.dll", "Expansion\infiSTAR_[www.unknowncheats.me]_.dll", "Expansion\inject.bat", "Expansion\MedMen.exe", "Expansion\NR.exe",
	"Expansion\Project1_[www.unknowncheats.me]_.exe", "Expansion\Project1_[www.unknowncheats.me]_.exel", "Expansion\runme.dll", "Expansion\spawner.dll", "Expansion\SpawnTool.exe", "Expansion\ss3.dll", "Expansion\VGLoader.exe",
	"Expansion\vgupdater.exe", "explode.sqf", "explode_all.sqf", "Exta_files\scrollMain.sqf", "FABISDayZLauncher.exe", "FinisTxTMenu\cumpile\dahR_E.sqf", "FinisTxTMenu\MainFile.sqf", "FinizMenuzV4\run.sqf",
	"FinizMenuzV6\config.sqf", "FinizMenuzV6\fns.sqf", "fixed.exe", "fns.sqf", "freddiesexternalmenu\freddies_active.sqf", "freddiesexternalmenuv8\freddies_active.sqf", "fuckbitches.sqf", "gc_menu\starten.sqf",
	"gc_menu\uitvoeren.sqf", "getfile.sqf", "gible.sqf", "gible\gible.sqf", "gible\tp.sqf", "giveesp.sqf", "GiveItTheDLL.exe", "gluemenu.sqf", "GM_Start.sqf", "God mode 1.sqf", "God.sqf", "GodMode.sqf", "Godmode1.sqf",
	"gp.sqf", "Gr8iSgAy\Grt333.sqf", "Grt333.sqf", "Hack-Dayz.exe", "hack.sqf", "HackMenu.exe", "hangender\start.sqf", "Hashtag\#119.sqf", "Hashtag\#cexeetomer.sqf", "Hashtag\#ekun.sqf", "Hashtag\#gathsah.sqf",
	"Hashtag\#llabmob.sqf", "Hashtag\#llatropelet.sqf", "Hashtag\#nepo.sqf", "Hashtag\#pse.sqf", "Hashtag\#srekrampam.sqf", "Hashtag\#tegrat.sqf", "Hashtag\#tegratbmob.sqf", "Hashtag\#txet.sqf", "Hashtag\#yekteg.sqf",
	"Heal.sqf", "hello.sqf", "help.sqf", "hidden.exe", "HideFromAdmins.sqf", "hoen\compile\re.sqf", "hoen\sttart.sqf", "HVMRuntm.dll", "i_n_f_i_S_T_A_R.sqf", "i_n_f_i_S_T_A_R___Menu\list.sqf",
	"i_n_f_i_S_T_A_R___Menu\setup\scrollmenu.sqf", "IAmmo.sqf", "IC_Script.sqf", "icesickles.sqf", "iFuckingLoveMemes\wowGetMemedSonXD_init.sqf", "Infinity_Menu\InfinityMenuV1.sqf", "InfinityMenuV1.sqf", "infiSTAR.dll",
	"infiSTAR.sqf", "infiSTAR_[www.unknowncheats.me]_.dll", "infiSTAR_BLACK\Startup.sqf", "infiSTAR_chewSTAR_Menu\all_misc\nukes\nuke.sqf", "infiSTAR_chewSTAR_Menu\infiSTAR_chewSTAR.sqf",
	"infiSTAR_chewSTAR_Menu\scrollmenu\addweapon.sqf", "infiSTAR_Confin3d_edit\infiSTAR.sqf", "infiSTAR_Confin3d_edit\startup.sqf", "infiSTAR_EIGHT\startup.sqf", "infiSTAR_GOLD\Startup.sqf", "infiSTAR_Menu\setup\startup.sqf",
	"infiSTAR_NEW\Startup.sqf", "infiSTAR_SEVEN\startup.sqf", "infiSTAR_SSH\setup\startup.sqf", "infiSTAR_SSH\startup.sqf", "initFunctions.sqf", "inject.bat", "Injector.exe", "invisible.sqf", "iRap3.sqf", "iRape\iRap3.sqf",
	"iRaPe\iRaP321.sqf", "jestersMENU\jester@start.sqf", "jh\Action.sqf", "JHAction.sqf", "JM3.png", "JM3.sqf", "JME.sqf", "JxMxE.sqf", "kenhack\alltome.sqf", "kenhack\SM\AH6X_DZ.sqf", "kenhack\veshi.sqf", "KillDestroy.sqf",
	"l33tH4o0r\Run.sqf", "l33tH4x0or\execl33t.sqf", "l33tH4x0or\l33tKey.sqf", "l33tH4x0or\L33TMenu.sqf", "l33tH4x0or\Run.sqf", "l33tKey.sqf", "l33tMoney.sqf", "lando3sp.sqf", "lcc.exe", "ldr.cnf", "localBox.sqf",
	"LoganNZL@start.sqf", "LoganNZL\LoganNZL@execute.sqf", "LoganNZL\LoganNZL@start.sqf", "lol.sqf", "LY\start.sqf", "lystoarma3\start.sqf", "M107.sqf", "mah.sqf", "MahMenuV2\compile\ESP.sqf", "mahmenuv2\compile\n00k3.sqf",
	"MahMenuV3\run.sqf", "MahMenuV4\run.sqf", "MAIN.sqf", "MainFile.sqf", "ManN00k3ByD4M4st3rFini.sqf", "ManN0Cl1pFini.sqf", "mapesp.sqf", "MapHack.sqf", "marv\MarvFRAME.sqf", "marv\MARVremotet\MARVFrameScript.sqf",
	"MarvTriple\MarvTripleFRAME.sqf", "MedMen.exe", "meme.sqf", "menu.sqf", "menu\initmenu.sqf", "Menu\start.sqf", "Menu\startup.sqf", "Menu_Scripts\ChernoNuke.sqf", "Menu_Scripts\menu\menu_generate.sqf",
	"Menus\battleHIGH_Menu\startup.sqf", "Menus\infiSTAR_SEVEN\startup.sqf", "Missions\0100100110\start.sqf", "Missions\0100100110\Starts.sqf", "Missions\activator_NR.exe", "Missions\D-DayZ.dll", "Missions\DayZZ.exe",
	"Missions\epoch\epochMain.sqf", "Missions\epochMain.sqf", "Missions\GiveItTheDLL.exe", "Missions\Hack-Dayz.exe", "Missions\HVMRuntm.dll", "Missions\infiSTAR.dll", "Missions\infiSTAR_[www.unknowncheats.me]_.dll",
	"Missions\infiSTAR_SEVEN\startup.sqf", "Missions\infiSTAR_SSH\startup.sqf", "Missions\inject.bat", "Missions\MedMen.exe", "Missions\Menus\battleHIGH_Menu\startup.sqf", "Missions\NR.exe",
	"Missions\Project1_[www.unknowncheats.me]_.exe", "Missions\runme.dll", "Missions\spawner.dll", "Missions\SpawnTool.exe", "Missions\ss3.dll", "Missions\VGLoader.exe", "Missions\vgupdater.exe", "Mizzle\exec.sqf",
	"Mizzle\startup.sqf", "MK\Scripts\startup.sqf", "monky\start.sqf", "Moving_Gun_Menu\start.sqf", "Movinggun_GunMenu2\GM_Start.sqf", "Movinggun_Origin_Pornhub\PornHub.sqf", "Movinggun_Public\MP_Start.sqf", "MP_Start.sqf",
	"MPGH\INITMENU.sqf", "MSSM\main.sqf", "MSSM\seinahax.sqf", "myscript.sqf", "MyScripts\cargo.sqf", "Mystic.sqf", "Negro\stompthepedal.sqf", "new.sqf", "new\spawnme\items\1oz.sqf", "NewDayZ.dll", "News.sqf", "newsbanner.sqf",
	"Newscroll.sqf", "nightsuck.sqf", "NovaHack.sqf", "NR.exe", "NUG.sqf", "Nuke.sqf", "NWAFNuke.sqf", "Obama Drone 0.5.2.1.exe", "ObamaDrone0.5.2.1.exe", "oefexec.dll", "Optix_DayZ_Auto.txt", "OTHER\scripts\fly.sqf",
	"OtherVis.sqf", "painfulanalseks.sqf", "PEWPEWPEWPEW.dll", "ph4nt03ssp.sqf", "ph4nt03xpl0de.sqf", "ph4nt04mm0.sqf", "ph4nt0911.sqf", "Ph4nt0\ph4nt03ssp.sqf", "Ph4nt0\ph4nt03xpl0de.sqf", "Ph4nt0\ph4nt04mm0.sqf",
	"Ph4nt0\ph4nt0911.sqf", "Ph4nt0\ph4nt0b0mb.sqf", "Ph4nt0\ph4nt0g0d.sqf", "Ph4nt0\ph4nt0m3ss4g3.sqf", "Ph4nt0\ph4nt0m4p.sqf", "Ph4nt0\ph4nt0n00k3.sqf", "Ph4nt0\ph4nt0sh131d.sqf", "Ph4nt0\ph4nt0sh13ld.sqf",
	"Ph4nt0\ph4nt0t3p3.sqf", "Ph4nt0\ph4nt0teleall.sqf", "Ph4nt0\ph4nt0v3hg0d.sqf", "Ph4nt0\rrr333.sqf", "Ph4nt0\St3rt.sqf", "ph4nt0b0mb.sqf", "ph4nt0g0d.sqf", "ph4nt0m3ss4g3.sqf", "ph4nt0m4p.sqf", "ph4nt0n00k3.sqf",
	"ph4nt0sh13ld.sqf", "ph4nt0t3p3.sqf", "ph4nt0teleall.sqf", "ph4nt0v3hg0d.sqf", "Pickled Menu 3.0\Scripts\ajmenu.sqf", "PickledMenu3.0\Scripts\ajmenu.sqf", "players\egeg.sqf", "playerTools.sqf", "PRaZ\start.sqf",
	"prep1308.sqf", "Project1.exe", "Project1_[www.unknowncheats.me]_.exe", "public.sqf", "Radar_NewR.exe", "RayHook.dll", "RDMTP.sqf", "renamethis.sqf", "RommelV1\Rexecv1.sqf", "Ronnie\Startup.sqf", "RooslahVeeSevan.sqf",
	"round2\runthis.sqf", "rr33.sqf", "rr333.sqf", "rrr333.sqf", "RSTMU\scr\startMenu.sqf", "run.sqf", "runme.dll", "rus\mission_settings\create.sqf", "Rusterl.exe", "RustleSTAR_Menu\menu\initmenu.sqf",
	"RustleSTAR_Menu\setup\startup.sqf", "safe scripts\gm.sqf", "safescripts\gm.sqf", "Scintilla.dll", "scr\ahbypass.sqf", "scr\Custommenu.sqf", "scr\exec.sqf", "scr\loadfile.sqf", "scr\Run.sqf", "scr\RunAH.sqf",
	"scr\scr\keybinds.sqf", "scr\startMenu.sqf", "scr\Startup.sqf", "scr\STrial.sqf", "scr_wasteland\menu\initmenu.sqf", "screen.sqf", "scrFuckOffInfistar1\start.sqf", "script loader Warrock.exe", "ScriptBasic.sqf",
	"scriptloaderWarrock.exe", "ScriptName.sqf", "scripts\2dmap.sqf", "Scripts\@Hak_script\1.GLAVNOYE\000.sqf", "Scripts\activator_NR.exe", "scripts\addweapon.sqf", "Scripts\ajmenu.sqf", "scripts\ammo 2.sqf", "Scripts\ammo.sqf",
	"scripts\ammo2.sqf", "Scripts\as50kit.sqf", "Scripts\as50twskit.sqf", "Scripts\D-DayZ.dll", "Scripts\darky.sqf", "Scripts\de_cba.sqf", "Scripts\delitem.sqf", "Scripts\delt.sqf", "Scripts\dest.sqf", "Scripts\die.sqf",
	"Scripts\different_AK\AKS-74 Kobra.sqf", "Scripts\different_AK\AKS-74Kobra.sqf", "Scripts\dmrkit.sqf", "Scripts\esp.sqf", "Scripts\ESP\esp_TEST.sqf", "Scripts\exec.sqf", "Scripts\explo.sqf", "Scripts\explode.sqf",
	"Scripts\explode_all.sqf", "Scripts\GiveItTheDLL.exe", "Scripts\God mode 1.sqf", "Scripts\GodMode.sqf", "Scripts\Godmode1.sqf", "Scripts\gunbox.sqf", "Scripts\guns.sqf", "Scripts\heal.sqf", "Scripts\heli.sqf",
	"Scripts\hide.sqf", "Scripts\humanity.sqf", "Scripts\HVMRuntm.dll", "Scripts\inject.bat", "Scripts\invisible.sqf", "Scripts\leave.sqf", "Scripts\list.sqf", "Scripts\m107kit.sqf", "Scripts\mah.sqf", "Scripts\MedMen.exe",
	"Scripts\menu.sqf", "Scripts\Menu_Scripts\ChernoNuke.sqf", "Scripts\Menu_Scripts\ElektroNuke.sqf", "Scripts\Menu_Scripts\empty.sqf", "Scripts\Menu_Scripts\newsbanner.sqf", "Scripts\Menu_Scripts\NWAFNuke.sqf",
	"Scripts\money.sqf", "Scripts\mpghmenu.sqf", "scripts\new.sqf", "Scripts\NR.exe", "Scripts\Nuke.sqf", "Scripts\nwaf.sqf", "Scripts\Project1_[www.unknowncheats.me]_.exe", "Scripts\runme.dll", "Scripts\screen.sqf",
	"Scripts\snipers.sqf", "Scripts\spawner.dll", "Scripts\SpawnTool.exe", "Scripts\ss3.dll", "Scripts\start.sqf", "Scripts\startmenu.sqf", "Scripts\stary.sqf", "Scripts\suv.sqf", "Scripts\test.sqf", "Scripts\tp.sqf",
	"Scripts\tpsave.sqf", "Scripts\weapons.sqf", "Scripts\YoloMenu Updated v6.sqf", "Scripts\YoloMenuUpdatedv6.sqf", "ScriptTelePlayer.sqf", "scroll\startmain.sqf", "scrollz\tp.sqf", "settings26\go.sqf", "settings26\init.sqf",
	"settings26\load.sqf", "settings26\start.sqf", "ShadowyFaze\exec.sqf", "sigdumper.dll", "sigdumper.exe", "skriptexecuter2.exe", "skriptexecuter2.ini", "SlothCheats.sqf", "SpackV2\NAVStart.sqf", "spawner.dll", "Spawner.exe",
	"spawner\dll\GiveItTheDLL.exe", "spawner\dll\inject.bat", "spawner\dll\spawner.dll", "spawner\Expansion\GiveItTheDLL.exe", "spawner\Expansion\inject.bat", "spawner\Expansion\spawner.dll", "spawner\GiveItTheDLL.exe",
	"spawner\inject.bat", "spawner\Missions\GiveItTheDLL.exe", "spawner\Missions\inject.bat", "spawner\Missions\spawner.dll", "spawner\Scripts\GiveItTheDLL.exe", "spawner\Scripts\inject.bat", "spawner\Scripts\spawner.dll",
	"spawner\spawner.dll", "SpawnTool.exe", "ss3.dll", "ssl3.dll", "sstart.sqf", "St3rt.sqf", "start.sqf", "startMenu.sqf", "startup.sqf", "startupMenu.sqf", "stdafx.h", "stompthepedal.sqf", "Supplys\BBstart.sqf",
	"Supplys\giveloadout.sqf", "tbb4malloc_bi.dll", "TBM\compile\re.sqf", "TBM\Run.sqf", "Teleport.sqf", "Templates_Settings.ini", "testest.sqf", "testestt.sqf", "teststartup.sqf", "Text3d.sqf", "TheBatmanHack v2.6.exe",
	"TheBatmanHackv2.6.exe", "TimeDay.sqf", "TM\666.sqf", "TM\clearvar.sqf", "TM\DemonicMenu.sqf", "TM\keybind.sqf", "TM\keymenu.sqf", "TM\menu.sqf", "TM\screen.sqf", "TM\scripts\giveesp.sqf", "TM\start.sqf", "tm\starthack.sqf",
	"TM\startmenu.sqf", "TotalInjector.exe", "TPH\menu.sqf", "TPH\start.sqf", "Ubu5Ukg3.sqf", "uhx_menu_first_ed\menu\logoblue.paa", "ui_addons\decrypt.sqf", "UnlockCarDoor.sqf", "Usefull\AS50 Tws.txt", "Usefull\Chat spammer.txt",
	"Usefull\Delete ALL.txt", "Usefull\DMRKit.txt", "Usefull\Door-Safe Unlocker.txt", "Usefull\ESP.txt", "Usefull\Give Money To Me v2.txt", "Usefull\GiveMoney To Me.txt", "Usefull\GiveMoney To Others.txt", "Usefull\GiveXP.txt",
	"Usefull\Heal.txt", "Usefull\Humanity.txt", "Usefull\KillAll.txt", "Usefull\M110Tws Kit.txt", "Usefull\MAPesp.txt", "Usefull\NoRecoil.txt", "Usefull\playerLevel.txt", "Usefull\Raiding.txt", "Usefull\Remote Killer.txt",
	"Usefull\TAB Menu 24x server.txt", "Usefull\teleALL.txt", "Usefull\TpMapClick.txt", "V3\B1ND.sqf", "V4Run.sqf", "VehDelivery.sqf", "vet@folder\vet@start.sqf", "vg\Custommenu.sqf", "vg\exec.sqf", "vg\Run.sqf", "vg\RunAH.sqf",
	"vg\Startup.sqf", "VGLoader.exe", "vgupdater.exe", "vHMANITYUzu.sqf", "virusexit.sqf", "virusmaines.sqf", "virusmainspawxd.sqf", "virusxd.sqf", "virusxd2.sqf", "VirusXD\virusexit.sqf", "VirusXD\virusmaines.sqf",
	"VirusXD\virusmainspawxd.sqf", "VirusXD\virusxd2.sqf", "VirusXD\virusxdmain.sqf", "VirusXD\virusxdmon.sqf", "virusxdmain.sqf", "virusxdmon.sqf", "vMNOEYzu.sqf", "vscripts\Startup.sqf", "vSGHTZIzu.sqf", "vTEELPROTzu.sqf",
	"VX DAYZ.exe", "VXDAYZ.exe", "Wedor.sqf", "whippy\execute.sqf", "Whippy\playerTools.sqf", "Whippymenu\activate.sqf", "whippymenu\execute.sqf", "Whippymenu\keybindfz.sqf", "WhippyMenu\keybindfz.sqf",
	"WhippyMenu\SqfFiles\destroyb.sqf", "WhippyMenu\SqfFiles\esp.sqf", "WhippyMenu\SqfFiles\night.sqf", "WhippyMenu\SqfFiles\setviewdistance500m.sqf", "WhippyMenu\SqfFiles\unlock.sqf", "whippyv4\executev4.sqf",
	"WhippyV4\execv4.sqf", "WhippyV4\Keybindiezz.sqf", "WhippyV4\WHRSupplies.sqf", "WiglegHacks\mainmenu.sqf", "WipeS.sqf", "wookie.sqf", "wookie_wuat\start.sqf", "wookie_wuat\startup.sqf", "wookiev5.sqf", "worm\sttart.sqf",
	"wowGetMemedSonXD_init.sqf", "WRMoney.sqf", "wtfff.sqf", "wuat.sqf", "wuat\RUN.sqf", "wuat\screen.sqf", "wuat\screen2.sqf", "wuat\Scripts.txt", "wuat\scripts\runMagicaly.sqf", "wuat\standalonemenu.sqf", "wuat\start.sqf",
	"wuat\start1.sqf", "wuat\start3.sqf", "wuat\vet@start.sqf", "X-ray.exe", "Xenos.exe", "Xenos64.exe", "xoia24rfadfhw2\alishcahc.sqf", "xTwisteDx\menu.sqf", "yolo\startup.sqf", "yolo\w4ssup YoloMenu v2.sqf",
	"yolo\w4ssupYoloMenuv2.sqf", "yolo\YoloMenu Updated v6.sqf", "yolo\YoloMenuUpdatedv6.sqf", "YoloHack.dll", "YoloMenu Updated v6.sqf", "YoloMenu.sqf", "YoloMenuUpdatedv6.sqf", "youtube.dll", "Z1\Run.sqf",
	"Z__i_n_f_i_S_T_A_R__Z\Run.sqf"
];

local _badVars = [ //---List of bad files to be checked for
	"A11","abcd","abcdefGEH","absol","actid1","activeITEMlist","activeITEMlistanzahl","actualunit","actualunit_vec","ad44234efdzsf","adadadad23444","adadawer24_1337","adadgvdthw54y64","adasdawer4w3r","adawdawe21",
	"adawedr3q4r3w2qr4","adawredzfdsf","adddaaaaaaaaa","addedPlayers","addgun","AddPlayersToMap","adgnafgnasfnadfgnafgn","admin_animate1","admin_d0","admin_dbclick_ori","admin_debug","Admin_Layout","Admin_Lite_Menu",
	"admin_low_terrain","admin_toggled","admin_vehicleboost","adminadd","adminAntiAggro","admincrate","AdminDialogList","adminESPicons","admingod","adminicons","adminKeybinds","adminlite","adminlitez","AdminLoadOK",
	"AdminLoadOKAY","AdminLst","AdminPlayer","adminZedshld","adr4w5trsdef","ads2542345esfds","advert_SSH","advertising_banner_infiSTAR","aesp","aggron","AH_OFF_LOL","AimAssistUC","aimbott","aintNoAntiHackCatchMyVars",
	"airborne_spawn_vehicle_infiSTAR","aiUnit","ALexc","ALL_MAGS_TO_SEARCH","ALL_WEPS_TO_SEARCH","allMrk","ALREADYRAN","alsonotakeybind","altstate","amm0","anti","ANTI_ANTI_HAX","antiAggro_zeds","antiantiantiantih4x",
	"AntiAntiAntiAntiHax","ANTIHACKKICK","antihacklite","AntihackScrollwheel","antihax2","antiloop","ARGT_JUMP","ARGT_JUMP_a","ARGT_JUMP_d","ARGT_JUMP_s","ARGT_JUMP_w","ARGT_KEYDOWN","Armor1","arr1","asd34r253453453",
	"asdasdasd","asdddddddddddad","Asdf","asdr432r5edfsad","asdsgxfvzv5345","asdw435r325efdsd","ASSPLUNGE","atext","atext_star_xa","Att4chm3nt","aw235resfzdfcs","aW5maVNUQVI_re_1","awdadr3q42","awde3q4erasd","awdet3465taddd",
	"awer234rrsdfcsd","awrdw4355345sfs","Awwwinvisibilty","AzersMultiScript_Scripts","b","B1g_B3n_target","B3_Menu","B3_RapidFire_Toggle","B3_Ultima","B4ckp4cks","b_loop","backpack_spawn","backpackitem_spawn",
	"battleHIGH_vehpub","BB_Menu_Fnc","BB_nofatigue","BB_Pr0_Esp","BBProEsp","BCast","BensWalker","BigBenBackpack","BigFuckinBullets","biggies_menu_open","BIGM","BIS_fnc_3dCredits_n",
	"BIS_MPF_ServerPersistentCallsArray","bl4ck1ist","black1ist","blackhawk_sex","bleh","blfor","blfor2","blfor3","Blue_I_Color_LP","BlurExec","Bobsp","bombs","boolean_1","boomgoats","boost","bowen","Bowen_RANDSTR",
	"bowonky","bowonkys","box","bp","BP_OnPlayerLogin","bpmenu","BTC_liftHudId","BTC_SganciaActionId","bulletcamon","byebyezombies","Bypass","c0lorthem","Called","CALLRE","CALLRESVR","carepkg","carg0d","cargod","cargodv3",
	"cargodz","ceozxignhazju","changebackpack","changeBITCHinstantly","changestats","ChangingBullets_xx","charmeleon","cheatlist","cherno","cherno_resident","cherno_resident_2","chute","cip","civ","Cl0th1ng","cockasdashdioh",
	"color_black","colorme","cooldown","cpbLoops","cpLoopsDelay","cTargetPos","ctrl_onKeyDown","curPos","cursoresp","cus_SPEED_DOWN","custom_clothing","d121435rdsczcawddawdsf","d3245resfrsd","d45y6w45ytrdfragsrega",
	"d4t365tearfsafgrg","D_AMEZ_COA","da124q3easds","da342szvcxzcvx","dadsasdsada","damihakeplz","damikeyz_veryhawt","dance","dark_speed","DarkwrathBackpack","dasd324r245rdsfs","dawerdsczcdsf","dawr5wdfsf23","day",
	"DAYZ_CA1_Lollipops","DAYZ_CREATEVEHICLE","dayz_godmode","dayzforce_save","dayzforce_savex","dayzlogin3","dayzlogin4","dbClicked","ddsfsdfv","DeadCell_AH_fillRE","DeadCell_AHBLACK","debug_star_colorful","debugConsoleIndex",
	"delaymenu","DelaySelected","DELETE_THIS","derp123","DEV_ConsoleOpen","dfgjafafsafccccasd","dfgrgdrfgretg345t345","dfhfgkjjhkhjkdgfg","dgbfzhg5ey456w6s","distanceFromGround","diz_is_real__i_n_f_i_S_T_A_R","dklilawedve",
	"DonorSkins","dontAddToTheArray","drawic","dropnear","dsagfgbdfhgsd","dsfsgfsfsdfsdf","dubky","Dwarden","E3p","E_X_T_A_S_Y_Atm","E_X_T_A_S_Y_Cash_1k_t","E_X_T_A_S_Y_Cash_a","E_X_T_A_S_Y_FuckUp_GunStore_a",
	"E_X_T_A_S_Y_Init_Menu","E_X_T_A_S_Y_Keybinds","E_X_T_A_S_Y_LicenseDrive","E_X_T_A_S_Y_M_E_N_U_funcs_inited","E_X_T_A_S_Y_Menu_LOOOOOOOOOL","E_X_T_A_S_Y_Recoil","ealxogmniaxhj","ebay_har","eeeeeeewwwwwwwww",
	"eExec_commmand","efr4243234","enamearr","entupautowalk","envi","epchDeleted","epochBackpack","epochExec","epochMapMP","epochRemoteNukeAll","epochTp","equalESP","equalGOD","eroticTxt","ESP","esp2ez","ESP_Count",
	"ESPEnabled","espfnc","espOn","espOn3","ewrfdfcsf","executeglobal","executer","exstr","exstr1","Extasy","eyghrdfyh","F0od_Dr1nk","f313131FukDaPolice1324e","Fanatic_InfiPass","fapcar","fapEsp","fapEspGroup","fapg0d",
	"fapgod","fapLayer","fastwalk","fatguybeingchasedbyalion","faze_fill","faze_funcs_inited","faze_getControl","faze_initMenu","fazelist","fcukupstar","fddsjfakioiweurlkjs","fdsgdr42424","fdsgdr42424ZombieColor",
	"feastge4rt636te5","fefq34tqtrafg","fesf4535teaf","fetg5e4ytdrg","few3t5364etsfg","ffafsafafsfsgol","fffffffffff","First_PAGE","firstrun","fixMenu","Flare","Flare1","Flare2","Flare3","Flare4","Flare5","Flare6","Flare7",
	"Flare8","fn_esp","fn_filter","fn_genStrFront","fn_ProcessDiaryLink","fnc_allunits","fnc_MapIcons_infiSTAR","fnc_temp","FND_fnc_select","FND_fnc_spawn_veh","FND_fnc_subs","fnx3","font","footSpeedIndex","footSpeedKeys",
	"forwardAndBackward","FOXBYPASS","fredtargetkill","friendlies","fryt5tytfshyfkj","fsdandposanpsdaon","fsdddInfectLOL","fsfgdggdzgfd","fT","fuckmegrandma","FUCKTONIC","FUK_da_target","func_execOnServer","fzhgdhhbzfhzfghz",
	"g0d","g0dmode","G_A_N_G_S_T_A","Gashhey_ESP","gdzhzthtdhxthh6757","GearAdd","GearRemove","Get_in_D","GetinPassenger","getrekt","getX","gffffffffffffffh","gfYJV","ggggg","GGhakeplz","GGkeyz_veryhawt","GLASS911_Run",
	"globalplaya","GlobalSleep","glueallnigga","gluemenu","gmadmin","gmdadmin","GMod","go_invisible_infiSTAR","god","godall","godlol","GodLolPenis","GodMode","godmode_off","godmode_on","gyjjgcjcj","gzgdghragfzdgvdz","Hack",
	"Hack_Pos_Orig","hacks","haHaFuckAntiHakcsManIbypasDatShit","hangender","hax_toggled","HaxSmokeOn","haxx0rlek","HDIR","hdtrhyztyh","heal","heel","helpmenu","hfghfg","hgjghjfrdfeewrferrt43","HMDIR","hoenUSABLE","hostage",
	"hotkeymenu","hovering","hoverPos","howMuchToGive","hthxhzhgcbcxvb","htjhytu6waqe3q45","htmlz","htmlzV4","htrukilojhkukvh","hub","HumanityVal","i","I_love_rustler_and_jet","i_t_s__m_e_o","iaimon","iammox","iBeFlying",
	"idonteven","igodokxtt","ihatelife","iluio9pilkgvuk","img","imhornyaf","inf3MMO","inf_ammo_loop_infiSTAR","infammo","infAmmoIndex","infammook","infammoON","infi_STAR_code_stored","infi_STAR_exec","infi_STAR_output",
	"infiniteammo","infiSTAR_chewSTAR_dayz_1","infiSTAR_fill_Weapons","infiSTAR_fillHax","infiSTAR_FILLPLAYER","infiSTAR_fillRE","infiSTARBLACK","infiSTARBOTxxx","inflan","infoe","init_Fncvwr_menu_star","init_main","initarr",
	"initarr2","initarr3","initre337","input_text","inSub","Intro","inv","invall","iRape_iRap3u","iRaPeclick","iRapeKiduKnow","iRaPezClick","IRCModule","isAdmin","isExecuted","isInSub","Isogay","isori","isRottatin","It3m5",
	"itemmenu","items1","j","Jay_g0d_M0de","jayRE","JayT3L3Click","JayT3L3Eclick","jizz","JJJJ_MMMM___EEEEEEE_INIT_MENU","JJMMEE_Swagger","jkh","JME_ANAL_PLOW","JME_deleteC","JME_has_yet_to_fuck_this_shit","JME_Keybinds",
	"JME_KillCursor","JME_M_E_N_U_hax_toggled","JME_M_E_N_U_initMenu","JME_MENU_Sub","JME_menu_title","JME_OPTIONS","JME_Red","JME_Sub","JME_Tele","jopamenu","JxMxE_EBRP","JxMxE_Exec","JxMxE_GOD","JxMxE_Heal","JxMxE_hide",
	"JxMxE_Infect","JxMxE_LifeCash500k","JxMxE_secret","JxMxE_TP","JxMxE_Veh_M","JxMxEsp","k","kanghaskhan","key_combos_ftw","keybindings","keybindings_exec","keybindings_xxx","keybindloop","keybinds","keybindz","keyForward",
	"keymenu","keyp","keypress","keypress_exec","keypress_xxx","keyspressed","kickable","kill_all_star","killme","kk","kkk","kosmicisgod","kW_O_O_K_I_E_Go_Fast","l0l","l33tAllP","l33tBoxes","l33tCoin","l33tdistance","l33tDN",
	"l33thtmlv1","l33thumanity","l33tJumenu","l33tMain","l33tMapESPLunsear","l33tSecurity","l33tv4html","lalf","lapras","lazy_ILHA_is_lazy","leftAndRight","lel","letmeknow","Lexstr","Lhacks","life_no_injection","list_wrecked",
	"Listw","ljkluilufgdsgzgzdrf324","lkjhgfuyhgfd","Lmenu1","lmzsjgnas","loadmain","loadMenu","locdb","LOKI_GUI_Key_Color","lol","loldami","lolGG","loopfredtpyoutome","Lpic","LtToTheRacker","LuL1ee7FF1","LVMmenu_stored",
	"ly5t1c","LY_GetObject","LY_Run","LY_Swagger","LYST1C_UB3R_L33T_Item","Lysto_Lyst","lystobindkeys","LystoDone","lystoKeypress","m0nky","M3d1c4l","M_e_n_u_2","magazines_spawn","magnet","magnetmenu","magnetomortal","mahcaq",
	"main","MainMenu","MainScripts","MajorHageAssFuckinfBulletsDude","MakeRandomSpace","Malcars","malfly","Malvsm","manatee_craft_menu","mapclick","MapClicked","MapClickedPosX","mapEnabled","maphalf","mapm","mapopt",
	"mapscanrad","mark","mark_player","marker","markerCount","markeresp","markers","markerThread","markPos","material","MathItem","MCheats_Clip_F","mehatingjews","melee_startAttack","menu","Menu_I_Off_Color_LP",
	"Menu_I_On_Color_LP","Menu_I_Run_Color_LP","Menu_Init_Lol","menu_run","menu_toggle_on","Menue_Vehicle","MenuInitLol","Menulocations","MENUTITLE","Metallica_infiSTAR_hax_toggled","Metallica_vehicleg0dv3_infiSTAR",
	"miltank","MiZ_Run","MiZ_Scripts","mk2","MM_150","MMYmenu_stored","MOD_EPOCH","mod_select","monkaiin","monkaiinsalt","monkey","monky","Monky_funcs_inited","Monky_hax_dbclick","Monky_hax_toggled","Monky_initMenu",
	"monkyintmenu","monkytp","moptions","morph","morphm3","morphme","morphtoanimals","MouseUpEvent","move_forward","MoviNametmr2","MP_ESP_Var1esp","MP_ESP_Var1HudSize","MP_ESP_Var2HudCp","MP_ESP_Var2HudCv","MP_ESP_Var2HudDist",
	"muk","murkrow","musekeys","MV","my_anus_hurtz","MY_KEYDOWN_FNC","Mystic_ESP","n0clip","name","namePlayer","nametagThread","Namey","napa","nb","nd","nec2","neo_throwing","newMessage","NienUntoten","night","nlist",
	"nocollide","noctowl","norekoil","nukeDONEstar","nvg","nwaf","oaks","objMYPlayer","ohhpz","oighijkfcjloypysh","omgwtfbbq","onisinfiniteammobra","onKeyPress","Orange_I_Color_LP","ozpswhyx","p","P4nt0n4t0r_Ph4nt0","palkia",
	"part88","passcheck","patharray","pathtoscrdir","pathtoscrdir3","pbx","PermDialogSelected","peter_so_fly_CUS","pfEpochTele","pfKeygen","pfnlist","pfPickPlayer","pfPlayerMonitor","pfPlayerMonitorMutex","pfPlayersToMonitor",
	"pfScanUnits","pfselecteditem","pfshnext","pfshnmenu","pfShowPlayerMonitor","ph4nt0_j3susm0d3","ph4nt0_j3susm0d3D","Ph4nt0_jessus","ph4nt0b0mb","ph4nt0Dayz","ph4nt0Epoch","Ph4nt0mz","Ph4nt0mzBomb","Ph4nt0mzBtbuildings",
	"Ph4nt0mzBtmsg","Ph4nt0mzBtunits","ph4nt0mzClick","ph4nt0mzEclick","ph4nt0mzMsg","ph4nt0mzMsgHandle","ph4nt0mzParae","ph4nt0mzParau","ph4nt0mzWait","Ph4nt0n4t0r_ph4_t3hm4n","Ph4nt0n4t0r_Ph4nt0","Ph4nt0n4t0r_Ph4nt0mz","pic",
	"pidgeotto","pidgey","piloswine","pilot","planeGroup","playerDistanceScreen","playeresp","playericons","players","playershield","PlayerShowDistance","pList","pList_star_peter_cus","plrshldblckls","plrshldblcklst","pm",
	"pnc","poalmgoasmzxuhnotx","poiuytfczsvtg","POLICE_IN_HELICOPTA","pos","possible","Pro_RE","Proceed_3B","Proceed_BB","ProDayz","prore","PSwap","ptags","pu","PV_AdminMainCode","PV_AdminMenuCode","PV_AdminMenuCodee",
	"PV_CHECK","PV_DevUlDs","PV_IAdminMenuCode","PV_TMPBAN","PVAH_admin_rq","PVAH_AdminRequest","PVAH_AdminRequestVariable","PVAH_AHTEMPBAN","PVAH_writelog_rq","PVAH_WriteLogRequest","PVDZ_AdminMenuCode","PVDZ_hackerLog",
	"PVDZ_Hangender","PVDZ_SUPER_AdminList","q","q25t3qttsdfaf","qodmotmizngoasdommy","qofjqpofq","qopfkqpofqk","quake","qwak","R3m0te_RATSifni","r_menu","raichu","rainbow_var","rainbowbitch","RAINBOWREMEXECVEH","rainbowTarget",
	"rainbowTarget1","rainbowTarget2","rainbowTarget3","RandomEx","rangelol","ratingloop_star","rdfor","rdfor2","rdfor3","rdgfdzgzrfgr","re_loop","recon","REdasfsfwef","refreshPlayers","reinit","rekted","rem","Remexec_Bitch",
	"removegrass","Repair","RepairIT","returnString_z","RGB","rgyehgdrfhg","rspwn","runHack","runonce","rustlinginit","saddaaaaaaaadd23","sandshrew","sandslash","sbp","sbpc","sceptile15","sceptile27","sceptile279","sCode",
	"Script","scroll_m_init_star","scrollAim","scrollinit","scrollmenu","scrollPlayerlist","sdfwesrfwesf233","sdfxdcfs3","sdgff4535hfgvcxghn","sdsf45t3rsgfd","SelectDelay","selecteditem","selectedPlayer","sendMessage",
	"sendmsg12","serverObjectMonitor","sexymenu_adds_Star","sfewsrw","sfg4w3t5esfsdf","sfsdfsdf4333","sfsefse","sgdfgzgdzfrgfdg","sgstgr4stwe4t","ShadowyFaz3VehZ","shazbot","shazbot1","shiftMenu","shnext","shnmenu","shrekt",
	"shth654436tj","SimpleMapHackCount","skinmenu","skype_img","skype_option","slag","smissles","sosjfosjdfojsdfijojx","spawn_explosion_target_ebay","spawnitems1","spawnmenu","spawnvehicles_star","spawnweapons1",
	"Speed_Hack_cus","spwnwpn","SpyglassFakeTrigger","sr3453sdfsfe33","srgte54y6rdgtrg","ssdfsdhsdfh","startmenu_star","Stats","stop","SuperAdmin_MENU","surrmenu","survcam","swaf","swmb","sxy_list_stored","T","t0ggl3",
	"T0ol_it3ms","t123nt3SP","T3le","T_o_g_g_l_e_3B","T_o_g_g_l_e_BB","TAG_onKeyDown","take1","tangrowth27","targetnig3","TargetPlayer","teepee","telep","telet","teletoplr","tell_me_more_infiSTAR","TempDialogSelected",
	"TentS","terrainchangintime","testIndex","theKeyControl","thermal","TheTargetedFuckingPlayerDude","thfile","thingtoattachto","thuytshujsr65uy","time","timebypass","timeday","Tit_Choppertimer","title_dialog","tlm",
	"tlmadminrq","tMenu","tmmenu","togESP4","toggle","toggle_1","toggle_keyEH","toLower_new","Tonic_has_a_gaping_vagina","TPCOUNTER","tpTarget","tr3nHudCp","tr3nHudCv","tr3nHudDist","tr3ntHudSize","tr3ntitudsize",
	"Tractor_Time","trap","trentesp","trentview","TTT5OptionNR","tw4etgetControl","tw4etinitMenu","typeVec","Ug8YtyGyvguGF","unitList","unitList_vec","unitsmenu","upAndDown","v","v3hA10","v3hAh1z","v3hAH64D","v3hAmbuBMP",
	"v3hArmedLittleBird","v3hARMEDSUV","v3hATV","v3hAV8B2","v3hBlackhawk","v3hBRDM","v3hBTR60","v3hCamel","v3hChinook","v3hcrows","v3hF35B","v3hGMGJACKAL","v3hGPK","v3hGRAD","v3hHuey","v3hka52","v3hKA60","v3hLAV25","v3hM1A1",
	"v3hMLRS","v3hStryker","v3hSUV","v3hT34","v3hT55","v3hT72","v3hT90","v3hVenom","v3hWildcat","v3hZU23","v_bowen","vars","veh","Veh_S_P_A_W_N_Shitt","Veh_Spawn_Shitt","vehC","vehD","vehiclebro","vehicleg0dv3_BushWookie",
	"vehiclegooov3ood_BushWookie","VehicleMarkers","VehicleMenue","vehicles1","vehiList","vhnlist","ViLayer","viname","VL","vm","VMmenu_stored","vspeed","W00kie_Init_Menu","W00kie_Pro_RE","W00kieMenu_hax_toggled","W34p0ns",
	"W_0_0_K_I_E_Pro_RE","W_O_O_K_I_E_ANTI_ANTI_HAX","W_O_O_K_I_E_Car_RE","W_O_O_K_I_E_Debug_1337","W_O_O_K_I_E_Debug_Mon","W_O_O_K_I_E_FuckUp_GunStore_a","W_O_O_K_I_E_FUD_Car_RE","W_O_O_K_I_E_FUD_FuckUp_GunStore",
	"W_O_O_K_I_E_FUD_M_E_N_U_initMenu","W_O_O_K_I_E_FUD_Pro_RE","W_O_O_K_I_E_M_E_N_U_funcs_inited","W_O_O_K_I_E_Pro_RE","W_O_O_K_I_E_RE","wadgrfgzrd","walkloc","walrein820","Wannahaveexplosivesforbullets","weapFun",
	"weaponBoxeriino","weapons_spawn","wepmenu","whatisthis4","whippyhtmlz","whippyhtmlzV4","WhippyV4_PPAdd","WhippyV4MAPESP_MA","whitelist","wierdo","wiglegsuckscock","wl","Wookie","Wookie_Car_RE","Wookie_Debug_Mon",
	"Wookie_Exec","Wookie_Init_Menu","Wookie_List","Wookie_Pro_RE","wookiewuat","work","wormBomb","wormBomb2","wormPos","wormRound","wpnbox","wtfyisthisshithere","wuat_fpsMonitor","xdistance","xtags","xtags_star_xx","xyzaa",
	"xyzxrxxaahhh","xZombieBait","y6sretysrt","yanma","yer652374rfd","ygurv1f2","yiukfligzsgargfrae","yo2","yo3","yo4","YOLO","yothefuckingplayerishere","youwantgodmodebro","zany","ZedProtect","ZeenatorrrClick",
	"ZeenatorrrEclick","zeloBomb","zeloFpos","Zen4ddammo","Zenbandit","ZendoRepair","Zenheal","Zenhero","zeus","zeus_star","zeusmode","ZobieDistanceStat","zombieDistanceScreen","zombies","ZoombiesCar", "RhynoV1",
	"RhynoV1ESP", "RhynoV1_FNC_ESP_distance"
];

/* ******************************************************* */