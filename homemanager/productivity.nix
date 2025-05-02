{ pkgs, email, ... }:
{
  home.packages = with pkgs; [
    obsidian
  ];

  programs.rbw = {
    enable = true;
    settings = {
      inherit email;
    };
  };
}
