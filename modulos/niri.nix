{pkgs, lib,...}:
{
	programs.niri={
		enable = true;
		useNautilus = false;
	};
	environment.systemPackages = with pkgs; [
		xwayland-satellite
		quickshell
		libnotify
	];
	programs.xwayland.enable = true;
}
