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
        zsh
        steam
	neovim

        # Modules
        sound
        graphics
        sddm
	gc
    ];

    environment.systemPackages = with pkgs; [
        # Programs
        (blender.override { cudaSupport = true; })
        xorg.xrandr
	brave
        nemo
        hyprpicker
	vesktop
	spotify-player
        prismlauncher
        obsidian
        geeqie
	yazi
	networkmanagerapplet
	brightnessctl
        inputplumber
        haruna
        libsForQt5.qt5ct
	qt6ct
        bemenu
	toipe
	bat
	ascii-image-converter
	wordgrinder
	asciiquarium
	# steam
	steam
	lutris
	protonup-qt
        (flameshot.override { enableWlrSupport = true; })
        # Other
        home-manager
    ];
    
    fileSystems = {
        "/home/philipp/Arch" = {
            device = "dev/sda2";
	    fsType = "ext4";
            options = [
	        "users"
	        "nofail"
	        "exec"
	    ];
        };
        "/home/philipp/HDD" = {
            device = "dev/sdb1";
            fsType = "ntfs-3g";
            options = [
                "users"
                "nofail"
                "exec"
            ];
        };
    };
    
    boot.supportedFilesystems.ntfs = true;
    services.gvfs.enable = true;
    
    system.stateVersion = "24.11"; # Just don't
}
