{pkgs, config, ...}:
{
	xdg.portal.enable = true;
	xdg.portal.extraPortals = [pkgs.xdg-desktop-portal];
	services.xserver.enable = true;
	services.xserver.displayManager.lightdm = {
		enable = true;
		#greeter.enable = true;
		greeters.gtk.enable = true;
	};
services.xserver.xkb = {                                                                   
    layout = "es";                                                                           
     variant = "";                                                                            
  };                                                                                         
 services.dbus.enable = true;

 programs.dconf.enable = true;                                                                                             
   # Configure console keymap                                                                 
	#services.resolved.enable = true;


   console.keyMap = "es";
 	services.xserver.windowManager.bspwm.enable = true;
	networking.networkmanager.enable = true;
	
	programs.thunar.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  security.polkit.enable = true;

	environment.systemPackages = with pkgs;
	[
		lxqt.lxqt-policykit

		brightnessctl

		#nautilus

		networkmanagerapplet
		#resource monitor:
		btop
		#file manager
		ranger
		#resource bar
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


		winetricks
	];
	environment.variables = {
  		XCURSOR_THEME = "Bibata-Modern-Ice";
  		XCURSOR_SIZE = "24";
};
}
