{ inputs, username, lib, ... }:

{
    imports = with inputs.self.homeManagerModules; [
        rofi
        oh-my-posh
        zsh
        neovim
        git
        hyprland
        firefox
        themes
        hypridle
        kitty
        flameshot
    ];

    home = {
        inherit username;
        homeDirectory = lib.mkForce "/home/${username}";
        stateVersion = "24.11";
    };
}
