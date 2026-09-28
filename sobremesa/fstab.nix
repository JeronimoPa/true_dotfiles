{pkgs, config, ...}:
{
	fileSystems."/mnt/data" = {
		device = "/dev/disk/by-uuid/488C6CC88C6CB1DC";  # Usa el UUID del disco
		fsType = "ntfs";  # Cambia según tu sistema de archivos
		options = [ "defaults" ];  # Opciones de montaje opcionales
	};

}
