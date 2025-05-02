{ pkgs, ... }:

{
  services.mako = {
    enable = true;
    layer = "overlay";
    defaultTimeout = 10000;
    borderRadius = 7;
    borderSize = 2;
  };
  home.packages = with pkgs; [
    libnotify
    signal-desktop-bin
    vesktop
    gurk-rs
    nchat
    tuisky
    wasistlos
  ];
}
