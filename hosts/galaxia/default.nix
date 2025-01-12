{pkgs-stable, ...}:

{
    imports = [./hardware-configuration.nix ./galaxia.nix];

    system.stateVersion = "24.05"; # Just don't

    environment.systemPackages = with pkgs-stable; [
        brightnessctl
    ];
}
