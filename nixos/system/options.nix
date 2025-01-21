{lib, hostname, ...}:

with lib; {

    options.${hostname} = {
        settings = mkOptions {
            type = types.submodules;
            description = "system settings";
        };

        nixosModules = mkOption {
            type = types.listOf types.paths;
            description = "Nixos Modules the system should use";
        };

        hmModules = mkOption {
            type = types.listOf types.paths;
            description = "Home Manager Modules the system should use";
        };
    };
}

