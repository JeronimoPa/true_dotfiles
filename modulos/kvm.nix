{pkgs, config, ...}:

{
	virtualisation.libvirtd =
	{
		enable = true;
		qemu.runAsRoot = false; # allows user-mode operation
		qemu.swtpm.enable = true;
	};
	users.users.jeronimo.extraGroups = ["libvirtd" "kvm"];
    programs.virt-manager.enable = true;


	environment.systemPackages = with pkgs; [
  		qemu_kvm        # QEMU with KVM support
  		virt-viewer
	];

	boot.kernelModules = [ "kvm" "kvm-amd" ];  # for AMD

}    

