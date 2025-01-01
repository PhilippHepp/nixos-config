{
    description = "System configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

        firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
        firefox-addons.inputs.nixpkgs.follows = "nixpkgs";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, nixpkgs-stable, firefox-addons, home-manager, ... }:

    let 
        system = "x86_64-linux";

        # Package declarations
        pkgs = import nixpkgs {inherit system; config.allowUnfree = true;};
        pkgs-stable = import nixpkgs-stable {inherit system; config.allowUnfree = true;};
        pkgs-firefox = firefox-addons.packages.${system};

        # SpecialArgs
        mainArgs = { inherit pkgs pkgs-stable pkgs-firefox; };
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
            modules = [ ./home-manager/home.nix ./nixos/options.nix ./hosts/galaxia/galaxia.nix];
            inherit pkgs;
        };

        devShells.${system}.rust = (import ./testing/rust.nix {inherit pkgs pkgs-stable;});

        nixosConfigurations."galaxia" = nixpkgs.lib.nixosSystem {
            specialArgs = mainArgs;
            modules = [ 
                # System Config
                ./hosts/galaxia/galaxia.nix
                ./nixos/options.nix

                ./hosts/galaxia/test.nix

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
                ./nixos/bluethooth.nix
                # ./nixos/netbird.nix
                ./nixos/intel.nix
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
