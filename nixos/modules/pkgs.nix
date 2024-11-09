#  WARN: Packages might be defined elsewhere via programs.<name>
#  WARN: when defining config with home-manager make sure the pkgs in home-manager are the same

{ pkgs-stable, config, pkgs, ... }: {
    environment.systemPackages = with pkgs-stable; [
        # Text Editors
        vim
        pkgs.neovim
        # CLI Tools
        alacritty
        kitty
        zsh
        git
        lazygit
        gh
        ripgrep
        fd
        fzf
        chafa
        unzip
        fastfetch
        htop
        eza
        # Programming doodads
        zig
        rustc
        cargo
        nodejs_22
        gnumake
        openssl
        pkg-config
        # Wayland
        waybar
        wofi
        swww
        hyprcursor
        xwayland
        wl-clipboard
        cliphist
        # Audio
        pipewire
        wireplumber
        pavucontrol
        pamixer
        # Programs
        vesktop
        firefox
        pkgs.steam
        pkgs.nemo
        ffmpeg
        orca-slicer
        # Other
        tokyonight-gtk-theme
        home-manager
    ];
    
    fonts.packages = with pkgs; [
	(nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
}
