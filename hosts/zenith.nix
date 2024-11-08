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

    hardware.pulseaudio.enable = false;
    sound.enable = true;

    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;

      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
}
