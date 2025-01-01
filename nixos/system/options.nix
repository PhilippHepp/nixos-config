{lib, config, ...}:

with lib; {

    options.don = {
        hostname = mkOption {
            type = types.str;
            description = "defines your hostname to be used throughout";
            example = "myHostName";
        };

        system = mkOption {
            description = "defines your system architecture";
            example = "aarch64-darwin";
            type = types.enum [
                "x86_64-linux"
                "aarch64-linux"
                "i686-linux"
                "x86_64-darwin" 
                "aarch64-darwin"
                "armv7l-linux"
                "riscv64-linux"
            ];
        };

        username = mkOption {
            type = types.str;
            description = "defines your username";
            example = "myUserName";
        };

        mail = mkOption {
            type = types.str;
            description = "defines your Email";
            example = "google.com@gmail.com";
        };

        dotfiles = mkOption {
            type = types.str;
            description = ''
                defines the location where
                all dotfiles should be stored
            '';
            example = "/home/${config.don.hostname}/.config";
        };

        kb_layout = mkOption {
            type = types.str;
            description = "defines your layout";
            example = "us";
        };

        monitor = mkOption {
            type = types.str;
            description = "monitor specs for hyprland";
            example = ", 1920x1440@60hz, auto, 1";
        };

        timezone = mkOption {
            type = types.str;
            description = "defines your Timezone";
            example = "Europe/Berlin";
        };
    };
}

