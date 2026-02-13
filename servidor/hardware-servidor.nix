{pkgs, ...}:
{
	services.logind = {
		settings.Login=
		{	
			HandlePowerKey			= "ignore";
			HandleLidSwitch			= "ignore";
			HandleLidSwitchDocked		= "ignore";
			HandleLidSwitchExternalPower	= "ignore";

			#powerKeyLongPress = "ignore"; # optional but recommended
		};
  	};

}
