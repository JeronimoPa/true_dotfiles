{pkgs,pkgs-yuzu, ...}:
{
	environment.systemPackages = with pkgs; [
		vim
		git
		fastfetch
		xorg.xauth	
]++[pkgs-yuzu.torzu];
  

}
