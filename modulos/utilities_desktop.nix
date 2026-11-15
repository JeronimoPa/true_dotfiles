{pkgs, config, ...}:
{
	#para fightcade creo
	xdg.portal.enable = true;
	xdg.portal.extraPortals = [pkgs.xdg-desktop-portal];
	xdg.portal.config.common.default = "*";
	
	#lightdm
	services.xserver.enable = true;
	services.xserver.displayManager.lightdm = {
		enable = true;
		#greeter.enable = true;
		greeters.gtk.enable = true;
		
	};
	#raton del pc principal
	services.libinput = {
		enable = true;
		mouse = {
			accelProfile = "flat";
			accelSpeed = "0";
		};
	};

	#keyring
	services.gnome.gnome-keyring.enable = true;

	security.pam.services.lightdm.enableGnomeKeyring = true;
	services.xserver.xkb = {                                                                   
		layout = "es";                                                                           
		variant = "";                                                                            
	};                                                                                         
	services.dbus.enable = true;

	programs.dconf.enable = true;                                                                                             


	console.keyMap = "es";

	#services.easyeffects.enable=true;
}
