{
	description = "Mi nuevo flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.11";
		nixpkgs-yuzu.url = "nixpkgs/nixos-24.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
		nvf.url = "github:notashelf/nvf/v0.8";
	};

	outputs = {self, nixpkgs,nixpkgs-yuzu, home-manager,nixpkgs-unstable,nvf, ...}:
		let
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs=nixpkgs.legacyPackages.${system};
			pkgs-yuzu = nixpkgs-yuzu.legacyPackages.${system};
			pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
			base = [
			./users.nix
                                #nvf.nixosModules.default # <- this imports the NixOS module that provides the options
                                #./nvf-configuration.nix


			./modulos/boot.nix
			./modulos/gaming.nix
			./modulos/kvm.nix
			./modulos/lsp.nix
			./modulos/mgs.nix
			./modulos/nix.nix
			./modulos/shell.nix
			./modulos/ubicacion.nix
			./modulos/utilities.nix
			./modulos/utilities_desktop.nix
			./modulos/wacom.nix
			./modulos/asignaturas.nix
			./modulos/bluetooth.nix
			];
		in
		{
			nixosConfigurations = {
				PortatilNegrozma = lib.nixosSystem {
					inherit system;#system=system
					specialArgs = {
					    inherit pkgs-yuzu pkgs-unstable;
					};
					modules =base++[

						./portatil/hardware-configuration.nix
						./portatil/amd.nix
						./portatil/portatil.nix
                                                
					];
				};
				Sobremesa = lib.nixosSystem {
					inherit system;
					specialArgs = {
					    pkgs-yuzu = pkgs-yuzu;
						inherit pkgs-unstable;
					};
					modules =base++[
						./sobremesa/sobremesa.nix
						./sobremesa/fstab.nix
						./sobremesa/hardware-configuration.nix
						./sobremesa/nvidia.nix
					];
				};
				servidor-nixos = lib.nixosSystem {
					inherit system;
					specialArgs = {
					    inherit pkgs-yuzu;
					};
					modules = [
						./modulos/ubicacion.nix
						./servidor/hardware-servidor.nix
						./servidor/boot-server.nix
						./servidor/servidor.nix
						./servidor/paquetes.nix
						./servidor/servicios.nix
						./servidor/hardware-configuration.nix
						./users.nix
					];
				};
			};
			homeConfigurations."jeronimo" = home-manager.lib.homeManagerConfiguration
			{
				inherit pkgs;
				#specialArgs = {
				#    pkgs-yuzu = pkgs-yuzu;  
				#};
				modules =[
					./jero.nix
				];
			};
		};
}
