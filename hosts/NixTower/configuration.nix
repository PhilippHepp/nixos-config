{
  inputs,
  pkgs,
  ...
}:
{
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix
    inputs.disko.nixosModules.disko
    bootloader
    disko
    displaymanager
    hardwarecontrol
    locales
    networking
    nh
    nvidia
    sound
    steam
    terminalbase
    user
    windowmanager
  ];

  environment.systemPackages = with pkgs; [
    # Programs
    toipe
    ascii-image-converter
    #  WARN: Do not remove:
    home-manager
  ];

  fileSystems = {
    "/home/philipp/Arch" = {
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
      size = 17 * 1024; # 16GB
    }
  ];

  system.stateVersion = "24.11"; # Just don't
}
