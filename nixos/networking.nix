{
  hostname,
  pkgs,
  ...
}: {
  networking.networkmanager.enable = true;
  networking.hostName = hostname;

  environment.systemPackages = with pkgs; [
    network-manager-applet
    speedtest-cli
    curl
    wget
    qbittorrent-enhanced-nox
  ];
}
