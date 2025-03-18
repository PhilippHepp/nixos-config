{inputs, system, pkgs, pkgs-stable}:

settingsPath: 

let
    settings = import settingsPath; 

    specialArgs = {inherit pkgs pkgs-stable inputs;} // settings.settings;
    # System specific nixos module
    conf = import "${builtins.dirOf settingsPath}/configuration.nix" specialArgs;
in

inputs.nixpkgs.lib.nixosSystem {
    inherit specialArgs;
    modules = 

    [conf] ++
    settings.nixosModules ++
    [
        inputs.home-manager.nixosModules.home-manager {
            home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = specialArgs;
                users.donielmaker.imports = settings.homeModules;
            };
        }
    ];  
}
