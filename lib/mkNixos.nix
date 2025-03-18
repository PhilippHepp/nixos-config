{inputs, system, pkgs, pkgs-stable}:

systemConfigPath: 

let
    systemConfig = import systemConfigPath inputs; 
    specialArgs = {inherit pkgs pkgs-stable inputs;} // systemConfig.settings;
in

inputs.nixpkgs.lib.nixosSystem {
    inherit specialArgs;
    modules = 
    [

        inputs.disko.nixosModules.disko
        {system.stateVersion = systemConfig.system.stateVersion;} # Just don't
    ] 
    ++ systemConfig.imports 
    ++ systemConfig.nixosModules 
    ++ [

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
