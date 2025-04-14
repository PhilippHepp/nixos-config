{ pkgs, ... }:

{
  programs.cmus = {
    enable = true;
    theme = "zenburn";
  };
  home.packages = with pkgs; [
    spotify-player
  ];
}
