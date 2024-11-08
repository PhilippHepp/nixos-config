{ pkgs, ... }: {
    gtk = {
        enable = true;

        cursorTheme.name = "Bibata-Modern-Ice";
        cursorTheme.package = pkgs.bibata-cursors;

        theme.name = "Tokyonight-Storm-BL";
        theme.package = pkgs.tokyonight-gtk-theme;
    };

}
