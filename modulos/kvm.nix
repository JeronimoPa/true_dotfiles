{pkgs, config, ...}:

{
	virtualisation.libvirtd =
	{
		enable = true;
		qemu.runAsRoot = false; # allows user-mode operation
	};
	users.users.jeronimo.extraGroups = ["libvirtd" "kvm"];
        


	environment.systemPackages = with pkgs; [
  		virt-manager    # GUI to manage VMs
  		qemu_kvm        # QEMU with KVM support
  		virt-viewer
	];

	boot.kernelModules = [ "kvm" "kvm-amd" ];  # for AMD

}    

