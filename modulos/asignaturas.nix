{pkgs,config, ... }:
{

  	environment.systemPackages = with pkgs; [
                lazydocker
				maven
				

                clips
                vscode
                
                #DA
                gnumake
                gnuplot
                xdot
                gdb
                
				jetbrains.idea
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

