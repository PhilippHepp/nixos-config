{hostname, ...}:

{
    networking.networkmanager.enable = true;
    networking.hostName = hostname;
    services.samba = {
      enable = true;
      settings.global.security = "user";
      openFirewall = true;
    };
}
