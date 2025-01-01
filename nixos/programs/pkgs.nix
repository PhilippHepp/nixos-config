#  WARN: Packages might be defined elsewhere via programs.<name>
#  WARN: when defining config with home-manager make sure the pkgs in home-manager are the same

{ pkgs-stable, pkgs, ... }: 

{
    environment.systemPackages = with pkgs-stable; [
        # (import ../../testing/eww-bluetooth.nix {inherit pkgs;})
        # Text Editors #
        vim
        pkgs.neovim
        # CLI Tools #
        alacritty
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
        yazi
        # bash
        #chafa
        # Programming doodads #
        zig
        pkgs.rustc
        cargo
        nodejs_22
        gnumake
        openssl
        pkg-config
        # Wayland #
        wofi
        eww
        swww
        xwayland
        wl-clipboard
        cliphist
        # Audio #
        wireplumber
        pavucontrol
        pamixer
        # Programs #
        vesktop
        brave
        pkgs.nemo
        pkgs.hyprpicker
        geeqie
        # Sddm
        libsForQt5.qt5.qtgraphicaleffects
        (pkgs.elegant-sddm.override {
             themeConfig.General = {
                 background = "${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.gnomeFilePath}";
             };
         })
        # System Control #
        brightnessctl
        # Other #
        home-manager
    ];
    
    fonts.packages = with pkgs; [
        nerd-fonts.fira-code
    ];
}
