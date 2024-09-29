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
        # initExtra = ''
        #     eval "$(oh-my-posh init zsh --config $HOME/.config/zsh/oh-my-posh.yaml )"
        # '';
    };

    programs.oh-my-posh = {
        enable = true;
        enableZshIntegration = true;
        #settings = builtins.fromJSON(builtins.readFile(/home/donielmaker/.config/zsh/oh-my-posh.json));
        settings = builtins.fromTOML(builtins.readFile(/home/donielmaker/.config/zsh/oh-my-posh.toml));
    };
}
