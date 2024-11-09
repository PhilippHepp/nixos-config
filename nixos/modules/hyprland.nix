{ config, pkgs, ... }: {
    services.xserver.videoDrivers = [ "nvidia" ];
    services.xserver.xkb.layout = "us";

    services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        displayManager.gdm.wayland = true;
    };

    programs.hyprland.enable = true;

    environment.sessionVariables = {
        WLR_NO_HARDWARE_CURSORS = "1";
        NIXOS_OZONE_WL = "1";
    };

    hardware.opengl.enable = true;
    hardware.opengl.driSupport32Bit = true;

    hardware.nvidia = {
        modesetting.enable = true;

        powerManagement.enable = false;
        powerManagement.finegrained = false;

        open = false;

        nvidiaSettings = true;

        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
}
