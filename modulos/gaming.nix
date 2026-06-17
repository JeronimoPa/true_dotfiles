{ pkgs, pkgs-yuzu,pkgs-unstable,lib,... }:

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
	hardware.graphics.extraPackages32 = [ pkgs.pkgsi686Linux.libGL ];
	hardware.graphics.extraPackages = [ pkgs.libGL ];
	#hardware.graphics.extraPackages = [ pkgs.pkgsi686Linux.libglvnd ];

	environment.systemPackages = with pkgs; [
		winetricks

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

		xdg-utils

		ryubing

		wine64
		winetricks
		
		#wfinfo
		freetype
		jq
	]++[]++[
		adwaita-icon-theme
		gnome-themes-extra
		gtk4
		gtk3
	];
	programs={
		steam = {
			enable = true;
			extraPackages = with pkgs; [
			pkgs.pkgsi686Linux.libGL 
			pkgs.libGL
			pkgs.mesa
			pkgs.pkgsi686Linux.mesa
			];
			protontricks.enable = true;
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
