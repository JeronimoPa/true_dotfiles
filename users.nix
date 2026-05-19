{pkgs, config, ...}:
{

  #boot.kernelPackages = pkgs.linuxKernel.kernels.linux_6_14;
  users.users.jeronimo = {
    isNormalUser = true;
    description = "jeronimo";
    extraGroups = [ "networkmanager" "wheel" "gamemode" "audio"];
  };
}
