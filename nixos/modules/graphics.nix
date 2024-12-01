{ gpu, config, pkgs, ... }: 

{
    services.xserver.videoDrivers = if (gpu == "nvidia") then [ "nvidia" ] else [];
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

    # services.xserver.enable = true;
    # services.xserver.displayManager = {
    #     lightdm.enable = true;
    #     lightdm.greeters.gtk = {
    #         cursorTheme.name = "Bibata-Modern-Ice";
    #         cursorTheme.package = pkgs.bibata-cursors;
    #
    #         theme.name = "Tokyonight-Storm-BL-LB";
    #         theme.package = pkgs.tokyonight-gtk-theme;
    #     };
    # };

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

    hardware.nvidia = if (gpu == "nvidia") then {
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
    } else {};
}
