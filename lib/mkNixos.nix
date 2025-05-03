# ./lib/mkNixos.nix
{
  inputs,
  system,
  pkgs,
  pkgs-stable,
  lib,
}:
settingsPath:
let
  conf = import "${settingsPath}/configuration.nix" specialArgs;

  home = import "${settingsPath}/home.nix";

  settings = import "${settingsPath}/settings.nix";

  specialArgs = {
    inherit
      system
      pkgs
      pkgs-stable
      inputs
      lib
      ;
  } // settings;

in
inputs.nixpkgs.lib.nixosSystem {
  inherit specialArgs;
  modules =
    [ conf ]
    ++ [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = specialArgs;
          users.${settings.username}.imports = [ home ];
        };
      }
    ];
}
