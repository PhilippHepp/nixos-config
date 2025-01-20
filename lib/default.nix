{inputs ? null}:

{
    mkSystem = systemConfigPath: 

        let
            system = "x86_64-linux";

            systemConfig = import systemConfigPath;

            pkgs = import inputs.nixpkgs {inherit system; config.allowUnfree = true;};
            pkgs-stable = import inputs.nixpkgs-stable {inherit system; config.allowUnfree = true;};

            specialArgs = {inherit pkgs pkgs-stable;} // systemConfig.settings;
        in

        inputs.nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            modules = [(pkgs.lib.filterAttrs (n: v: n == "imports" || n == "system") systemConfig) ] ++ systemConfig.nixosModules ++ [

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
