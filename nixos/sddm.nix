{pkgs, ...}:

{
    # As of right now broken
    services.displayManager.enable = true;
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        package = pkgs.kdePackages.sddm;
        theme = "sddm-astronaut-theme";
        # catppuccin = {
        #     enable = true;
        #     background = ../wallpapers/nixos-wallpaper-catppuccin-macchiato.png;
        #     assertQt6Sddm = true;
        # };
    };

}
