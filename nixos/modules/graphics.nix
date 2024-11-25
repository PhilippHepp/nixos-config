{ config, pkgs, ... }: {
    services.xserver.videoDrivers = [ "nvidia" ];
    services.xserver.xkb.layout = "us";

    services.displayManager.sddm = {
        enable = true;
        theme = "${import ./tokyonight-sddm.nix{inherit pkgs;}}";
        wayland.enable = true;
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

    hardware.nvidia = {
        # Enables Kernel Modesetting. Fixes Screen Tearing when using Optimus
        modesetting.enable = true;

        # Disables Power Mangement through Systemd
        powerManagement.enable = false;
        powerManagement.finegrained = false;

        # Disables Open Source Driver
        open = false;

        # Enables the Nvidia X Server Settings
        nvidiaSettings = true;

        # The Package of the Nvidia Driver
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
}
