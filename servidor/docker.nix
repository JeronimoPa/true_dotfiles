{pkgs, ...}:
{
	virtualisation.docker.enable = true;
	users.extraGroups.docker.members = [ "jeronimo" ];
	
	networking.firewall.allowedTCPPorts = [ 24872 ];
	networking.firewall.allowedUDPPorts = [ 24872 ];
	
	virtualisation.oci-containers = {
		backend = "docker";

		containers.yuzu-room = {
			image = "k4rian/yuzu-room:latest";

			# Default yuzu-room port
			ports = [
				"24872:24872/tcp"
				"24872:24872/udp"
			];

			volumes = [
				"/var/lib/yuzu-room:/config"
			];

			environment = {
				ROOM_NAME = "Servidor bacano";
				YUZU_BINDADDR ="0.0.0.0"; 
				ROOM_DESCRIPTION = "yuzu-room pero en basado";
				ROOM_PORT = "24872";#para asegurarlo
				MAX_CONNECTIONS = "16";
				LOG_LEVEL = "info";
				YUZU_PASSWORD = "helloworld";
			};

			autoStart = true;
		};
	};
}
