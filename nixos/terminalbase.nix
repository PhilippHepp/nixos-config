{
  pkgs,
  shellPrompt,
  shell,
  ...
}:
{
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.iosevka-term-slab
  ];

  programs.fish.enable = true;
  programs.fish.promptInit = "${shellPrompt}";
  environment.pathsToLink = [ "/share/${shell}" ];

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
