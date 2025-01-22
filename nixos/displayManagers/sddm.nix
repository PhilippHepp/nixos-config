{pkgs, ...}:

{
    services.displayManager.enable = true;
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        theme = "catppuccin-macchiato";
        package = pkgs.kdePackages.sddm;
    };

    environment.systemPackages = [ (pkgs.catppuccin-sddm.override {flavor = "macchiato"; loginBackground = true;}) ];
}
