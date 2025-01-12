{pkgs, ...}:

let
    background = pkgs.nixos-artwork.wallpapers.nineish-dark-gray.gnomeFilePath;
in 

{
    services.displayManager = {
        enable = true;
        sddm = {
            enable = true;
            wayland.enable = true;
            theme = "Elegant";
        };
    };

    environment.systemPackages = with pkgs; [
        libsForQt5.qt5.qtgraphicaleffects
        (pkgs.elegant-sddm.override {themeConfig.General.background = background;})
    ];
}
