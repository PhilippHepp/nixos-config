{inputs, ...}:

{
    imports = with inputs.self.nixosModules; [
        inputs.wsl.nixosModules.default { system.stateVersion = "24.11"; wsl.enable = true; }
        ./hardware-configuration.nix

        # System
        settings
        networking
        user

        # Programs
        pkgs
        neovim
        zsh
    ];

    system.stateVersion = "24.11"; # Just don't

}
