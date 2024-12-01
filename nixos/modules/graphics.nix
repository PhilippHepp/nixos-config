{ pkgs, ... }: 

{
    services.xserver.xkb.layout = "us";

    # Requires some qt5.callpackage shit idk
    # services.displayManager.sddm = {
    #     enable = true;
    #     # theme = "${import ./tokyonight-sddm.nix{inherit pkgs;}}";
    #     theme = "${tokyonight-sddm}";
    #     wayland.enable = true;
    # };

    services.displayManager.enable = true;
    services.xserver.displayManager.gdm = {
        enable = true;
        wayland = true;
    };

    # Window Manager
    programs.hyprland.enable = true;

    environment.sessionVariables = {
        # Activate if Cursor keeps dissappearing
        # WLR_NO_HARDWARE_CURSORS = "1";

        # Required for Wayland
        NIXOS_OZONE_WL = "1";
    };

    # Allows interoperabilty between Applications
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
}
