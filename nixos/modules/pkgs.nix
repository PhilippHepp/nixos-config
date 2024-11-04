{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        # Text Editors
        vim
        neovim
        # CLI Tools
        wezterm
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
        # Programming doodads
        zig
        rustc
        cargo
        nodejs_22
        gnumake
        openssl
        pkg-config
        # wayland
        waybar
        rofi
	dunst
        xwayland
        wl-clipboard
        cliphist
        # Other
        firefox
        home-manager
    ];

    fonts.packages = with pkgs; [
	(nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
}
