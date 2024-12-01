{ username, ... }: 

{
    imports = [
        ./modules/bundle.nix
        #  FIX: this should only be enabled with hostname = "wsl"
        #./wsl.nix
    ];

    home = {
        username = username;
        homeDirectory = "/home/${username}";
        stateVersion = "24.05";
    };

    # programs.eww.enable = true;
    # programs.eww.configDir = ./modules/eww;

}
