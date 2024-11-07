{ config, lib, pkgs, ... }: {
    imports = [ ../nixos/hardware-configuration.nix ];
    
    networking.hostName = "zenith"; # Define your hostname  

    services.xserver.videoDrivers = [ "nvidia" ];
    services.xserver.xkb.layout = "us";

    services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        displayManager.gdm.wayland = true;
        # desktopManager.gnome.enable = true;
    };

    programs.hyprland.enable = true;

    environment.sessionVariables = {
        WLR_NO_HARDWARE_CURSORS = "1";
        NIXOS_OZONE_WL = "1";
    };

    hardware = {
        pulseaudio.enable = true;

        opengl.enable = true;
        opengl.driSupport32Bit = true;

        nvidia = {
            modesetting.enable = true;

            powerManagement.enable = false;
            powerManagement.finegrained = false;

            open = false;

            nvidiaSettings = true;

            package = config.boot.kernelPackages.nvidiaPackages.stable;
        };
    };

    xdg.portal.enable = true;
}
