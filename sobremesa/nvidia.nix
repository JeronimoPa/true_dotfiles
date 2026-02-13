{config,pkgs,...}:

{
	nixpkgs.config.allowUnfree = true;
	services.xserver.videoDrivers = ["nvidia"];
	boot.initrd.kernelModules = [ 
	"nvidia" 
	#"nvidia_modeset"
    	#"nvidia_uvm"
    	#"nvidia_drm"
	];
	boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
	boot.blacklistedKernelModules = [ "nouveau" ];
	#boot.kernelParams = ["nvidia_drm.modeset=1"];

	#para tener el kernel actualizado(a la mas nueva y estable)
	
	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = true;
		powerManagement.finegrained = false;
		
		open = false;
		nvidiaSettings = true;
		package=config.boot.kernelPackages.nvidiaPackages.stable;
	};
	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};
	hardware.graphics.extraPackages = with pkgs; [ 
	    	mesa
    		vulkan-loader
    		vulkan-tools
    		vulkan-validation-layers
	];
}

