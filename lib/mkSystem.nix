{inputs, system ? "x86_64-linux", pkgs, pkgs-stable}:

systemConfigPath: 

let
    systemConfig = import systemConfigPath;
    specialArgs = {inherit pkgs pkgs-stable;} // systemConfig.settings;
in

inputs.nixpkgs.lib.nixosSystem {
    inherit specialArgs;
    modules = [
        {system.stateVersion = systemConfig.system.stateVersion;} # Just don't
    ] ++ systemConfig.imports ++ systemConfig.nixosModules ++ [

        inputs.home-manager.nixosModules.home-manager {
            home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = specialArgs;
                users.donielmaker.imports = systemConfig.hmModules;
            };
        }
    ];
}
