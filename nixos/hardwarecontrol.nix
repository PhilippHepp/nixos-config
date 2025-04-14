{ pkgs, ... }:
{
  services.hardware.openrgb = {
    enable = true;
  };

  programs.coolercontrol.enable = true;
  programs.coolercontrol.nvidiaSupport = true;

  environment.systemPackages = with pkgs; [
    inputplumber
    brightnessctl
    usbutils
    pciutils
    lm_sensors
  ];
}
