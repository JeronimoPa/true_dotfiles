{pkgs,config, ... }:
{

  	environment.systemPackages = with pkgs; [
				#ISI
                lazydocker
				maven
				jetbrains.idea

				#IA
                clips
                vscode
                
                #DA
                gnumake
                gnuplot
                xdot
                gdb
                
				#colaborador
				clang_multi

				unityhub
				dotnet-sdk_9
        ];
		virtualisation.docker.enable = true;
users.users.jeronimo.extraGroups = [ "docker" ];
virtualisation.docker.rootless = {
  enable = true;
  setSocketVariable = true;
};

  #mysql para bd
  services.mysql={
  	enable = true;
  	package = pkgs.mariadb;
  };
}

