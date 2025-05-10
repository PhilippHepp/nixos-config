{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pinokio
  ];
}
