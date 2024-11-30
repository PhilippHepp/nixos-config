{ hostname, ...}: {
    imports = [ ./hardware-configuration.nix ];
    
    networking.hostName = "${hostname}";
}
