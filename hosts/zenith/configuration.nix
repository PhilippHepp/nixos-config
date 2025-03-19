{inputs, pkgs, ...}:

{
    imports = with inputs.self.nixosModules; [
        ./hardware-configuration.nix

        # System
        settings
        networking
        bootloader
        user

        # Programs
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

    environment.systemPackages = with pkgs; [
        # Programs
        obsidian
        vesktop
        brave
        nemo
        hyprpicker
        # steam
        geeqie
        (flameshot.override { enableWlrSupport = true; })
        # Other
        home-manager
    ];

    system.stateVersion = "24.05"; # Just don't
}
