{pkgs,config, ... }:
{
	hardware.bluetooth = {
		enable = true;	
		powerOnBoot = true;
		input.General = {
			ClassicBondedOnly = false;
			UserspaceHID = true;
		};
	};
	services.blueman.enable = true;
}
