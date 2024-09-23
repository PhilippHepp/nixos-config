{

	description = "System configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
		nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
	};

	outputs = { self, nixpkgs, nixos-wsl, home-manager, ...}: {
		nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
			modules = [
				./nixos/configuration.nix
				nixos-wsl.nixosModules.default {
					system.stateVersion = "24.05";
					wsl.enable = true;
				}
			];
		};
        homeConfigurations.donielmaker = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages."x86_64-linux";
            modules = [./home-manager/home.nix];
        };
    };
}
