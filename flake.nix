{
    description = "System configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }@inputs :

    let 
        system = "x86_64-linux";

        pkgs = import inputs.nixpkgs {inherit system; config.allowUnfree = true;};
        pkgs-stable = import inputs.nixpkgs-stable {inherit system; config.allowUnfree = true;};

        Dlib = import ./lib {inherit inputs system pkgs pkgs-stable;};
    in with Dlib;

    {

        nixosConfigurations.galaxia = mkSystem ./hosts/galaxia/galaxia.nix;
        nixosConfigurations.zenith = mkSystem ./hosts/zenith/zenith.nix;

        # packages.${system}.catppuccin-sddm = pkgs.callPackage ./testing/catppuccin-sddm.nix {};

        devShells.${system}.rust = (import ./testing/rust.nix {inherit pkgs pkgs-stable;});
    };
}
