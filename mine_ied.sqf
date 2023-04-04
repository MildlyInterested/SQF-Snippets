/*
	Creates a secondary explosion once IED/Mine/Tripwire is triggered or defused.
	In editor place code in init field of IED/Mine/Tripwire.
	Remove comments in code after copying to init field, the init field does not support comments.
	Delete debug line and/or hideObjectGlobal if you don't want to hide the mine/IED.
*/
if (not local this) exitWith {};
this hideObjectGlobal true;
this addEventHandler ["Explode", {
	params ["_projectile", "_pos", "_velocity"];
	"DEBUG: Mine/IED BOOM" remoteExec ["systemChat", 0];
	("rhs_ammo_fab500" createVehicle getpos _projectile) setDamage 1;
}];

// Same as above but will explode on (ACE) defuse
if (not local this) exitWith {};
this hideObjectGlobal true;
this addEventHandler ["Deleted", {
	params ["_projectile"];
	"DEBUG: Mine/IED BOOM" remoteExec ["systemChat", 0];
	("rhs_ammo_fab500" createVehicle getpos _projectile) setDamage 1;
}];