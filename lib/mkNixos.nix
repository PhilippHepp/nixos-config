{inputs, system, pkgs, pkgs-stable}:

settingsPath: 

let
    conf = import "${settingsPath}/configuration.nix" specialArgs;
    home = import "${settingsPath}/home.nix";
    settings = import "${settingsPath}/settings.nix"; 

    specialArgs = {inherit pkgs pkgs-stable inputs ;} // settings;
in

inputs.nixpkgs.lib.nixosSystem {
    inherit specialArgs;
    modules = [conf] ++
    [
        inputs.home-manager.nixosModules.home-manager {
            home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = specialArgs;
                users.donielmaker.imports = [home];
            };
        }
    ];  
}
