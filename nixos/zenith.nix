{ config, ... }: {
    imports = [ ./hardware-configuration.nix ];
    
    networking.hostName = "zenith";

}
