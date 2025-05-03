{
  description = "Please don't use!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
          # TODO: Add overlays
        };
        pkgs-stable = import inputs.nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };

        lib = nixpkgs.lib;
        buildModules = import ./lib/getModules.nix { inherit lib; };

        mkNixos = import ./lib/mkNixos.nix {
          inherit
            inputs
            system
            pkgs
            pkgs-stable
            lib
            ;
        };
        nixosModules = buildModules ./nixos;
        homeManagerModules = buildModules ./homemanager;
      in
      {
        inherit nixosModules homeManagerModules;

        nixosConfigurations = {
          nixtower = mkNixos ./hosts/NixTower;
          nixserver = mkNixos ./hosts/NixServer;
          nixwsl = mkNixos ./hosts/NixWSL;
          nixpc = mkNixos ./hosts/NixPC;
        };
      }
    );
}
