{ pkgs, ... }:
{
  services.mako = {
    enable = true;
    settings = {
      layer = "overlay";
      defaultTimeout = 10000;
      borderRadius = 7;
      borderSize = 2;
    };
  };
  home.packages = with pkgs; [
    libnotify
    signal-desktop-bin
    vesktop
    gurk-rs
    nchat
    zapzap
    tuisky
    # wasistlos # BUG: schließt sich immer der HUSO
  ];

}
