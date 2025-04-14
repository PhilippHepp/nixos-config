{ config, ... }:

{
  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [
      # "chucknorris"
      "colored-man-pages"
      # "conda"
      "emoji-clock"
      "git"
      "git-prompt"
      "history"
      "kitty"
      "man"
      "qrcode"
      "sudo"
      "systemd"
      "z"
      "zsh-interactive-cd"
    ];
    theme = "jonathan";
  };
}
