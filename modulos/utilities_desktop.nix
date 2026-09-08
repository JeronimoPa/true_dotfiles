{pkgs, config, ...}:
{
	xdg.portal.enable = true;
	xdg.portal.extraPortals = [pkgs.xdg-desktop-portal];
	xdg.portal.config.common.default = "*";
	
	services.xserver.enable = true;
	services.xserver.displayManager.lightdm = {
		enable = true;
		#greeter.enable = true;
		greeters.gtk.enable = true;
		
	};
	services.libinput = {
		enable = true;
		mouse = {
			accelProfile = "flat";
			accelSpeed = "0";
		};
	};
	security.pam.services.lightdm.enableGnomeKeyring = true;
	services.xserver.xkb = {                                                                   
		layout = "es";                                                                           
		variant = "";                                                                            
	};                                                                                         
	services.dbus.enable = true;

	programs.dconf.enable = true;                                                                                             


	console.keyMap = "es";
 	services.xserver.windowManager.bspwm.enable = true;
	
	programs.thunar.enable = true;
	services.gvfs.enable = true;
	services.udisks2.enable = true;
	
	#services.easyeffects.enable=true;
	environment.systemPackages = with pkgs;
	[
		file-roller
		xss-lock
		arandr
		xsecurelock

		slop
		maim
		xdotool
		
		crosspipe
		#easyeffects

		bitwarden-desktop

		brightnessctl

		#nautilus

		#resource monitor:
		btop
		#file manager
		ranger
		#resource bar
		quickshell
		polybar
		#image viewer
		feh
		#si no lo pongo no funciona
		sxhkd
		#dmenu
		rofi
		rofi-games
		rofi-power-menu

		#theming for apps
		gnome-themes-extra
		adwaita-icon-theme
		papirus-icon-theme

		fastfetch

		picom


	];
	environment.variables = {
  		XCURSOR_THEME = "Bibata-Modern-Ice";
  		XCURSOR_SIZE = "24";
};
}
