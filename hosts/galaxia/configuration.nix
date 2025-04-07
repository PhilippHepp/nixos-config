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
        nvidia
        
        # Programs
        neovim
        zsh

        # Modules
        sound
        graphics
        sddm
    ];

    environment.systemPackages = with pkgs; [
        # Programs
        brave
        nemo
        hyprpicker
	vesktop
        # steam
        geeqie
        (flameshot.override { enableWlrSupport = true; })
        # Other
        home-manager
    ];

    system.stateVersion = "24.11"; # Just don't
}
