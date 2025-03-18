let
    withPath = import ../../lib/withPath.nix;
in

{
    settings = rec {
        hostname = "wsl";
        system = "x86_64-linux";
        username = "donielmaker";
        mail = "daniel.schmidt0204@gmail.com";
        dotfiles = "/home/${username}/.config";
        #kb_layout = "de";
        #monitor = ", 1920x1080@60hz, auto, 1";
        timezone = "Europe/Berlin";
    };

    nixosModules = withPath ../../nixos [
        # System
        /system/settings.nix
        /system/networking.nix
        /system/user.nix

        # Programs
        /programs/pkgs.nix
        /programs/neovim.nix
        /programs/zsh.nix
    ];

    hmModules = [../../home-manager/home.nix] ++ withPath ../../home-manager/modules [
        /oh-my-posh.nix
        /zsh.nix
        /neovim.nix
        /git.nix
    ];
}
