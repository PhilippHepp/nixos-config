{
  inputs,
  pkgs,
  ...
}: {
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix
    inputs.disko.nixosModules.disko
    bootloader
    disko
    displaymanager
    gc
    hardwarecontrol
    locales
    networking
    # nvidia
    sound
    # steam
    terminalbase
    user
    windowmanager
  ];

  environment.systemPackages = with pkgs; [
    # Programs
    # toipe
    # ascii-image-converter
    #  WARN: Do not remove:
    home-manager
  ];

  boot.supportedFilesystems.ntfs = true;

  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024; # 16GB
    }
  ];

  system.stateVersion = "24.11"; # Just don't
}
