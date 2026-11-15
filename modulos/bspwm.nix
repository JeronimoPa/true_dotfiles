{pkgs, config, ...}:
{
 	services.xserver.windowManager.bspwm.enable = true;
	
	#para thunar
	programs.thunar.enable = true;
	services.gvfs.enable = true;
	services.udisks2.enable = true;
	
	#notificaciones
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
	programs.i3lock = {
		enable = true;
		package = pkgs.i3lock-color;
	};
	programs.xss-lock = {
		enable = true;
		lockerCommand = "${pkgs.i3lock-color}/bin/i3lock-color -i /home/jeronimo/.config/fotos/kid-named-pubert.jpg --scale";
	};
	environment.systemPackages = with pkgs;
	[
		#para el touchpad
		xinput
		
		#ui para capturas
		zenity
		
		#whatsapp
		zapzap
		
		#.zip
		file-roller
		
		#pantallas
		arandr
		
		#capturas
		slop
		maim
		xdotool
		
		#audio, un poco pocho
		crosspipe
		
		#brillo en pantalla
		brightnessctl


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

		#obvio
		fastfetch
		
		#compositor
		picom

	];
}
