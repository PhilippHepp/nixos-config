{
  inputs,
  username,
  lib,
  ...
}: {
  imports = with inputs.self.homeManagerModules; [
    rofi
    browser
    oh-my-posh
    zsh
    git
    hyprland
    themes
    hypridle
    kitty
    flameshot
    neovim
  ];

  home = {
    inherit username;
    homeDirectory = lib.mkForce "/home/${username}";
    stateVersion = "24.11";
  };
}
