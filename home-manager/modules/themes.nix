{ pkgs-stable, ... }: {
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

        iconTheme.name = "Tokyonight-Dark";
        iconTheme.package = pkgs-stable.tokyonight-gtk-theme;

        theme.name = "Tokyonight-Storm-BL-LB";
        theme.package = pkgs-stable.tokyonight-gtk-theme;
    };
} 
