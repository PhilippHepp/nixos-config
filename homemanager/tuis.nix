{ pkgs, ... }:
{
  home.packages = with pkgs; [
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
