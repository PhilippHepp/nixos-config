# ./lib/mkNixos.nix
{
  inputs,
  system,
  pkgs,
}:
{
  settingsPath,
  server ? false,
  wsl ? false,
}:
let
  conf = import "${settingsPath}/configuration.nix";
  home = import "${settingsPath}/home.nix";
  settings = import "${settingsPath}/settings.nix";

  specialArgs = {
    inherit inputs system pkgs;
  } // settings;
in
inputs.nixpkgs.lib.nixosSystem {
  inherit specialArgs;
  modules =
    [
      inputs.nixpkgs.nixosModules.readOnlyPkgs
      conf
    ]
    ++ (
      if server then
        [ ]
      else
        [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = specialArgs;
              users.${settings.username}.imports = [ home ];
            };
          }
        ]
    );
}
