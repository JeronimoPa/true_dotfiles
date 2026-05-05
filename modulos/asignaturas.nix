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
				clang-tools
				cbmc
				



				#c y cpp
				unityhub
				dotnet-sdk_9


				nodejs
				postman
				mongodb-compass
				android-studio
        ];
		programs.nix-ld.enable = true;
		programs.nix-ld.libraries = with pkgs;[
			llvmPackages_18.llvm
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

