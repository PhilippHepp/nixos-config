{
  inputs,
  username,
  lib,
  ...
}: {
  imports = with inputs.self.homeManagerModules; [
    cad
    browser
    files
    gaming
    oh-my-posh
    zsh
    git
    hyprland
    themes
    hypridle
    kitty
    flameshot
    neovim
    rofi
  ];

  home = {
    inherit username;
    homeDirectory = lib.mkForce "/home/${username}";
    stateVersion = "24.11";
  };
}
