{
  hostname,
  pkgs,
  ...
}: {
  networking.networkmanager.enable = true;
  networking.hostName = hostname;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    speedtest-cli
    curl
    wget
    qbittorrent-enhanced-nox
  ];
}
