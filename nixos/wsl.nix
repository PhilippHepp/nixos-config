{ config, lib, pkgs, ... }:

{
    disabledModules = [
        ./modules/bootloader.nix
        ./hardware-configuration.nix
    ];

    wsl.enable = true;
    wsl.defaultUser = "donielmaker";
    networking.hostName = lib.mkForce "wsl"; # Define your hostname  
}
