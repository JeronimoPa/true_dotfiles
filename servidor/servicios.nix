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
		22 			#ssh
		];
	
		allowedUDPPorts = [
		];
	};


	services.n8n={
		enable = true;
		openFirewall=true;
		environment={
			N8N_SECURE_COOKIE=false;
		};
	};
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
