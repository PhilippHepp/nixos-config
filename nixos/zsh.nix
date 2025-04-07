{pkgs, ...}:

{
    programs.zsh.enable = true;
    environment.pathsToLink = [ "/share/zsh" ];
    
    environment.systemPackages = with pkgs; [
        # CLI Tools
        btop
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
    ];

    fonts.packages = with pkgs; [
        nerd-fonts.fira-code
        nerd-fonts.iosevka-term-slab
    ];
}
