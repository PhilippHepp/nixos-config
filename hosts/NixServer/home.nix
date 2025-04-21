{
  inputs,
  username,
  lib,
  ...
}:

{
  imports = with inputs.self.homeManagerModules; [
    git
    neovim
    oh-my-zsh
    terminal
    vimbinds
    zsh
  ];

  home = {
    inherit username;
    homeDirectory = lib.mkForce "/home/${username}";
    stateVersion = "24.11";
  };
}
