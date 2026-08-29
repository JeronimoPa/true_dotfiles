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
	systemd.services.disable-alsa-auto-mute = {
		description = "Disable ALSA Auto-Mute for ALC897";

		wantedBy = [ "sound.target" ];
		after = [ "sound.target" ];

		serviceConfig = {
			Type = "oneshot";
			ExecStart =
				"${pkgs.alsa-utils}/bin/amixer -c 2 sset 'Auto-Mute Mode' Disabled";
		};
	};
}
