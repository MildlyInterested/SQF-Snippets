/* 
	For use in ZEUS.
	Stops AI from auto engaging in combat etc., they will bassically only move.
	Once suppressed they will be able to engage again and all other functions are reenabled.
	AI in vehicles do not get suppressed, only once the vehicles is damaged and they get out they will be suppressed.
	Written for use with the LAMBS Danger.fsm mod but can be used without.
	Execute the following on group in zeus (execute on target), do not include this comment.
	Delete debug line.
*/
{
    _x setVariable ["lambs_danger_disableAI", true]; 
    _x setVariable ["lambs_danger_forceMove", true]; 
    _x disableAI "TARGET"; 
    _x disableAI "FSM"; 
    _x disableAI "COVER";
	_x disableAI "AUTOCOMBAT";
	_x disableAI "CHECKVISIBLE";
    _x setUnitPos "AUTO";
	_x addEventhandler ["Suppressed", {
		params ["_unit"];
		"DEBUG: AI Smart again" remoteExec ["systemChat", 0];
		_unit setVariable ["lambs_danger_disableAI", nil];
		_unit setVariable ["lambs_danger_forceMove", nil];
		_unit enableAI "TARGET"; 
		_unit enableAI "FSM";
		_unit enableAI "COVER";
		_unit enableAI "AUTOCOMBAT";
		_unit enableAI "CHECKVISIBLE";
		_unit setUnitPos "AUTO";
		_unit setBehaviourStrong "COMBAT";
		_unit removeEventHandler ["Suppressed", _thisEventHandler]; }];
} foreach units _this;
_this allowFleeing 0;
_this setBehaviourStrong "AWARE";
_this setSpeedMode "FULL";