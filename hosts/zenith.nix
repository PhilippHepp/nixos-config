{ config, lib, pkgs, ... }: {
    imports = [ ../nixos/hardware-configuration.nix ];
    
    networking.hostName = "zenith"; # Define your hostname  

    # Hyprland settings

    programs.hyprland.enable = true;

    environment.sessionVariables = {
        WLR_NO_HARDWARE_CURSORS = "1";
        NIXOS_OZONE_WL = "1";
    };

    hardware = {
        opengl.enable = true;

        nvidia.modesetting.enable = true;
    };

    xdg.portal.enable = true;

    services.pipewire = {
        enable = true;
        audio.enable = true;
        pulse.enable = true;
    };
}
