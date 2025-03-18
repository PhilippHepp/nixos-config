{inputs, ...}:

{
    imports = [
        ./hardware-configuration.nix
        inputs.disko.nixosModules.disko
    ];

    system.stateVersion = "24.05"; # Just don't
}
