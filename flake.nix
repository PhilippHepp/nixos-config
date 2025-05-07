{
  description = "Please don't use!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      buildModules = import ./lib/getModules.nix { lib = nixpkgs.lib; };
      mkNixos = import ./lib/mkNixos.nix {
        inherit inputs system pkgs;
      };

    in
    {
      nixosModules = buildModules ./nixos;
      homeManagerModules = buildModules ./homemanager;
      services = buildModules ./nixos/services;

      nixosConfigurations = {
        nixtower = mkNixos { settingsPath = ./hosts/NixTower; };
        nixserver = mkNixos ./hosts/NixServer;
        nixwsl = mkNixos ./hosts/NixWSL;
        nixpc = mkNixos ./hosts/NixPC;
      };
    };
}
