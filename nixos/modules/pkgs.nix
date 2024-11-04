{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        # Text Editors
        vim
        neovim
        # CLI Tools
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
        wezterm
        kitty
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
