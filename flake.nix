{
    description = "System configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

        #stylix.url = "github:danth/stylix";

        firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
        firefox-addons.inputs.nixpkgs.follows = "nixpkgs";

        nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
        nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, nixos-wsl, home-manager, ...}@inputs:
        let 
            # System settings #
            system = "x86_64-linux";
            hostname = "zenith"; # Default
            username = "donielmaker";
            mail = "daniel.schmidt0204@gmail.com";
            dotfiles = "/home/${username}/.config";

            # Package declaration #
            pkgs = import nixpkgs {inherit system; config.allowUnfree = true;};
            pkgs-stable = import inputs.nixpkgs-stable {inherit system; config.allowUnfree = true;};
            pkgs-firefox = inputs.firefox-addons.packages.${system};
        in {
            nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
                specialArgs = {inherit 
                        inputs
                        system username mail dotfiles
                        pkgs pkgs-stable pkgs-firefox;
                };
                modules = [
                    ./nixos/configuration.nix
                    (import ./nixos/zenith.nix {inherit hostname;})
                ];
            };

            nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
                specialArgs = {inherit
                        inputs
                        system username dotfiles mail
                        pkgs pkgs-stable pkgs-firefox;
                };
                modules = [
                    ./nixos/configuration.nix
                    ./nixos/wsl.nix
                    nixos-wsl.nixosModules.default {
                        system.stateVersion = "24.05";
                        wsl.enable = true;
                    }
                ];
                inherit system;
            };

            homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
                extraSpecialArgs = {inherit
                        inputs
                        system dotfiles username mail
                        pkgs pkgs-stable pkgs-firefox;
                };
                modules = [ ./home-manager/home.nix ];
                inherit pkgs;
            };
    };
}
