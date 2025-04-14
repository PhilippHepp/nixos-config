{
  inputs,
  username,
  lib,
  ...
}:
{
  imports = with inputs.self.homeManagerModules; [
    cad
    browser
    files
    gaming
    oh-my-posh
    git
    hyprland
    theming
    hypraddons
    terminal
    neovim
    music
    latex
    kde
    media
    messaging
    tuis
    zsh
    launcher
  ];

  home = {
    inherit username;
    homeDirectory = lib.mkForce "/home/${username}";
    stateVersion = "24.11";
  };
}
