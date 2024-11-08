{
    description = "System configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
        nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, nixos-wsl, home-manager, ...}@inputs:
        let 
            system = "x86_64-linux";
        in {
            nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
                specialArgs = {inherit inputs;};
                modules = [
                    ./nixos/configuration.nix
		            ./hosts/wsl.nix
                    nixos-wsl.nixosModules.default {
                        system.stateVersion = "24.05";
                        wsl.enable = true;
                    }
                ];
            };

            nixosConfigurations.zenith = nixpkgs.lib.nixosSystem {
                specialArgs = {inherit inputs;};
                modules = [
                    ./nixos/configuration.nix
		            ./hosts/zenith.nix
                ];
            };

            homeConfigurations.donielmaker = home-manager.lib.homeManagerConfiguration {
                extraSpecialArgs = {inherit inputs;};
                pkgs = nixpkgs.legacyPackages.${system};
                modules = [ ./home-manager/home.nix ];
            };
        };
}
