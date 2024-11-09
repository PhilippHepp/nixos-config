{ config, lib, pkgs, ... }: {
    imports = [ ./hardware-configuration.nix ];
    
    networking.hostName = "zenith"; # Define your hostname  

}
