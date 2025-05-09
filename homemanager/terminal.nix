{pkgs, ...}: {
  home.packages = with pkgs; [
    # CLI Tools
    alejandra
    bat
    btop
    devenv
    eza
    fastfetch
    fd
    ffmpeg
    fzf
    gcc
    git
    htop
    imagemagick
    jq
    lazygit
    lf
    nixpkgs-fmt
    nmap
    openssl
    pkg-config
    ripgrep
    sysz
    tmux
    tree-sitter
    unzip
    vim
    zig
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.thefuck = {
    enable = true;
    enableZshIntegration = true;
  };
}
