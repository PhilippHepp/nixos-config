#  WARN: Packages might be defined elsewhere via programs.<name>
#  WARN: when defining config with home-manager make sure the pkgs in home-manager are the same

{ pkgs-stable, pkgs, ... }: 

{
    environment.systemPackages = with pkgs-stable; [
        obsidian
        # Testing
        # ghostscript
        # mermaid-cli
        mupdf
        # steam-run
        # pkgs.everest-mons
        # lutris
        # wine

        # CLI Tools
        vim
        gcc
        cargo
        rustc
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
        pkg-config

        # Programs
        vesktop
        brave
        pkgs.nemo
        pkgs.hyprpicker
        steam
        geeqie
        (flameshot.override { enableWlrSupport = true; })
        # Other
        home-manager
    ];
    
    fonts.packages = with pkgs; [
        nerd-fonts.fira-code
    ];
}
