let
    Dlib = import ../../lib {};
in

rec {
    settings = rec {
        hostname = "zenith";
        system = "x86_64-linux";
        username = "donielmaker";
        mail = "daniel.schmidt0204@gmail.com";
        dotfiles = "/home/${username}/.config";
        kb_layout = "de";
        monitor = ", 2560x1440@144hz, auto, 1";
        timezone = "Europe/Berlin";
    };

    nixosModules = Dlib.withPath ../../nixos [
        # System
        /system/settings.nix
        /system/networking.nix
        /system/bootloader.nix
        /system/user.nix

        # Programs
        /programs/pkgs.nix
        /programs/neovim.nix
        /programs/zsh.nix

        # Modules
        /hardware/sound.nix
        /hardware/graphics.nix
        # /hardware/bluethooth.nix
        # /hardware/ntfs.nix
        /displayManagers/sddm.nix
        /gpu/nvidia.nix
    ];

    hmModules = [../../home-manager/home.nix];
    # Packages only this device should have

    imports = [./hardware-configuration.nix];
    system.stateVersion = "24.05"; # Just don't
}
