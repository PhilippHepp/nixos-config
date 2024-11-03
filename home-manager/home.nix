{
    imports = [
	./oh-my-posh.nix
	#./hyprland.nix
    ];

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
        shellAliases = 
	let
            flakeDir = "$HOME/.config/nix/";
        in {
            rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
            hm = "home-manager switch --flake ${flakeDir}";
            pkgs = "nvim ${flakeDir}/nixos/configuration.nix";
            v = "nvim";
        };
    };
}
