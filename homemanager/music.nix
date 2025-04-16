{ pkgs, ... }:

{
  programs.cmus = {
    enable = true;
    theme = "zenburn";
  };
  home.packages = with pkgs; [
    spotify-player
    cmus
    cava
    cli-visualizer
    musescore
    dl-librescore
  ];
}
