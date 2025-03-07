{lib, pkgs, ...}:

with lib; {

    options = {
        settings = {
            hostname = mkOption {
                description = "Set hostname systemwide";
                type = types.str;
            };

            system = mkOption {
                description = "Set system architecture";
                type = types.str;
                default = "x86_64-linux";
            };

            mail = mkOption {
                description = "Set E-Mail address";
                type = types.str;
            };

            dotfiles = mkOption {
                description = "Where all your dotfiles will be located";
                type = types.path;
                default = /home/${hostname}/.config;
            };

            kb_layout = mkOption {
                description = "Set your keyboard layout";
                type = types.str;
                default = "us";
            };

            monitors = mkOption {
                description = "Define all monitors in hyprland syntax";
                type = types.listOf types.str;
                default = [", 1920x1080@60hz, auto, 1"];
            };

            timezone = mkOption {
                description = "Set your timezone";
                type = types.str;
                default = "Europe/Berlin";
            };

            shell = mkOption {
                description = "Set your shell";
                type = types.package;
                default = pkgs.bash;
            };
        };

        nixosModules = mkOption {
                description = "List of all NixOS module paths";
                type = types.listOf types.path;
        };

        hmModules = mkOption {
                description = "List of all HM module paths";
                type = types.litOf types.path;
        };
    };
}

