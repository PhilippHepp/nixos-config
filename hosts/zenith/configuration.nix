{inputs, ...}:

{
    imports = with inputs.self.nixosModules; [
        ./hardware-configuration.nix

        # System
        settings
        networking
        bootloader
        user

        # Programs
        pkgs
        neovim
        zsh
        steam

        # Modules
        sound
        graphics
        openrgb
        sddm
        nvidia
    ];

    system.stateVersion = "24.05"; # Just don't
}
