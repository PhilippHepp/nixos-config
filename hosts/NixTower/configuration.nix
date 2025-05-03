{ inputs
, pkgs
, ...
}:
{
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix
    inputs.disko.nixosModules.disko
    bootloader
    disko
    displaymanager
    hardwarecontrol
    # locales
    networking
    # nh
    nvidia
    sound
    steam
    # terminalbase
    # user
    windowmanager
  ];

  environment.systemPackages = with pkgs; [
    home-manager
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  fileSystems = {
    "/home/philipp/Windows" = {
      device = "dev/disk/by-uuid/3E40DDEE40DDAD41";
      fsType = "ntfs-3g";
      options = [
        "users"
        "nofail"
        "exec"
      ];
    };
    "/home/philipp/HDD" = {
      device = "dev/disk/by-uuid/24AC6C57AC6C2610";
      fsType = "ntfs-3g";
      options = [
        "users"
        "nofail"
        "exec"
      ];
    };
  };

  boot.supportedFilesystems.ntfs = true;

  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024; # 16GB
    }
  ];

  system.stateVersion = "24.11"; # Just don't
}
