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

	programs.git = {
		enable = true;
		userName = "donielmaker";
		userEmail = "daniel.schmidt0204@gmail.com";
	};
		       }
