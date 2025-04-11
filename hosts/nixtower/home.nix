{ inputs, username, lib, ... }:

{
    imports = with inputs.self.homeManagerModules; [
	rofi
        oh-my-posh
        zsh
        git
        hyprland
        firefox
        themes
        hypridle
        kitty
        flameshot
	neovim
    ];

    home = {
        inherit username;
        homeDirectory = lib.mkForce "/home/${username}";
        stateVersion = "24.11";
    };
    
}
