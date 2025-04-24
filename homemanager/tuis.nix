{ pkgs, ... }:
{
  home.packages = with pkgs; [
    asciiquarium-transparent
    astroterm
    cbonsai
    chess-tui
    nudoku
    sssnake
    upiano
    calcure
    glow
    nyaa
    wtfutil
    wego
    mqttui
    nemu
  ];
}
