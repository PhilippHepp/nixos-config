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
        # qt

        # Programs
        neovim
        zsh
        steam

        # Modules
        sound
        graphics
        openrgb
        sddm
        amd
    ];

    environment.systemPackages = with pkgs; [
        libsForQt5.qt5ct
        # Programs
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

    system.stateVersion = "24.11"; # Just don't
}
