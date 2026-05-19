{ pkgs, pkgs-yuzu,pkgs-unstable,... }:

{
	services = {
		udev = {
			packages = with pkgs; [
				game-devices-udev-rules
			];
			enable = true;
		};
	};
	hardware.uinput.enable = true;
	services.udev.extraRules = ''
  # Nintendo Switch 2 Pro Controller
  SUBSYSTEM=="usb", ATTR{idVendor}=="057e", MODE="0666"

  # Input devices (gamepads)
  KERNEL=="event*", SUBSYSTEM=="input", MODE="0666"
	'';
	environment.systemPackages = with pkgs; [
		cartridges
		#actualizar proton
		protonup-ng
		#stats mid gameplay
		mangohud
		#minecraft
		prismlauncher
		#modrinth-app
		#juegos y vainas
		bottles
		#3ds
		azahar
		#mods para ror
		r2modman
		#autoclicker
		xclicker
		#hub para gaming
		heroic
		#gui para mangohud
		goverlay

		parsec-bin
	]++[pkgs-yuzu.torzu]++[pkgs.deadlock-mod-manager]++[
			adwaita-icon-theme
			gnome-themes-extra
			gtk4
			gtk3
		];
	programs={
		steam = {
			enable = true;
			protontricks.enable = true;
			#			package = pkgs.steam.override {
			#				extraPkgs = pkgs: with pkgs; [
			#					# X11 / input
			#					libxi
			#					libxtst
			#					libxcursor
			#					libxrandr
			#					libxinerama
			#					libxrender
			#					libxcomposite
			#					libxdamage
			#
			#					# GTK / UI (GTK2 es CLAVE)
			#					gtk2
			#					gdk-pixbuf
			#					fontconfig
			#					freetype
			#					harfbuzz
			#
			#					# Audio
			#					pipewire
			#					pulseaudio
			#
			#					# Video
			#					libvdpau
			#
			#					# Compression
			#					bzip2
			#				];
			#			};
		};
		gamemode.enable = true;

	};

	#	services.archisteamfarm={
	#		enable = true;
	#		settings = { Statistics = false; };
	#		bots.primero={
	#			enabled = true;
	#			username = "sin_nombre_123";
	#		};
	#		web-ui = { enable = true; };
	#	};
	services.flatpak.enable = true;
}
