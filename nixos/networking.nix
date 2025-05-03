{
  hostname,
  pkgs,
  ...
}: {
  networking.networkmanager.enable = true;
  networking.hostName = hostname;

  services.cloudflare-warp = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    speedtest-cli
    curl
    wget
    qbittorrent-enhanced-nox
  ];
}
