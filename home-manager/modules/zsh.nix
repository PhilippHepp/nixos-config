{ dotfiles, ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        dotDir = ".config/zsh";
        shellAliases = {
            rb = "sudo nixos-rebuild switch --flake ${dotfiles}/nix";
            hm = "home-manager switch --flake ${dotfiles}/nix/";
            lg = "lazygit";
            v = "nvim";
            ls = "eza -a --icons=auto";
            # zz = "eza -aTL 3 --icons";
            ff = "fastfetch";
            rust = "nix develop ${dotfiles}/nix#rust -c zsh";
        };
    };
}
