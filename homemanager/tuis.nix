{ pkgs, ... }:
{
  home.packages = with pkgs; [
    moon-buggy
    astroterm
    cbonsai
    chess-tui
    nudoku
    sssnake
    steam-tui
    upiano
    calcure
    glow
    nyaa
    wtf
    wego
    mqttui
    nemu
  ];
}
