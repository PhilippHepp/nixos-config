{ config, ... }: with config.don;

{
    imports = [ ./modules/bundle.nix ];

    home = {
        inherit username;
        homeDirectory = "/home/${username}";
        stateVersion = "24.05";
    };
}
