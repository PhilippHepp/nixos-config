{ username, mail, ... }: {
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

    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    programs.gh = {
        enable = true;
        gitCredentialHelper.enable = true;
        gitCredentialHelper.hosts = [
            "https://github.com"
        ];
        settings.editor = "nvim";
    };

    programs.git = {
        enable = true;
        userName = username;
        userEmail = mail;
    };

    # programs.eww.enable = true;
    # programs.eww.configDir = ./modules/eww;

}
