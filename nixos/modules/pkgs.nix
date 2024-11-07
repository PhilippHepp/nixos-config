{ config, inputs, pkgs, ... }: {
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
        swww
        hyprcursor
        xwayland
        inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
        # wl-clipboard
        # cliphist
        # Programs
        pavucontrol
        vesktop
        discord
        firefox
        steam
        gnome.nautilus
        ffmpeg
        # Other
        tokyonight-gtk-theme
        home-manager
    ];

    fonts.packages = with pkgs; [
	(nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
}
