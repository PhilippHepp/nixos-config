{
  description = "Please don't use!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

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
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import inputs.nixpkgs {
        inherit system overlays;
        config.allowUnfree = true;
      };
      overlays = import ./nixos/overlays.nix { inherit pkgs; };
      buildModules = import ./lib/getModules.nix { lib = inputs.nixpkgs.lib; };
      mkNixos = import ./lib/mkNixos.nix {
        inherit inputs system pkgs;
      };

    in
    {
      nixosModules = buildModules ./nixos;
      homeManagerModules = buildModules ./homemanager;

      nixosConfigurations = {
        nixtower = mkNixos ./hosts/NixTower;
        nixserver = mkNixos ./hosts/NixServer;
        nixwsl = mkNixos ./hosts/NixWSL;
        nixpc = mkNixos ./hosts/NixPC;
      };
    };
}
