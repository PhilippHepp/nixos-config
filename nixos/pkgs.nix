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
        fd
        fzf
        unzip
        fastfetch
        htop
        eza
        ffmpeg
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
        # LSP #
        # cssls
        # html
        lua-language-server
        pkgs.rust-analyzer
        tinymist
        yaml-language-server
        pkgs.typescript-language-server
        nil
        pkgs.bash-language-server
        vscode-langservers-extracted
        # Wayland #
        wofi
        eww
        swww
        xwayland
        wl-clipboard
        cliphist
        # hyprcursor
        # Audio #
        pipewire
        wireplumber
        pavucontrol
        pamixer
        # Programs #
        vesktop
        #firefox
        brave
        pkgs.nemo
        # prismlauncher
        # netbird
        # steam
        pkgs.hyprpicker
        # System Control #
        brightnessctl
        fprintd
        geeqie
        # Other #
        #openrgb-with-all-plugins
        home-manager
    ];
    
    fonts.packages = with pkgs; [
        nerd-fonts.fira-code
    ];
}
