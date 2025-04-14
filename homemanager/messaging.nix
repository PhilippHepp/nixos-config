{ pkgs, ... }:

{
  services.mako = {
    enable = true;
    layer = "overlay";
  };
  home.packages = with pkgs; [
    libnotify
    signal-desktop-bin
    vesktop
    gurk-rs
    nchat
    tuisky
  ];
}
