{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # CLI Tools
    bat
    btop
    cargo
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
    nmap
    nodejs
    openssl
    pkg-config
    ripgrep
    rustc
    sysz
    tmux
    tree-sitter
    unzip
    vim
    zig

    # LSP
    bash-language-server
    lua-language-server
    marksman
    nil
    slint-lsp
    tinymist
    vscode-langservers-extracted
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
