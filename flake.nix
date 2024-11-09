{
    description = "System configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

        stylix.url = "github:danth/stylix";

        firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
        firefox-addons.inputs.nixpkgs.follows = "nixpkgs";

        nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
        nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, nixos-wsl, home-manager, ...}@inputs:
        let 
            system = "x86_64-linux";
            pkgs = inputs.nixpkgs.legacyPackages.${system};
            pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};
            pkgs-firefox = inputs.firefox-addons.packages.${system};
        in {
            nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
                specialArgs = {inherit inputs system pkgs-stable pkgs-firefox;};
                modules = [
                    ./nixos/configuration.nix
		            ./nixos/wsl.nix
                    nixos-wsl.nixosModules.default {
                        system.stateVersion = "24.05";
                        wsl.enable = true;
                    }
                ];
            };

            nixosConfigurations.zenith = nixpkgs.lib.nixosSystem {
                specialArgs = {inherit inputs system pkgs-stable pkgs-firefox;};
                modules = [
                    ./nixos/configuration.nix
		            ./nixos/zenith.nix
                ];
            };

            homeConfigurations.donielmaker = home-manager.lib.homeManagerConfiguration {
                extraSpecialArgs = {inherit inputs system pkgs-stable pkgs-firefox;};
                modules = [ ./home-manager/home.nix ];
                inherit pkgs;
            };
        };
}
