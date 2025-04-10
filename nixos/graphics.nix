{ pkgs, ... }: 

{
    # Window Manager
    programs.hyprland.enable = true;
    services.hypridle.enable = true;

    environment.sessionVariables = {
        # Activate if Cursor keeps dissappearing
        WLR_NO_HARDWARE_CURSORS = "1";

        # Required for Wayland
        NIXOS_OZONE_WL = "1";
    };

    # Allows interoperabilty between Applications
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;

    environment.systemPackages = with pkgs; [
        wofi
        eww
        swww
        xwayland
        wl-clipboard
        cliphist
    ];
}
