{lib,...}:
{
	disko.devices = {
		disk = {
			disquito = {
				device = "/dev/nvme0n1";
				type = "disk";
				content = {
					type = "gpt";
					partitions = {
						ESP = {
							priority=1;
							type = "EF00";
							size = "1G";
							content = {
								type = "filesystem";
								format = "vfat";
								mountpoint = "/boot";
								mountOptions = [ "umask=0077" ];
							};
						};
						root = {
							priority=2;
							size = "127G";
							content = {
								type = "filesystem";
								format = "ext4";
								mountpoint = "/";
							};
						};
						juegos = {
							priority=3;
							end = "-8G";      # termina 8G antes del final del disco
							content = { type = "filesystem"; format = "ext4"; mountpoint = "/games"; };
						};

						swap = {
							priority=4;
							size = "100%";    # los 8G restantes
							content = { type = "swap"; discardPolicy = "both"; };
						};

					};
				};
			};
		};
	};
}
