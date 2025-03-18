let
    withPath = import ../../lib/withPath.nix;
in

{
    settings = rec {
        hostname = "galaxia";
        system = "x86_64-linux";
        username = "donielmaker";
        mail = "daniel.schmidt0204@gmail.com";
        dotfiles = "/home/${username}/.config";
        kb_layout = "de";
        monitor = ", 1920x1080@60hz, auto, 1";
        timezone = "Europe/Berlin";
    };

    nixosModules = withPath ../../nixos [
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
        /hardware/bluethooth.nix
        /displayManagers/sddm.nix
        /gpu/intel.nix
        /hardware/ntfs.nix
    ];

    homeModules = withPath ../../home-manager/modules [
        /oh-my-posh.nix
        /hyprland.nix
        /themes.nix
        /zsh.nix
        /neovim.nix
        /git.nix
        /hypridle.nix
        /kitty.nix
        /flameshot.nix
    ] ++ [../../home-manager/home.nix];
}
