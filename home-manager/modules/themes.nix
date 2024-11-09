{ pkgs, pkgs-stable, inputs, ... }: {
    qt = {
        enable = true;
        platformTheme.name = "gtk3";
        style.name = "adwaita";
    };

    gtk = {
        enable = true;

        cursorTheme.name = "Bibata-Modern-Ice";
        cursorTheme.package = pkgs.bibata-cursors;

        theme.name = "Tokyonight-Storm-BL";
        theme.package = pkgs-stable.tokyonight-gtk-theme;
    };

}
