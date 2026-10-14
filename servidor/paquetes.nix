{pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		vim
		git
		fastfetch
		xorg.xauth	
];
  

}
