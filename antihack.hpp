class AH_RscEdit
{
	access = 0;
	type = 2;
	x = 0;
	y = 0;
	h = 0.04;
	w = 0.2;
	colorBackground[] = {0,0,0,1};
	colorText[] = {0.95,0.95,0.95,1};
	colorSelection[] = {0.8784,0.8471,0.651,1};
	autocomplete = "";
	text = "";
	size = 0.2;
	style = "0x00 + 0x40";
	font = "Zeppelin32";
	shadow = 2;
	sizeEx = 0.03921;
};

class AH_RscListBox
{
	access = 0;
	type = 5;
	w = 0.4;
	h = 0.4;
	rowHeight = 0;
	colorText[] = {1,1,1,1};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0.95,0.95,0.95,1};
	colorSelect2[] = {0.95,0.95,0.95,1};
	colorSelectBackground[] = {0,0,0,1};
	colorSelectBackground2[] = {0.8784,0.8471,0.651,1};
	colorBackground[] = {0,0,0,1};
	soundSelect[] = {"",0.1,1};
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
	style = 64;
	font = "Zeppelin32";
	shadow = 2;
	sizeEx = 0.03921;
	color[] = {1,1,1,1};
	period = 1.2;
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};

class AH_RscCombo
{
	access = 0;
	type = 4;
	style = 0;
	colorSelect[] = {0.023529,0,0.0313725,1};
	colorText[] = {0.023529,0,0.0313725,1};
	colorBackground[] = {0.95,0.95,0.95,1};
	colorScrollbar[] = {0.023529,0,0.0313725,1};
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelectBackground[] = {0.8784,0.8471,0.651,1};
	arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] = {0,0,0,0.6};
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	font = "Zeppelin32";
	sizeEx = 0.03921;
};

