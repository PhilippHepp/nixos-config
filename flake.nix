{
    description = "System configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

        nixos-wsl = {
            url = "github:nix-community/NixOS-WSL/main";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager/release-24.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, nixos-wsl, home-manager, ...}@inputs:
        let 
            system = "x86_64-linux";
        in {
            nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
                specialArgs = {inherit inputs;};
                modules = [
                    ./nixos/configuration.nix
                    nixos-wsl.nixosModules.default {
                        system.stateVersion = "24.05";
                        wsl.enable = true;
                    }
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.donielmaker = import ./home-manager/home.nix;
                    }
                ];
                inherit system;
            };

            # homeConfigurations.donielmaker = home-manager.lib.homeManagerConfiguration {
            #     extraSpecialArgs = {inherit inputs;};
            #     pkgs = nixpkgs.legacyPackages.${system};
            #     modules = [ 
            #         ./home-manager/home.nix
            #         ./home-manager/oh-my-posh.nix
            #     ];
            # };
        };
}
