{ config, ... }: with config.don;

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        dotDir = ".config/zsh";
        shellAliases = {
            rb = "sudo nixos-rebuild switch --flake ${dotfiles}/nix";
            hm = "home-manager switch --flake ${dotfiles}/nix/";
            pkgs = "nvim ${dotfiles}/nix/nixos/pkgs.nix";
            lg = "lazygit";
            v = "nvim";
            z = "eza -a --icons";
            zz = "eza -aTL 3 --icons";
            rust = "nix develop ${dotfiles}/nix#rust -c zsh";
        };
    };
}
