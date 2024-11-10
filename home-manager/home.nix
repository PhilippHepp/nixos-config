{ config, lib, ...}:{
    imports = [
        ./modules/bundle.nix
        #./wsl.nix
    ];
    # Looking for a Solution to this
    #++ (if config.networking.hostName == "wsl" then ./wsl.nix else []);

    home = {
        username = "donielmaker";
        homeDirectory = "/home/donielmaker";
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
        userName = "donielmaker";
        userEmail = "daniel.schmidt0204@gmail.com";
    };

    # programs.eww.enable = true;
    # programs.eww.configDir = ./modules/eww;

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        dotDir = ".config/zsh";
        shellAliases = 
	let
            flakeDir = "$HOME/.config/nix/";
        in {
            rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
            hm = "home-manager switch --flake ${flakeDir}";
            pkgs = "nvim ${flakeDir}/nixos/modules/pkgs.nix";
            v = "nvim";
            z = "eza -a --icons";
            zz = "eza -aTL 3 --icons";
        };
    };
}
