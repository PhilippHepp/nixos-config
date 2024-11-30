{ pkgs, pkgs-stable, ... }: {
    # qt = {
    #     enable = true;
    #     platformTheme.name = "qt5ct";
    #     # style.name = "catppuccin-frappe";
    # };

    gtk = {
        enable = true;

        cursorTheme.name = "Bibata-Modern-Ice";
        cursorTheme.package = pkgs.bibata-cursors;

        theme.name = "Tokyonight-Storm-BL-LB";
        theme.package = pkgs-stable.tokyonight-gtk-theme;
    };
}
