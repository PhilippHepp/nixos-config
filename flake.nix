{
    description = "System configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

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
        ...
    }@inputs:

    let 
        # System settings #
        system = "x86_64-linux";
        hostname = "galaxia"; # Default
        username = "donielmaker";
        mail = "daniel.schmidt0204@gmail.com";
        dotfiles = "/home/${username}/.config";
        gpu = "";

        # Package declaration #
        pkgs = import nixpkgs {inherit system; config.allowUnfree = true;};
        pkgs-stable = import nixpkgs-stable {inherit system; config.allowUnfree = true;};
        pkgs-firefox = firefox-addons.packages.${system};
        # pkgs-firefox = import firefox-addons { inherit system; };

        # SpecialArgs #
        mainArgs = {
            inherit inputs gpu
            system hostname username mail dotfiles
            pkgs pkgs-stable pkgs-firefox;
        };

    in {
        nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
            specialArgs = mainArgs;
            modules = [ ./nixos/configuration.nix ];
        };

        homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
            extraSpecialArgs = mainArgs;
            modules = [ ./home-manager/home.nix ];
            inherit pkgs;
        };

        #devShells.${system}.default = (import ./shell.nix {inherit pkgs;});

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
