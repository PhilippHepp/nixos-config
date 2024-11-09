{ config, lib, pkgs, ... }:

{
    disabledModules = [
        ../nixos/modules/bootloader.nix
    ];

    wsl.enable = true;
    wsl.defaultUser = "donielmaker";

    networking.hostName = lib.mkForce "wsl"; # Define your hostname  
}
