{pkgs, ...}:

{
    services.displayManager.enable = true;
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        theme = "catppuccin-macchiato";
        package = pkgs.kdePackages.sddm;
        settings = {
            General = {
                Numlock = "on";
            };
        };
    };

    environment.systemPackages = [ (pkgs.catppuccin-sddm.override {flavor = "macchiato"; loginBackground = true;}) ];
}
