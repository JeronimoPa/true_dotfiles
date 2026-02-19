{pkgs, ...}:
{
	services.syncthing = 
	{
		enable = true;
		openDefaultPorts=true;
		systemService=true;
		guiAddress = "0.0.0.0:8384";
	};
	networking.firewall =
	{
		enable = true;
		allowedTCPPorts = [
		8384 			#syncthing ui
		22000 			#syncthing
		
		22 			#ssh
		];
	
		allowedUDPPorts = [
		21027
		];
	};

	services.grafana= 
	{
		enable = true;
		openFirewall = true;
		settings = {
			server = {
				http_addr = "0.0.0.0";
			};
		};
	};

	services.n8n.enable = true;
	
	services.openssh={
		enable = true;
		settings = {
			X11Forwarding = true;
			X11DisplayOffset = 10;
			X11UseLocalhost = true;
		};
	};
  	networking.networkmanager.enable = true;
	nix.settings.experimental-features = ["nix-command" "flakes"];
}
