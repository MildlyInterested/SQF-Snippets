/* 
	For use in EDITOR.


	Copies class names of all items in the inventory of all playable units to clipboard.
	Includes weapons, backpacks, uniform, etc.

	
	Execute the following in the debug console in the editor.
*/

AllPlayableUnitsItems = [];
{AllPlayableUnitsItems = AllPlayableUnitsItems + [(headgear _x)] + [(goggles _x)] + (assignedItems _x) + (backpackitems _x)+ [(backpack _x)] + (uniformItems _x) + [(uniform _x)] + (vestItems _x) + [(vest _x)] + (magazines _x) + (weapons _x) + (primaryWeaponItems _x)+ (primaryWeaponMagazine _x) + (handgunMagazine _x) + (handgunItems _x) + (secondaryWeaponItems _x) + (secondaryWeaponMagazine _x)} forEach (playableUnits + switchableUnits);
AllPlayableUnitsItems = AllPlayableUnitsItems select {count _x > 0};
AllPlayableUnitsItems = AllPlayableUnitsItems arrayIntersect AllPlayableUnitsItems;
copyToClipboard str AllPlayableUnitsItems;