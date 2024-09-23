{ config, pkgs, ... }: {
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

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        dotDir = ".config/zsh";
        dirHashes = {
            nvim = "$HOME/.config/nvim/";
            nix = "$HOME/.config/nix/";
        };
        initExtra = ''
            eval "$(oh-my-posh init zsh --config $HOME/.config/zsh/oh-my-posh.yaml )"
        '';
    };
}
