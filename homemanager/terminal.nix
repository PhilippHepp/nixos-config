{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # CLI Tools
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
    lazygit
    lf
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
    enableFishIntegration = true;
  };
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.thefuck = {
    enable = true;
    enableFishIntegration = true;
  };
}
