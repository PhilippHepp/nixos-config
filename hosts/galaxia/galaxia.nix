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
