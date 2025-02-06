let
    Dlib = import ../../lib {};
in

{
    settings = rec {
        hostname = "nix-server";
        system = "x86_64-linux";
        username = "donielmaker";
        mail = "daniel.schmidt0204@gmail.com";
        dotfiles = "/home/${username}/.config";
        # kb_layout = "us";
        # monitor = ", 2560x1440@144hz, auto, 1";
        # timezone = "Europe/Berlin";
    };

    nixosModules = Dlib.withPath ../../nixos [
        # System
        /system/settings.nix
        /system/networking.nix
        /system/bootloader.nix
        /system/user.nix

        # Programs
        /programs/pkgs.nix
        # /programs/neovim.nix
        # /programs/zsh.nix
        # /programs/steam.nix

        # Modules
        # /hardware/sound.nix
        # /hardware/graphics.nix
        # /hardware/openrgb.nix
        # /hardware/bluethooth.nix
        # /hardware/ntfs.nix
        # /displayManagers/sddm.nix
        # /gpu/nvidia.nix
        # /gpu/amd.nix
    ];

    hmModules = [../../home-manager/home.nix] ++ Dlib.withPath ../../home-manager/modules [
        # /oh-my-posh.nix
        # /hyprland.nix
        # /alacritty.nix
        # /themes.nix
        #/firefox.nix
        # /zsh.nix
        # /neovim.nix
        #/github.nix
        /git.nix
        # /hypridle.nix
    ];

    imports = [./hardware-configuration.nix];
    system.stateVersion = "24.05"; # Just don't
}
