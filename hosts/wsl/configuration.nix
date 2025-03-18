{inputs, ...}:

{
    imports = [
        inputs.wsl.nixosModules.default { system.stateVersion = "24.11"; wsl.enable = true; }
        ./hardware-configuration.nix
    ];

    system.stateVersion = "24.11"; # Just don't

}
