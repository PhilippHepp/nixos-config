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
        steam

        # Modules
        sound
        graphics
        sddm
    ];

    environment.systemPackages = with pkgs; [
        # Programs
        brave
        steam
        lutris
        protonup-qt
        nemo
        hyprpicker
	vesktop
        spotify
        prismlauncher
        obsidian
        google-chrome
        # steam
        geeqie
        (flameshot.override { enableWlrSupport = true; })
        # Other
        home-manager
    ];

    file.Systems."/home/philipp/Arch" = {
        device = "dev/sda2";
	fsType = "ext4";
        options = [
	    "users"
	    "nofail"
	    "exec"
	];
    };

    system.stateVersion = "24.11"; # Just don't
}
