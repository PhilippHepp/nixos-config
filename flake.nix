{
    description = "System configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }:

    let 
        system = "x86_64-linux";

        # Package declarations
        pkgs = import nixpkgs {inherit system; config.allowUnfree = true;};
        pkgs-stable = import nixpkgs-stable {inherit system; config.allowUnfree = true;};

        # SpecialArgs
        mainArgs = { inherit pkgs pkgs-stable; };
    in 

    {
        # Default
        # nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        #     specialArgs = mainArgs;
        #     modules = [ ./hosts/default/configuration.nix ];
        # };

        # #  TODO:this should be defined by the don.username arg

        homeConfigurations.donielmaker = home-manager.lib.homeManagerConfiguration {
            extraSpecialArgs = mainArgs;
            modules = [ 
                # User Config
                ./hosts/galaxia/galaxia.nix
                ./nixos/system/options.nix
                ./home-manager/home.nix 
            ];
            inherit pkgs;
        };

        devShells.${system}.rust = (import ./testing/rust.nix {inherit pkgs pkgs-stable;});

        nixosConfigurations."galaxia" = nixpkgs.lib.nixosSystem {
            specialArgs = mainArgs;
            modules = [ 
                # System Config
                ./hosts/galaxia/galaxia.nix
                ./hosts/galaxia/configuration.nix

                # Modules
                ./nixos/system/settings.nix
                ./nixos/system/networking.nix
                ./nixos/system/bootloader.nix
                ./nixos/system/user.nix
                ./nixos/system/options.nix

                ./nixos/programs/pkgs.nix
                ./nixos/programs/neovim.nix
                ./nixos/programs/zsh.nix
                # ./nixos/netbird.nix

                ./nixos/hardware/sound.nix
                ./nixos/hardware/graphics.nix
                ./nixos/hardware/bluethooth.nix

                ./nixos/displayManagers/sddm.nix

                ./nixos/gpu/intel.nix

                ./nixos/hardware/ntfs.nix
            ];
        };

        nixosConfigurations."zenith" = nixpkgs.lib.nixosSystem {
            specialArgs = mainArgs;
            modules = [ 
                # System Config
                ./hosts/zenith/zenith.nix
                ./nixos/options.nix

                # Modules
                ./nixos/settings.nix
                ./nixos/networking.nix
                ./nixos/bootloader.nix
                ./nixos/zsh.nix
                ./nixos/pkgs.nix
                ./nixos/user.nix
                ./nixos/sound.nix
                ./nixos/graphics.nix
                ./nixos/sddm.nix
                ./nixos/openrgb.nix
                ./nixos/netbird.nix
                ./nixos/nvidia.nix
            ];
        };
    };
}
