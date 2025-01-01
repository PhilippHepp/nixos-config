{ config, ... }: 

{
    imports = [ ./modules/bundle.nix ];

    home = {
        username = config.don.username;
        homeDirectory = "/home/${config.don.username}";
        stateVersion = "24.05";
    };
}
