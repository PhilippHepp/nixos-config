{
    description = "System configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        disko.url = "github:nix-community/disko/latest";
        disko.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = {
        self,
        nixpkgs,
        nixpkgs-stable,
        home-manager,
        disko,
        ... 
    }@inputs :

    let 
        system = "x86_64-linux";

        pkgs = import inputs.nixpkgs {inherit system; config.allowUnfree = true;};
        pkgs-stable = import inputs.nixpkgs-stable {inherit system; config.allowUnfree = true;};

        mkNixos = import ./lib/mkNixos.nix {inherit inputs system pkgs pkgs-stable;};
    in

    {

        nixosConfigurations.galaxia = mkNixos ./hosts/galaxia/galaxia.nix;
        nixosConfigurations.zenith = mkNixos ./hosts/zenith/zenith.nix;
        nixosConfigurations.server = mkNixos ./hosts/server/server.nix;

        # packages.${system}.catppuccin-sddm = pkgs.callPackage ./testing/catppuccin-sddm.nix {};

        devShells.${system}.rust = (import ./testing/rust.nix {inherit pkgs;});
    };
}
