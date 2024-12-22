{
    description = "System configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

        # catppuccin.url = "github:catppuccin/nix";

        #stylix.url = "github:danth/stylix";

        firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
        firefox-addons.inputs.nixpkgs.follows = "nixpkgs";

        # nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
        # nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { 
        self, 
        nixpkgs, 
        nixpkgs-stable,
        firefox-addons,
        # nixos-wsl, 
        home-manager, 
        # catppuccin,
        ...
    }@inputs:

    let 
        # System settings #
        system = "x86_64-linux";
        hostname = ""; # Default
        username = "donielmaker";
        mail = "daniel.schmidt0204@gmail.com";
        dotfiles = "/home/${username}/.config";
        kb = import ./nixos/keyboard.nix;
        monitor = ", 2560x1440@144hz, auto, 1";

        # Package declaration #
        pkgs = import nixpkgs {inherit system; config.allowUnfree = true;};
        pkgs-stable = import nixpkgs-stable {inherit system; config.allowUnfree = true;};
        pkgs-firefox = firefox-addons.packages.${system};

        # SpecialArgs #
        mainArgs = {
            inherit inputs monitor kb
            system hostname username mail dotfiles
            pkgs pkgs-stable pkgs-firefox;
        };

    in {
        # Default
        nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
            specialArgs = mainArgs;
            modules = [ ./hosts/default/configuration.nix ];
        };

        homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
            extraSpecialArgs = mainArgs;
            modules = [ ./home-manager/home.nix ];
            inherit pkgs;
        };

        devShells.${system}.rust = (import ./testing/rust.nix {inherit pkgs pkgs-stable;});

        nixosConfigurations."galaxia" = nixpkgs.lib.nixosSystem {
            specialArgs = mainArgs;
            modules = [ 
                # catppuccin.nixosModules.catppuccin
                # System Config
                ./hosts/galaxia/configuration.nix 

                # Modules
                ./nixos/bootloader.nix
                ./nixos/pkgs.nix
                ./nixos/user.nix
                ./nixos/sound.nix
                ./nixos/graphics.nix
                # ./nixos/gdm.nix
                ./nixos/sddm.nix
                # ./nixos/netbird.nix
                # ./nixos/fingerprint.nix
                ./nixos/bluethooth.nix
                ./nixos/intel.nix
                # ./nixos/catppuccin.nix
            ];
        };

        nixosConfigurations."zenith" = nixpkgs.lib.nixosSystem {
            specialArgs = mainArgs;
            modules = [ 
                # System Config
                ./hosts/zenith/configuration.nix 

                # Modules
                ./nixos/bootloader.nix
                ./nixos/pkgs.nix
                ./nixos/user.nix
                ./nixos/sound.nix
                ./nixos/graphics.nix
                ./nixos/gdm.nix
                ./nixos/openrgb.nix
                ./nixos/netbird.nix
                # ./nixos/fingerprint.nix
                # ./nixos/bluethooth.nix
                ./nixos/nvidia.nix
            ];
        };

        # nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
        #     specialArgs = {
        #             inherit inputs gpu
        #             system username dotfiles mail
        #             pkgs pkgs-stable pkgs-firefox;
        #     };
        #     modules = [
        #         ./nixos/configuration.nix
        #         ./nixos/wsl.nix
        #         nixos-wsl.nixosModules.default {
        #             system.stateVersion = "24.05";
        #             wsl.enable = true;
        #         }
        #     ];
        #     inherit system;
        # };
    };
}
