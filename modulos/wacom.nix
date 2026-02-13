{pkgs, config, ...}:
{
	services.xserver.wacom.enable = true;
	
	services.libinput.enable = true;
	
	services.libinput.mouse.middleEmulation = false;
	services.libinput.touchpad.middleEmulation = false;

	environment.systemPackages = with pkgs; [
    		autocutsel
  	];

}
