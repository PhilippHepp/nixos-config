{
  description = "Please don't use!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    # obsidian-nvim.url = "github:epwalsh/obsidian.nvim";

    ironbar.url = "github:JakeStanger/ironbar";
    ironbar.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
    # nvf.inputs.obsidian-nvim.follows = "obsidian-nvim";

    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
  };

  outputs =
    { self, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-stable = import inputs.nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };

      mkNixos = import ./lib/mkNixos.nix {
        inherit
          inputs
          system
          pkgs
          pkgs-stable
          ;
      };
      buildModules = import ./lib/getModules.nix { lib = inputs.nixpkgs.lib; };
    in
    {
      nixosModules = buildModules ./nixos;
      homeManagerModules = buildModules ./homemanager;

      nixosConfigurations.nixtower = mkNixos ./hosts/NixTower;
      nixosConfigurations.nixserver = mkNixos ./hosts/NixServer;
      nixosConfigurations.nixvm = mkNixos ./hosts/NixVM;
    };
}
