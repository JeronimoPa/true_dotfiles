{pkgs, config, ...}:
{
	networking.hostName = "Sobremesa";
	services.xserver.xrandrHeads = [ 
		{
			output = "DP-0";
			primary=true;
			monitorConfig = "1920x1080@164";
		}
	];	
}
