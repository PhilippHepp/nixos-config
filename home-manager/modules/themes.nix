{ pkgs, ... }: {
    qt = {
        enable = true;
    };

    gtk = {
        enable = true;

        cursorTheme.name = "Bibata-Modern-Ice";
        cursorTheme.package = pkgs.bibata-cursors;

        theme.package = pkgs.tokyonight-gtk-theme;
        theme.name = "Tokyonight-Storm-BL";
        
    };

}
