# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{  
    imports = [
        ./hardware-configuration.nix
        ./modules/bundle.nix
    ];


    networking.networkmanager.enable = true;
    networking.hostName = "zenith"; # Define your hostname  

    time.timeZone = "Europe/Berlin";

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nixpkgs.config.allowUnfree = true;

    users.users.donielmaker = {
        isNormalUser = true;
        description = "DonielMaker";
        extraGroups = ["networkmanager" "wheel" "input"];
        shell = pkgs.zsh;
    };

    # For Zsh Auto Completion
    environment.pathsToLink = [ "/share/zsh" ];
    programs.zsh.enable = true;

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
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It's perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05"; # Did you read the comment?
}
