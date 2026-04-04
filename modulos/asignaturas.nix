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

				clang-tools							#c y cpp
				unityhub
				dotnet-sdk_9

				nodejs
				postman
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

