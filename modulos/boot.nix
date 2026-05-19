{pkgs,config, ... }:
{
# Disable systemd-boot
  boot.loader.systemd-boot.enable = false;
        ##boot.kernelPackages = pkgs.linuxKernel.kernels.linux_zen;
  # Allow GRUB to write to EFI variables
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable GRUB
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";  # <--- very important: only install to the NVMe
    efiInstallAsRemovable = false;
    };
  boot.loader.grub.configurationLimit = 2;
        
	#networking.useDHCP = false;

	hardware.enableAllFirmware = true;
	#	services.logind.settings.Login = ''
	#	HandleBrightnessKeys=yes
	#'';
	services.logind = {
		settings.Login.HandlePowerKey= "ignore";
		#powerKeyLongPress = "ignore"; # optional but recommended
  	};
}
