{
  pkgs,
  shellPrompt,
  ...
}:
{
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.iosevka-term-slab
  ];

  programs.zsh.enable = true;
  programs.zsh.promptInit = "${shellPrompt}";
  environment.pathsToLink = [ "/share/zsh" ];

  environment.systemPackages = with pkgs; [
    # CLI Tools
    vim
    kitty
    neovim
    geeqie
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
