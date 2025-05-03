{
  inputs,
  username,
  lib,
  ...
}: {
  imports = with inputs.self.homeManagerModules; [
    browser
    # cad
    files
    # gaming
    git
    hypraddons
    hyprland
    kde
    latex
    launcher
    media
    messaging
    music
    neovim
    oh-my-zsh
    productivity
    terminal
    theming
    tuis
    zsh
  ];

  home = {
    inherit username;
    homeDirectory = lib.mkForce "/home/${username}";
    stateVersion = "24.11";
  };
}
