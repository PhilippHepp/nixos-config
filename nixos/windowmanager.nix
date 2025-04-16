{ pkgs, username, ... }:
{
  programs.hyprland.enable = true;
  services.hypridle.enable = true;

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    HYPRSHOT_DIR = "/home/${username}/Images/Screenshots";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  environment.systemPackages = with pkgs; [
    eww
    swww
    xwayland
    wl-clipboard
    cliphist
  ];
}
