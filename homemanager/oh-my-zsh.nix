{ config, ... }:

{
  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [
      "zsh-interactive-cd"
    ];
  };
}
