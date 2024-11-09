{ inputs, config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        # Text Editors
        vim
        neovim
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
        rofi
        swww
        hyprcursor
        xwayland
        wl-clipboard
        cliphist
        # Audio
        pipewire
        wireplumber
        # Programs
        pavucontrol
        pamixer
        vesktop
        firefox
        steam
        nautilus
        ffmpeg
        # Other
        tokyonight-gtk-theme
        home-manager
    ];
    
    fonts.packages = with pkgs; [
	(nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
}
