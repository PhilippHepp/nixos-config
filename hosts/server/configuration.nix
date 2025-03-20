{inputs, pkgs, ...}:

{
    imports = with inputs.self.nixosModules; [
        ./hardware-configuration.nix
        inputs.disko.nixosModules.disko

        # System
        settings
        networking
        bootloader
        user
        disko

        # Programs
        neovim
        zsh
    ];

    # environment.systemPackages = with pkgs; [
    #     # Programs
    #     obsidian
    #     vesktop
    #     brave
    #     nemo
    #     hyprpicker
    #     # steam
    #     geeqie
    #     (flameshot.override { enableWlrSupport = true; })
    #     # Other
    #     home-manager
    # ];

    system.stateVersion = "24.11"; # Just don't
}
