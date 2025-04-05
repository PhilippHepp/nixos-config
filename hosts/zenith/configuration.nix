{inputs, pkgs, ...}:

{
    imports = with inputs.self.nixosModules; [
        ./hardware-configuration.nix
        inputs.disko.nixosModules.disko

        # System
        settings
        networking
        bootloader
        disko
        user

        # Programs
        neovim
        steam
        zsh

        # Modules
        sound
        graphics
        openrgb
        # sddm
        gdm
        amd
    ];

    environment.systemPackages = with pkgs; [
        libsForQt5.qt5ct
        alsa-scarlett-gui

        # Programs
        protonup-qt
        lutris
        prismlauncher
        steam

        vesktop
        brave
        nemo
        hyprpicker
        geeqie
        (flameshot.override { enableWlrSupport = true; })
        # Other
        home-manager
    ];

    system.stateVersion = "24.11"; # Just don't
}
