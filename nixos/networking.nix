{hostname, ...}:

{
    networking.networkmanager.enable = true;
    networking.hostName = hostname;
    services.samba = {
      enable = true;
      securityType = "user";
      openFirewall = true;
    };
}
