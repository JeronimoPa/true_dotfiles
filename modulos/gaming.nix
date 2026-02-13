{ pkgs, pkgs-yuzu,pkgs-unstable,... }:

{
  environment.systemPackages = with pkgs; [
	cartridges
    #actualizar proton
    protonup-ng
    #stats mid gameplay
    mangohud
    #minecraft
    prismlauncher
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
  ]++[pkgs-yuzu.torzu]++[pkgs.deadlock-mod-manager];
  programs={
  	steam = {
		enable = true;
		protontricks.enable = true;
	};
	gamemode.enable = true;

  };
  	services.archisteamfarm={
		enable = true;
		settings = { Statistics = false; };
		bots.primero={
			enabled = true;
			username = "sin_nombre_123";
		};
		web-ui = { enable = true; };
	};
  services.flatpak.enable = true;
}
