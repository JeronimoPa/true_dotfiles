{pkgs, lib,...}:
let 
set-hz = pkgs.writers.writePython3Bin "set-hz" {} (builtins.readFile ./niri/set-hz.py);
  get-hz = pkgs.writers.writePython3Bin "get-hz" {flakeIgnore = [ "E501" ];} (builtins.readFile ./niri/get-hz.py);
	in
{
	programs.niri={
		enable = true;
		useNautilus = false;
	};
	environment.systemPackages = with pkgs; [
		xwayland-satellite
			quickshell
			libnotify
	]++[set-hz get-hz];
	programs.xwayland.enable = true;
}
