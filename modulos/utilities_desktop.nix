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
 	services.xserver.windowManager.bspwm.enable = true;
	
	programs.thunar.enable = true;
	services.gvfs.enable = true;
	services.udisks2.enable = true;
	
	services.dunst={
		enableX11 = true;
		enable = true;
		settings = {
			global = {
				font = "Iosevka Nerd Font 24";
				width = 500;
				height = 300;
				offset = "10x10";
				origin = "top-right";
				frame_width = 5;
				corner_radius = 6;
			};
			urgency_normal = {
				background	=	"#272727";
				foreground	=	"#fd7f18";
				frame_color	=	"#cb231c";
				fullscreen = 	"delay";
				timeout = 		5;
			};
		};
		
	};
	programs.i3lock.enable = true;   # instala i3lock y configura PAM
		programs.xss-lock = {
			enable = true;
			lockerCommand = "${pkgs.i3lock}/bin/i3lock -c 000000";
		};

	#services.easyeffects.enable=true;
	environment.systemPackages = with pkgs;
	[
		xinput

		zenity

		zapzap
		file-roller
		arandr

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
}
