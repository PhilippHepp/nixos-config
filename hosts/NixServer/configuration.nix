{
  system,
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
    docker
    gc
    hardwarecontrol
    locales
    networking
    nvidia
    terminalbase
    user
  ];

  environment.systemPackages = with pkgs; [
    home-manager
  ];

  system.stateVersion = "24.11"; # Just don't
}
