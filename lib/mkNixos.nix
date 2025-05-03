# ./lib/mkNixos.nix
{ inputs
, system
, pkgs
, pkgs-stable
,
}:

settingsPath:

let
  hostSettings = import "${settingsPath}/settings.nix";
  specialArgs = { inherit system pkgs pkgs-stable inputs; } // hostSettings;

  # Load common modules once
  commonNixosModules = builtins.attrValues (import ./getModules.nix { lib = inputs.nixpkgs.lib; } ../nixos/common);
  commonHomeManagerModules = builtins.attrValues (import ./getModules.nix { lib = inputs.nixpkgs.lib; } ../homemanager/common);

  # Load host-specific modules
  hostNixosConfig = import "${settingsPath}/configuration.nix" specialArgs;
  hostHomeConfig = import "${settingsPath}/home.nix";

in
inputs.nixpkgs.lib.nixosSystem {
  inherit specialArgs;
  modules =
    # Host-specific NixOS config first (can override common)
    [ hostNixosConfig ]
    # Common NixOS modules
    ++ commonNixosModules
    # Home Manager setup
    ++ [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = specialArgs;
          users.${hostSettings.username}.imports =
            # Host-specific Home Manager config first
            [ hostHomeConfig ]
            # Common Home Manager modules
            ++ commonHomeManagerModules;
        };
      }
    ];
}
