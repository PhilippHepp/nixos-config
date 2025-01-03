{ pkgs-stable, ... }: 

let
    variant = "macchiato";
in

{
    # qt = {
    #     enable = true;
    #     platformTheme.name = "gtk";
    #     style.name = "Catppuccin-Frappe";
    #     style.package = pkgs.libsForQt5.qt5ct;
    # };

    gtk = {
        enable = true;

        cursorTheme.name = "Bibata-Modern-Ice";
        cursorTheme.package = pkgs-stable.bibata-cursors;

        iconTheme.name = "Papirus-Dark";
        iconTheme.package = pkgs-stable.catppuccin-papirus-folders.override {flavor = variant;};

        theme.name = "catppuccin-macchiato-blue-standard";
        theme.package = pkgs-stable.catppuccin-gtk.override {inherit variant;};
    };
} 
