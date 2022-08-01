BEA_fnc_ext = {
	call compile ('EXT' callExtension _this);
};

BEA_fnc_checkFiles = {
	private ['_puid', '_task', '_taskId', '_taskResult', '_puid', '_puid'];
	_puid = _this select 1;
	_task = (format['CheckFiles|%1', _puid]) call BEA_fnc_ext;
	if ((_task select 0) != 1) exitWith {}; // ext call failed
	_taskId = _task select 1;
	waitUntil {((format['Result|%1', _taskId]) call BEA_fnc_ext) != 2};
	_taskResult = (format['Result|%1', _taskId]) call BEA_fnc_ext;
	if ((_taskResult select 0) != 1) exitWith {}; // ext method call failed
	_taskResult select 1
};

BEA_fnc_log = {
	private ['_type', '_message'];
	_type = _this select 0;
	_message = _this select 1;
	(format['Log|%1|%2', _type, _message]) call BEA_fnc_ext;
};

BEA_fnc_ban = {
	private ['_puid', '_length', '_reason'];
	_puid = _this select 0;
	_length = _this select 1;
	_reason = _this select 2;
	(format['Ban|%1|%2|%3', _puid, _length, _reason]) call BEA_fnc_ext;
};

