#  WARN: Packages might be defined elsewhere via programs.<name>
#  WARN: when defining config with home-manager make sure the pkgs in home-manager are the same

{ pkgs-stable, pkgs, ... }: 

{
    environment.systemPackages = with pkgs-stable; [
        (flameshot.override { enableWlrSupport = true; })
        # steam-run
        # pkgs.everest-mons
        # lutris
        # wine

        # Text Editors #
        vim
        # CLI Tools #
        alacritty
        jq
        kitty
        zsh
        git
        lazygit
        ripgrep
        bat
        fd
        fzf
        unzip
        fastfetch
        htop
        eza
        ffmpeg
        tmux
        nmap
        imagemagick
        # Programs #
        vesktop
        brave
        pkgs.nemo
        pkgs.hyprpicker
        steam
        geeqie
        # Other #
        home-manager
    ];
    
    fonts.packages = with pkgs; [
        nerd-fonts.fira-code
    ];
}
