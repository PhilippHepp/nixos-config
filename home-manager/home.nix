{ username, ... }: 

{
    imports = [ ./modules/bundle.nix ];

    home = {
        username = username;
        homeDirectory = "/home/${username}";
        stateVersion = "24.05";
    };
}
