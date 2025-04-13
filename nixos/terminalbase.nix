{pkgs, ...}: {
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  programs.zsh.enable = true;
  environment.pathsToLink = ["/share/zsh"];

  environment.systemPackages = with pkgs; [
    # CLI Tools
    vim
    kitty
    neovim
    git
    fd
    fzf
    unzip
    htop
    ffmpeg
    pkg-config
    openssl
    lf
  ];
}
