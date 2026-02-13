{pkgs, config, ...}:
{
  	environment.systemPackages = with pkgs; [
		pcsx2
#		rpcs3	
		duckstation
	];
}
