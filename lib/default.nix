{inputs ? null, system ? "x86_64-linux", pkgs ? null, pkgs-stable ? null}:

{
    mkSystem = systemConfigPath: 

        let
            systemConfig = import systemConfigPath;
            specialArgs = {inherit pkgs pkgs-stable;} // systemConfig.settings;
        in

        inputs.nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            # Disgusting first module please  FIX:
            modules = [(pkgs.lib.filterAttrs (n: v: n == "imports" || n == "system") systemConfig)] ++ systemConfig.nixosModules ++ [

                inputs.home-manager.nixosModules.home-manager {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        extraSpecialArgs = specialArgs;
                        users.donielmaker.imports = systemConfig.hmModules;
                    };
                }
        ];
    };

    withPath = path: list: builtins.map (file: path + file) list;
}
