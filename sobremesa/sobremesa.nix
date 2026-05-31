{pkgs, config, ...}:
{
	networking.hostName = "Sobremesa";
	services.xserver.xrandrHeads = [ 
		{
			output = "DP-0";
			primary=true;
			monitorConfig = ''
				Option "PreferredMode" "1920x1080"
				Option "Position" "0 268"
			'';
		}
		{
			output = "HDMI-0";
			primary = false;
			monitorConfig = ''
      			Option "Rotate" "left"
				Option "Position" "1920 0"
			'';
		}
	];	
}
