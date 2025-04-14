{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    extraConfig = {
      modi = "drun,calc";
    };
    plugins = with pkgs; [ rofi-calc ];
    location = "center";
    theme = "arthur";
  };
  programs.eww = {
    enable = true;
    enableZshIntegration = true;
  };
  home.packages = [ pkgs.libqalculate ];
}
