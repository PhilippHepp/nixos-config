{ pkgs, inputs, ... }:
{
  imports = [ inputs.ironbar.homeManagerModules.ironbar ];

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
  programs.ironbar = {
    enable = true;
    systemd.enable = true;
    settings = {
    };
  };
  home.packages = [ pkgs.libqalculate ];
}