class AH_RscShortcutButton
{
	type = 16;
	x = 0.1;
	y = 0.1;
	class HitZone
	{
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};
	class ShortcutPos
	{
		left = 0.0145;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	class TextPos
	{
		left = 0.05;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	shortcuts[] = {};
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	color[] = {0.8784,0.8471,0.651,1};
	color2[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {1,1,1,1};
	colorBackground2[] = {1,1,1,0.4};
	class Attributes
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	idc = -1;
	style = 0;
	default = 0;
	shadow = 2;
	w = 0.183825;
	h = 0.104575;
	periodFocus = 1.2;
	periodOver = 0.8;
	animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
	period = 0.4;
	font = "Zeppelin32";
	size = 0.03921;
	sizeEx = 0.03921;
	text = "";
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
	action = "";
	class AttributesImage
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
	};
};

class AH_RscFrame
{
	type = 0;
	idc = -1;
	style = 64;
	shadow = 2;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "Zeppelin32";
	sizeEx = 0.02;
	text = "";
};

class AH_RscText
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 2;
	font = "Zeppelin32";
	SizeEx = 0.03921;
};

class AH_RscButton
{
	colorText[] = {1,1,1,1};
	colorDisabled[] = {0.4,0.4,0.4,1};
	colorBackground[] = {0.698,0.133,0.133,1};
	colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
	colorBackgroundActive[] = {1,0,0,1};
	colorFocused[] = {1,0.537,0,1};
	colorShadow[] = {0.023529,0,0.0313725,1};
	colorBorder[] = {0.023529,0,0.0313725,1};
	soundEnter[] = {"\ca\ui\data\sound\mouse2",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0.09,1};
	soundClick[] = {"\ca\ui\data\sound\mouse3",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\mouse1",0.09,1};
	shadow = 2;
	access = 0;
	text = "";
	type = 1;
	style = "0x02 + 0x100";
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};

class StaffDialog
{
    idd = 6969;
	movingenable = 0;
    class Controls
    {
		class RscText_1000: AH_RscText
		{
			idc = 1000;
			x = 0.127604 * safezoneW + safezoneX;
			y = 0.10463 * safezoneH + safezoneY;
			w = 0.745417 * safezoneW;
			h = 0.792037 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class RscText_1001: AH_RscText
		{
			idc = 1001;
			text = "";
			style = 0x02;
			x = 0.127604 * safezoneW + safezoneX;
			y = 0.104629 * safezoneH + safezoneY;
			w = 0.745417 * safezoneW;
			h = 0.042037 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class RscListbox_1500: AH_RscListbox
		{
			idc = 1500;
			x = 0.158854 * safezoneW + safezoneX;
			y = 0.20463 * safezoneH + safezoneY;
			w = 0.182917 * safezoneW;
			h = 0.578148 * safezoneH;
		};
		class RscListbox_1501: AH_RscListbox
		{
			idc = 1501;
			x = 0.346354 * safezoneW + safezoneX;
			y = 0.25463 * safezoneH + safezoneY;
			w = 0.307917 * safezoneW;
			h = 0.527778 * safezoneH;
		};
		class RscFrame_1800: AH_RscFrame
		{
			idc = 1800;
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.20463 * safezoneH + safezoneY;
			w = 0.182917 * safezoneW;
			h = 0.436481 * safezoneH;
		};
		class RscCombo_2100: AH_RscCombo
		{
			idc = 2100;
			x = 0.377605 * safezoneW + safezoneX;
			y = 0.204629 * safezoneH + safezoneY;
			w = 0.245417 * safezoneW;
			h = 0.042037 * safezoneH;
		};
		class RscText_1002: AH_RscText
		{
			idc = 1002;
			text = "";
			style = 0x02;
			x = 0.158854 * safezoneW + safezoneX;
			y = 0.175926 * safezoneH + safezoneY;
			w = 0.182916 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class RscText_1003: AH_RscText
		{
			idc = 1003;
			text = "";
			style = 0x02;
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.175926 * safezoneH + safezoneY;
			w = 0.182916 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class RscText_1004: AH_RscText
		{
			idc = 1004;
			text = "";
			style = 0x02;
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.787037 * safezoneH + safezoneY;
			w = 0.182916 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class RscText_1005: AH_RscText
		{
			idc = 1005;
			text = "";
			style = 0x02;
			x = 0.158854 * safezoneW + safezoneX;
			y = 0.78611 * safezoneH + safezoneY;
			w = 0.182916 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class RscText_1006: AH_RscText
		{
			idc = 1006;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.211111 * safezoneH + safezoneY;
			w = 0.0579159 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1400: AH_RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.211111 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscText_1007: AH_RscText
		{
			idc = 1007;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.244444 * safezoneH + safezoneY;
			w = 0.057916 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1401: AH_RscEdit
		{
			idc = 1401;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.244444 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1402: AH_RscEdit
		{
			idc = 1402;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.277777 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscText_1008: AH_RscText
		{
			idc = 1008;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.277777 * safezoneH + safezoneY;
			w = 0.057916 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1403: AH_RscEdit
		{
			idc = 1403;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.311111 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscText_1009: AH_RscText
		{
			idc = 1009;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.311111 * safezoneH + safezoneY;
			w = 0.057916 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1404: AH_RscEdit
		{
			idc = 1404;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.344444 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscText_1010: AH_RscText
		{
			idc = 1010;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.344444 * safezoneH + safezoneY;
			w = 0.057916 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1405: AH_RscEdit
		{
			idc = 1405;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.377777 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscText_1011: AH_RscText
		{
			idc = 1011;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.377777 * safezoneH + safezoneY;
			w = 0.057916 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1406: AH_RscEdit
		{
			idc = 1406;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.411111 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscText_1012: AH_RscText
		{
			idc = 1012;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.411111 * safezoneH + safezoneY;
			w = 0.057916 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1407: AH_RscEdit
		{
			idc = 1407;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.444444 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscText_1013: AH_RscText
		{
			idc = 1013;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.444444 * safezoneH + safezoneY;
			w = 0.057916 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscText_1014: AH_RscText
		{
			idc = 1014;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.477777 * safezoneH + safezoneY;
			w = 0.057916 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1408: AH_RscEdit
		{
			idc = 1408;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.477777 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscText_1015: AH_RscText
		{
			idc = 1015;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.511111 * safezoneH + safezoneY;
			w = 0.057916 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1409: AH_RscEdit
		{
			idc = 1409;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.511111 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscText_1016: AH_RscText
		{
			idc = 1016;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.544444 * safezoneH + safezoneY;
			w = 0.057916 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1410: AH_RscEdit
		{
			idc = 1410;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.544444 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscText_1017: AH_RscText
		{
			idc = 1017;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.577777 * safezoneH + safezoneY;
			w = 0.057916 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1411: AH_RscEdit
		{
			idc = 1411;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.577777 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1412: AH_RscEdit
		{
			idc = 1412;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.611111 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscText_1018: AH_RscText
		{
			idc = 1018;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.611111 * safezoneH + safezoneY;
			w = 0.057916 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscFrame_1803: AH_RscFrame
		{
			idc = 1803;
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.644445 * safezoneH + safezoneY;
			w = 0.182917 * safezoneW;
			h = 0.138333 * safezoneH;
		};
		class RscText_1019: AH_RscText
		{
			idc = 1019;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.651852 * safezoneH + safezoneY;
			w = 0.0579159 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1413: AH_RscEdit
		{
			idc = 1413;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.651852 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1414: AH_RscEdit
		{
			idc = 1414;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.685285 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscText_1020: AH_RscText
		{
			idc = 1020;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.685285 * safezoneH + safezoneY;
			w = 0.0579159 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1415: AH_RscEdit
		{
			idc = 1415;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.718618 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscText_1021: AH_RscText
		{
			idc = 1021;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.718618 * safezoneH + safezoneY;
			w = 0.0579159 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscEdit_1416: AH_RscEdit
		{
			idc = 1416;
			text = "";
			x = 0.721354 * safezoneW + safezoneX;
			y = 0.751951 * safezoneH + safezoneY;
			w = 0.117812 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscText_1022: AH_RscText
		{
			idc = 1022;
			text = "";
			x = 0.658854 * safezoneW + safezoneX;
			y = 0.751951 * safezoneH + safezoneY;
			w = 0.0579159 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscText_1023: AH_RscText
		{
			idc = 1023;
			text = "";
			style = 0x02;
			x = 0.346354 * safezoneW + safezoneX;
			y = 0.786111 * safezoneH + safezoneY;
			w = 0.307917 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class RscFrame_1804: AH_RscFrame
		{
			idc = 1804;
			x = 0.127604 * safezoneW + safezoneX;
			y = 0.10463 * safezoneH + safezoneY;
			w = 0.745417 * safezoneW;
			h = 0.792037 * safezoneH;
		};
		class RscEdit_1417: AH_RscEdit
		{
			idc = 1417;
			text = "";
			x = 0.346354 * safezoneW + safezoneX;
			y = 0.82685 * safezoneH + safezoneY;
			w = 0.307916 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class RscShortcutButton_1700: AH_RscShortcutButton
		{
			idc = 1700;
			text = "";
			x = 0.70677 * safezoneW + safezoneX;
			y = 0.81111 * safezoneH + safezoneY;
			w = 0.0870833 * safezoneW;
			h = 0.0605555 * safezoneH;
		};
		class RscShortcutButton_1701: AH_RscShortcutButton
		{
			idc = 1701;
			text = "";
			x = 0.206771 * safezoneW + safezoneX;
			y = 0.81111 * safezoneH + safezoneY;
			w = 0.0870833 * safezoneW;
			h = 0.0605555 * safezoneH;
		};
		class RscButton_1600: AH_RscButton
		{
			idc = 1600;
			text = "";
			x = 0.846353 * safezoneW + safezoneX;
			y = 0.108333 * safezoneH + safezoneY;
			w = 0.0245835 * safezoneW;
			h = 0.0355555 * safezoneH;
		};
	};
};

class InputDialog
{
	idd = 6970;
	movingenable = 0;
	class Controls
	{
		class RscText_1000: AH_RscText
		{
			idc = 1000;
			x = 0.346354 * safezoneW + safezoneX;
			y = 0.30463 * safezoneH + safezoneY;
			w = 0.307917 * safezoneW;
			h = 0.242037 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: AH_RscText
		{
			idc = 1001;
			text = "";
			style = 0x02;
			x = 0.346354 * safezoneW + safezoneX;
			y = 0.30463 * safezoneH + safezoneY;
			w = 0.307917 * safezoneW;
			h = 0.042037 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class RscText_1002: AH_RscText
		{
			idc = 1002;
			text = "";
			style = 0x02;
			x = 0.346354 * safezoneW + safezoneX;
			y = 0.40463 * safezoneH + safezoneY;
			w = 0.0579167 * safezoneW;
			h = 0.042037 * safezoneH;
		};
		class RscEdit_1400: AH_RscEdit
		{
			idc = 1400;
			x = 0.408855 * safezoneW + safezoneX;
			y = 0.412963 * safezoneH + safezoneY;
			w = 0.182917 * safezoneW;
			h = 0.0262963 * safezoneH;
		};
		class RscShortcutButton_1700: AH_RscShortcutButton
		{
			idc = 1700;
			text = "";
			x = 0.545313 * safezoneW + safezoneX;
			y = 0.486112 * safezoneH + safezoneY;
			w = 0.0777082 * safezoneW;
			h = 0.0605557 * safezoneH;
		};
		class RscShortcutButton_1701: AH_RscShortcutButton
		{
			idc = 1701;
			text = "";
			x = 0.377604 * safezoneW + safezoneX;
			y = 0.486111 * safezoneH + safezoneY;
			w = 0.0777082 * safezoneW;
			h = 0.0605557 * safezoneH;
		};
		class RscText_1003: AH_RscText
		{
			idc = 1003;
			text = "";
			style = 0x02;
			x = 0.377604 * safezoneW + safezoneX;
			y = 0.364814 * safezoneH + safezoneY;
			w = 0.245417 * safezoneW;
			h = 0.0225927 * safezoneH;
		};
		class RscText_1004: AH_RscText
		{
			idc = 1004;
			text = "";
			style = 0x02;
			x = 0.377604 * safezoneW + safezoneX;
			y = 0.464815 * safezoneH + safezoneY;
			w = 0.245417 * safezoneW;
			h = 0.0225927 * safezoneH;
		};
		class RscFrame_1800: AH_RscFrame
		{
			idc = 1800;
			x = 0.346354 * safezoneW + safezoneX;
			y = 0.30463 * safezoneH + safezoneY;
			w = 0.307917 * safezoneW;
			h = 0.242037 * safezoneH;
		};
	};
};

class InjectorDialog
{
	idd = 6971;
	movingenable = 0;
	class Controls
	{
		class RscText_1000: AH_RscText
		{
			idc = 1000;
			x = 0.283854 * safezoneW + safezoneX;
			y = 0.20463 * safezoneH + safezoneY;
			w = 0.432916 * safezoneW;
			h = 0.592037 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: AH_RscText
		{
			idc = 1001;
			text = "";
			style = 0x02;
			x = 0.283854 * safezoneW + safezoneX;
			y = 0.20463 * safezoneH + safezoneY;
			w = 0.432917 * safezoneW;
			h = 0.0429629 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class RscEdit_1400: AH_RscEdit
		{
			idc = 1400;
			style = "0x00 + 16";
			linespacing = 1;
			x = 0.295833 * safezoneW + safezoneX;
			y = 0.254629 * safezoneH + safezoneY;
			w = 0.408437 * safezoneW;
			h = 0.467037 * safezoneH;
		};
		class RscShortcutButton_1700: AH_RscShortcutButton
		{
			idc = 1700;
			text = "Server";
			x = 0.315105 * safezoneW + safezoneX;
			y = 0.727778 * safezoneH + safezoneY;
			w = 0.0709374 * safezoneW;
			h = 0.0614814 * safezoneH;
		};
		class RscShortcutButton_1702: AH_RscShortcutButton
		{
			idc = 1701;
			text = "Local";
			x = 0.465104 * safezoneW + safezoneX;
			y = 0.727778 * safezoneH + safezoneY;
			w = 0.0709374 * safezoneW;
			h = 0.0614814 * safezoneH;
		};
		class RscShortcutButton_1701: AH_RscShortcutButton
		{
			idc = 1702;
			text = "Global";
			x = 0.614583 * safezoneW + safezoneX;
			y = 0.727778 * safezoneH + safezoneY;
			w = 0.0709374 * safezoneW;
			h = 0.0614814 * safezoneH;
		};
		class RscButton_1600: AH_RscButton
		{
			idc = 1600;
			text = "";
			x = 0.690624 * safezoneW + safezoneX;
			y = 0.208333 * safezoneH + safezoneY;
			w = 0.0240625 * safezoneW;
			h = 0.0355556 * safezoneH;
		};
		class RscFrame_1800: AH_RscFrame
		{
			idc = 1800;
			x = 0.283854 * safezoneW + safezoneX;
			y = 0.20463 * safezoneH + safezoneY;
			w = 0.432916 * safezoneW;
			h = 0.592037 * safezoneH;
		};
	};
};